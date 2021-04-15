# Assembler to create machine code for the BreadBin CPU.
# Output is in Intel HEX format.

import sys

class AssemblerException(Exception):
    pass

def findany(str, patterns):
    first = -1
    for p in patterns:
        pos = str.find(p)
        if pos>=0 and (first<0 or pos<first):
            first = pos
    return first

def areaisused(buffer, start, len):
    for i in range(start,start+len):
        if buffer[i] != None:
            return True
    return False

def findfreearea(buffer, start, len):
    if len>256:
        raise AssemblerException("Can not support area size greater than 256")
    # quick search for some empty area
    while buffer[start+len-1] != None:
        start = start+len;
    # search for empty space not crossing page boundaries 
    while (start>>8) != ((start+len-1)>>8) or areaisused(buffer, start ,len):
        start = start+1
    return start;

def tokenize(line):
    # strip comments and uppercase everything
    comment = line.find(";")
    if comment>=0:
        line = line[0:comment]
    # break appart on white space and additionally seperate out ':' or '=' 
    tokens = []
    for token in line.split():
        first = findany(token, [":","="])
        if first>=0:
            if first>0:
                tokens.append(token[:first])
            tokens.append(token[first:first+1])
            if first<len(token)-1:
                tokens.append(token[first+1:])
        else:
            tokens.append(token)
    return tokens

def evaluate(identifiers, s):
    try:
        if s in identifiers:
            return identifiers[s]
        elif len(s)>2 and s[0]=="'":
            return ord(s[1])
        elif len(s)>0 and s[0]=='.': 
            return evaluate(identifiers, s[1:]) & 0xff
        elif len(s)>0 and s[0]=='^': 
            return (evaluate(identifiers, s[1:]) >> 8) & 0xff
        elif len(s)>0 and s[0]=='$':
            v = int(s[1:],16)
            return v
        else:
            return int(s,10)
    except ValueError as e:
        raise AssemblerException("Can not parse number "+s)

def op(identifiers, finalpass, tokens, tidx, bitlen):
    if tidx >= len(tokens):
        raise AssemblerException("Missing operand")
    elif not finalpass:
        return 0
    else:
        value = evaluate(identifiers, tokens[tidx])
        if value<0 or value>=(1<<bitlen):
            raise AssemblerException("Operand exceeds range")
        else:
            return value

def operator(tokens, tidx):
    if tidx >= len(tokens):
        raise AssemblerException("Missing operator")
    o = tokens[tidx];
    if o=='OVL':
        return 0
    elif o=='ADD':
        return 1
    elif o=='SUB':
        return 2
    elif o=='MUL':
        return 3
    elif o=='DIV':
        return 4
    elif o=='AND':
        return 5
    elif o=='OR':
        return 6
    elif o=='EOR':
        return 7
    else:
        raise AssemblerException("Unknown operator")

def branchtarget(identifiers, finalpass, tokens, tidx, pc):
    if tidx >= len(tokens):
        raise AssemblerException("Missing branch target")
    elif not finalpass:
        return 0
    else:
        pagestart = pc+2;
        pagestart = pagestart - (pagestart & 0xff)
        value = evaluate(identifiers, tokens[tidx])
        if value<pagestart or value>pagestart+255:
            raise AssemblerException("Branch target unreachable")
        else:
            return value & 0xff

def printlisting(lst,startaddress, bytes, line):
    perpart = 4
    numparts = (max(len(bytes),1) +perpart-1) // perpart
    for i in range(numparts):
        x = [ "{:04x} ".format(startaddress+i*perpart) ]
        for j in range(perpart):
            if i*perpart+j < len(bytes):
                x.append("{:02x} ".format(bytes[i*perpart+j]) )
            else:
                x.append("   ");
        if i==0:
            x.append(" ")
            x.append(line)
        print ("".join(x), file=lst)

