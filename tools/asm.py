# Assembler to create machine code for the BreadBin CPU.
# Output is in Intel HEX format.

import sys

class AssemblerException(Exception):
    pass

class Macro:
    def __init__(self, arguments):
        self.arguments = arguments
        self.lines = [ ]

def replaceall(list, identifiers, values):
    l2 = []
    for t in list:
        if t in identifiers:
            l2.append(values[identifiers.index(t)])
        else:
            l2.append(t)
    return l2
    

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
    if o=='B':
        return 0b0000
    elif o=='ZERO':
        return 0b0001
    elif o=='FF':
        return 0b0010
    elif o=='HALF':
        return 0b0011
    elif o=='CRY':
        return 0b0100
    elif o=='TOP':
        return 0b0101
    elif o=='ADD':
        return 0b1000
    elif o=='OVF':
        return 0b1001
    elif o=='NAND':
        return 0b1010
    elif o=='AVG':
        return 0b1011
    elif o=='AVG':
        return 0b1011
    elif o=='ROR':
        return 0b1111
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

def printlisting(lst,startaddress, bytes, tokens):
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
            x.append(" ".join(tokens))
        print ("".join(x), file=lst)

def processline(identifiers, macros, finalpass, tokens, codeaddress, outbuffer,lst):
    I = identifiers
    G = finalpass
    T = tokens
    pc = codeaddress[0]
    bytes = []

    if len(tokens)>=2 and tokens[1]==":":
        pad = (8-(pc%8))%8
        bytes = [0xA0] * pad    # insert NOPs 
        if not finalpass:
            id = tokens[0]
            if id in identifiers:
                raise AssemblerException("May not redefine '"+id+"'")
            else:
                identifiers[id] = pc+pad
        T = tokens[2:]
        
    if len(T)==0:
        pass
    elif len(T)>=3 and T[1]=='=':
        if not finalpass:
            id = T[0]
            value = evaluate(I,T[2])
            if id in identifiers:
                raise AssemblerException("May not redefine '"+id+"'")
            else:
                identifiers[id] = value
    elif len(T)==2 and T[0]=="ORG":
        a = evaluate(identifiers, T[1])
        if a%256 != 0:
            raise AssemblerException("May only start segment on page boundary")
        codeaddress[0] = a

    elif T[0]=="SET":
        bytes = [ 0x00 | op(I,G,T, 1, 5) ]
    elif T[0]=="IN":
        bytes = [ 0x20 | op(I,G,T, 1, 5) ]
    elif T[0]=="OUT":
        bytes = [ 0x40 | op(I,G,T, 1, 5) ]
    elif T[0]=="OP":
        bytes = [ 0x60 | operator(T, 1) ]
    elif T[0]=="X":
        bytes = [ 0x80 | op(I,G,T, 1, 5) ]
    elif T[0]=="NOP":
        bytes = [ 0xA0 ]
    elif T[0]=="BRE":
        addr = op(I,G,T, 1, 16)
        if finalpass:
            if (addr//256) != (pc//256):
                raise AssemblerException("Branch target out of scope: "+("{:02x}".format(addr)))
            if (addr%8) !=0:
                raise AssemblerException("Missaligned branch target")
        bytes = [ 0xC0 | ((addr%256)//8)]
    elif T[0]=="JMP":
        bytes = [ 0xE0 | op(I,G,T, 1, 5) ]
        
    elif T[0] in macros:
        m = macros[T[0]]
        if len(m.arguments) != len(T)-1:
            raise AssemblerException("Macro expansion with different number of arguments: "+T[0])   
        else:
            if finalpass:
                printlisting(lst,codeaddress[0], bytes, tokens)
            for l in m.lines:
                replaced = replaceall(l, m.arguments, T[1:])
                processline(identifiers,macros,finalpass, replaced,codeaddress,outbuffer,lst)
            tokens = []
            
    else:
        raise AssemblerException("Unknown instruction "+T[0])     

    if finalpass:
        if areaisused(outbuffer, codeaddress[0], len(bytes)):
            raise AssemblerException("Overlapping ranges")
        outbuffer[codeaddress[0]:codeaddress[0]+len(bytes)] = bytes
        printlisting(lst,codeaddress[0], bytes, tokens)
    codeaddress[0] += len(bytes)

def process(identifiers, macros, sourcefile, alreadyloaded, codeaddress, outbuffer, finalpass, lst):
    if sourcefile in alreadyloaded:
        return
    else:
        alreadyloaded.append(sourcefile)
    src = open(sourcefile, "r")
    linenumber = 1
    numerrors = 0
    currentmacro = None
    for rawline in src:
        line = rawline.rstrip()
        body = line.lstrip()
        if body.startswith("include") or body.startswith("INCLUDE"):
            process(identifiers,macros, body[7:].lstrip(),alreadyloaded,codeaddress,outbuffer,finalpass,lst)
        else:
            try:
                tokens = tokenize(line)
                if currentmacro!=None:
                    if len(tokens)>=1 and tokens[0]=='ENDMACRO':
                        currentmacro = None
                    elif not finalpass:
                        currentmacro.lines.append(tokens)
                elif len(tokens)>=1 and tokens[0]=='MACRO':
                    if finalpass:
                        currentmacro = macros[tokens[1]]
                    elif tokens[1] in macros:
                        raise AssemblerException("May not redefine macro'"+tokens[1]+"'")
                    else:
                        currentmacro = Macro(tokens[2:])
                        macros[tokens[1]]=currentmacro 
                else:
                    processline(identifiers, macros, finalpass, tokens, codeaddress,outbuffer,lst)
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

def pagefills(rom):
    fills = [0]*256
    for a in range(len(rom)):
        if rom[a]==None:
            pass
        else:
            fills[a//256] = (a%256)+1
    return fills
        
def asm(sourcefile,hexfile,listfile):
    try:
        print ("PASS 1")
        identifiers = { }
        macros = { }
        process(identifiers, macros, sourcefile, [], [0], None, False, None)

        print ("PASS 2")
        rom = [None]*65536
        lst = open(listfile, "w")
        process(identifiers, macros, sourcefile, [], [0], rom, True, lst)
        lst.close()
        
        printhexfile(hexfile, rom)

        fills = pagefills(rom);
        m = max(fills)
        print ("HIGHEST PAGE FILL",m,"FOR",fills.index(m))
    except AssemblerException as e:
        print (e,file=sys.stderr) 

if len(sys.argv)>=2: 
    asm(sys.argv[1]+".asm",sys.argv[1]+".hex",sys.argv[1]+".lst")
else:
    print("No filename given to assemble",file=sys.stderr)