def processline(identifiers, finalpass, tokens, codeaddress, outbuffer):
    I = identifiers
    G = finalpass
    T = tokens
    pc = codeaddress[0]
    bytes = []

    if len(tokens)>=2 and tokens[1]==":":
        pad = (8-(pc%8))%8
        bytes = [0x60] * pad
        if not finalpass:
            id = tokens[0]
            if id in identifiers:
                raise AssemblerException("May not redefine '"+id+"'")
            else:
                identifiers[id] = pc+pad
        tokens.pop(0)
        tokens.pop(0)
        
    if len(tokens)==0:
        pass
    elif len(tokens)>=3 and tokens[1]=='=':
        if not finalpass:
            id = tokens[0]
            value = evaluate(I,tokens[2])
            if id in identifiers:
                raise AssemblerException("May not redefine '"+id+"'")
            else:
                identifiers[id] = value
    elif len(tokens)==2 and tokens[0]=="ORG":
        codeaddress[0] = evaluate(identifiers, tokens[1])

    elif tokens[0]=="SET":
        bytes = [ 0x00 | op(I,G,T, 1, 5) ]
    elif tokens[0]=="IN":
        bytes = [ 0x20 | op(I,G,T, 1, 5) ]
    elif tokens[0]=="OUT":
        bytes = [ 0x40 | op(I,G,T, 1, 5) ]
    elif tokens[0]=="OUT2":
        bytes = [ 0x60 | op(I,G,T, 1, 5) ]
    elif tokens[0]=="OP":
        bytes = [ 0x60 | operator(T, 1) ]
    elif tokens[0]=="A":
        bytes = [ 0x80 | op(I,G,T, 1, 5) ]
    elif tokens[0]=="B":
        bytes = [ 0xA0 | op(I,G,T, 1, 5) ]
    elif tokens[0]=="BEQ":
        addr = op(I,G,T, 1, 16)
        if (addr//256) != (pc//256):
            raise AssemblerException("Branch target out of scope")
        if (addr%8) !=0:
            raise AssemblerException("Missaligned branch target")
        bytes = [ 0xC0 | (addr//8)]
    elif tokens[0]=="JMP":
        bytes = [ 0xE0 | op(I,G,T, 1, 5) ]
    elif tokens[0]=="NOP":
        bytes = [ 0x60 | 0 ]
        
    else:
        raise AssemblerException("Unknown instruction "+tokens[0])     

    codeaddress[0] += len(bytes)
    return bytes

def process(identifiers, sourcefile, alreadyloaded, codeaddress, outbuffer, finalpass, lst):
    if sourcefile in alreadyloaded:
        return
    else:
        alreadyloaded.append(sourcefile)
    src = open(sourcefile, "r")
    linenumber = 1
    numerrors = 0
    for rawline in src:
        line = rawline.rstrip()
        body = line.lstrip()
        if body.startswith("include") or body.startswith("INCLUDE"):
            process(identifiers,body[7:].lstrip(),alreadyloaded,codeaddress,outbuffer,finalpass,lst)
        else:
            try:
                tokens = tokenize(line)
                romaddress = codeaddress[0]
                bytes = processline(identifiers, finalpass, tokens, codeaddress,outbuffer)
                if finalpass:
                    if len(tokens)==3 and tokens[0]=="DUPLICATE":
                        frm = op(identifiers, True, tokens, 1, 16)
                        bytes = [0 if x==None else x for x in outbuffer[frm:frm+len(bytes)]]
                    if areaisused(outbuffer, romaddress, len(bytes)):
                        raise AssemblerException("Overlapping ranges")
                    printlisting(lst,romaddress, bytes, line)
                outbuffer[romaddress:romaddress+len(bytes)] = bytes
            except AssemblerException as e:
                print(sourcefile+":"+str(linenumber)+" "+str(e),file=sys.stderr)
                numerrors += 1
        linenumber += 1
    src.close()
    if numerrors>0:
        raise AssemblerException("Encountered "+str(numerrors)+" errors")


def formatwithchecksum(record):
    line = ":"
    sum = 0x00
    for i in range(len(record)):#
        b = record[i]
        line = line + "{:02x}".format(b)
        sum += b
    return line + "{:02x}".format((-sum) & 0xff)
        
def printhexfile(hexfile, buffer):
    dest = open(hexfile, "w")
    start=0
    while start<len(buffer):
        if buffer[start] == None:
            start += 1
        else:
            record = [ 0x00, (start>>8) & 0xff, start&0xff, 0x00 ]
            l = 0
            while l<16 and start+l<len(buffer) and buffer[start+l] != None:
                record.append(buffer[start+l])
                l += 1
            record[0] = l
            print(formatwithchecksum(record), file=dest)
            start += l
    print(formatwithchecksum([0x00,0x00,0x00,0x01]), file=dest)                
    dest.close()
        
def asm(sourcefile,hexfile,listfile):
    try:
        identifiers = { }
        rom = [None]*65536
        process(identifiers, sourcefile, [], [0], rom, False, None)
        rom = [None]*65536

        lst = open(listfile, "w")
        process(identifiers, sourcefile, [], [0], rom, True, lst)
        lst.close()
        
        printhexfile(hexfile, rom)
    except AssemblerException as e:
        print (e,file=sys.stderr) 

if len(sys.argv)>=2: 
    asm(sys.argv[1]+".asm",sys.argv[1]+".hex",sys.argv[1]+".lst")
else:
    print("No filename given to assemble",file=sys.stderr)
