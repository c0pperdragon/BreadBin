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
    while buffer[start+len-1] != None:
        start = start+len;
    while areaisused(buffer, start ,len):
        start = start+1
    return start;

def tokenize(line):
    # strip comments and uppercase everything
    comment = line.find(";")
    if comment>=0:
        line = line[0:comment]
    # uppercase everything - rely on pythons definiton of "upper"
    line = line.upper()
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

def reg(tokens, tidx, bitpos):
    if tidx >= len(tokens):
        raise AssemblerException("Missing register specifier")
    if tokens[tidx]=="R0":
        return 0 << bitpos;
    elif tokens[tidx]=="R1":
        return 1 << bitpos;
    elif tokens[tidx]=="R2":
        return 2 << bitpos;
    elif tokens[tidx]=="R3":
        return 3 << bitpos
    else:
        raise AssemblerException("Invalid register name");

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

def printlisting(startaddress, bytes, line):
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
        print ("".join(x))

def processline(identifiers, finalpass, tokens, codeaddress, outbuffer):
    I = identifiers
    G = finalpass
    T = tokens
    pc = codeaddress[1]
    bytes = []
    if len(tokens)==0:
        pass
    elif len(tokens)>=2 and tokens[1]==":":
        if not finalpass:
            id = tokens[0]
            if id in identifiers:
                raise AssemblerException("May not redefine '"+id+"'")
            else:
                identifiers[id] = pc
    elif len(tokens)>=3 and tokens[1]=='=':
        if not finalpass:
            id = tokens[0]
            value = evaluate(I,tokens[2])
            if id in identifiers:
                raise AssemblerException("May not redefine '"+id+"'")
            else:
                identifiers[id] = value
    elif len(tokens)==2 and tokens[0]=="ORG":
        codeaddress[0] = codeaddress[1] = evaluate(identifiers, tokens[1])
    elif len(tokens)==3 and tokens[0]=="ORG":
        codeaddress[0] = evaluate(identifiers, tokens[1])
        codeaddress[1] = evaluate(identifiers, tokens[2])
    elif len(tokens)==2 and tokens[0]=="AREA":
        codeaddress[0] = codeaddress[1] = findfreearea(
            outbuffer, evaluate(identifiers, tokens[1]),
            1)
    elif len(tokens)==3 and tokens[0]=="AREA":
        codeaddress[0] = codeaddress[1] = findfreearea(
            outbuffer, evaluate(identifiers, tokens[1]),
            evaluate(identifiers, tokens[2]))
    elif tokens[0]=="BYTE":
        for idx in range(1,len(tokens)):
            bytes.append(op(I,G,T, idx, 8))
    elif tokens[0]=="GT":
        bytes = [ 0x00 | reg(T, 1, 0) | reg(T, 2, 2) ]
    elif tokens[0]=="ADD":
        bytes = [ 0x10 | reg(T, 1, 0) | reg(T, 2, 2) ]
    elif tokens[0]=="SUB":
        bytes = [ 0x20 | reg(T, 1, 0) | reg(T, 2, 2) ]
    elif tokens[0]=="MUL":
        bytes = [ 0x30 | reg(T, 1, 0) | reg(T, 2, 2) ]
    elif tokens[0]=="DIV":
        bytes = [ 0x40 | reg(T, 1, 0) | reg(T, 2, 2)]
    elif tokens[0]=="AND":
        bytes = [ 0x50 | reg(T, 1, 0) | reg(T, 2, 2) ]
    elif tokens[0]=="OR":
        bytes = [ 0x60 | reg(T, 1, 0) | reg(T, 2, 2) ]
    elif tokens[0]=="XOR":
        bytes = [ 0x70 | reg(T, 1, 0) | reg(T, 2, 2) ]
    elif tokens[0]=="ZERO":
        bytes = [ 0x70 | reg(T, 1, 0) | reg(T, 1, 2) ]
    elif tokens[0]=="BLE":
        bytes = [ 0x80 | reg(T, 1, 0) | reg(T, 2, 2) , branchtarget(I,G,T, 3, pc) ]
    elif tokens[0]=="BGE":
        bytes = [ 0x80 | reg(T, 1, 2) | reg(T, 2, 0) , branchtarget(I,G,T, 3, pc) ]
    elif tokens[0]=="BRA":
        bytes = [ 0x80 , branchtarget(I,G,T, 1, pc) ]
    elif tokens[0]=="JMP":
        bytes = [ 0x90 | reg(T, 1, 0) | reg(T, 2, 2) ]
    elif tokens[0]=="DP":
        if len(tokens)>1 and tokens[1] in ["R0","R1","R2","R3"]:
            bytes = [ 0xA0 | reg(T, 1, 2) ]
        else:
            bytes = [ 0xA1 | (op(I,G,T, 1, 3)<<1) ]
    elif tokens[0]=="SET":
        bytes = [ 0xB0 | reg(T, 1, 0) , op(I,G,T, 2, 8) ]
    elif tokens[0]=="LD":
        bytes = [ 0xC0 | reg(T, 1, 0) | reg(T, 2, 2) ]
    elif tokens[0]=="ST":
        bytes = [ 0xD0 | reg(T, 1, 0) | reg(T, 2, 2) ]
    elif tokens[0]=="INVOKE":
        address = op(I,G,T, 1, 16)
        raddr = pc + 9
        bytes = [
            0xB0 | (2<<0), (raddr&0xff),      # SET R2 .raddr
            0xB0 | (3<<0), (raddr>>8),        # SET R3 ^raddr
            0xB0 | (0<<0), (address&0xff),    # SET R0 .address
            0xB0 | (1<<0), (address>>8),      # SER R1 ^address
            0x90 | (0<<0) | (1<<2)            # JMP R0 R1
        ]
    elif tokens[0]=="LOAD":
        num = len(tokens)-2
        address = op(I,G,T, 1+num, 16)
        bytes = []
        for i in range(num):
            r = reg(T,1+i,0)
            bytes.extend([
                0xB0 | r, (address+i+1)&0xff,  # SET <r> .address+i
                0xC0 | r | (r<<2)              # LD <r> <r>
            ])
    elif tokens[0]=="STORE":
        num = len(tokens)-2
        address = op(I,G,T, 1+num, 16)
        bytes = []
        for i in range(num):
            r = reg(T,1+i,0)
            bytes.extend([
                0xB0 | (0<<0), (address+i+1)&0xff,  # SET R0 .address+i
                0xD0 | r | (0<<2)                   # LD <r> R0
            ])
        
    else:
        raise AssemblerException("Unknown instruction "+tokens[0])     

    codeaddress[0] += len(bytes)
    codeaddress[1] += len(bytes)
    return bytes

def process(identifiers, sourcefile, codeaddress, outbuffer, finalpass):
    src = open(sourcefile, "r")
    linenumber = 1
    numerrors = 0
    for rawline in src:
        line = rawline.rstrip()
        body = line.lstrip()
        if body.startswith("include") or body.startswith("INCLUDE"):
            process(identifiers,body[7:].lstrip(),codeaddress,outbuffer,finalpass)
        else:
            try:
                tokens = tokenize(line)
                romaddress = codeaddress[0]
                bytes = processline(identifiers, finalpass, tokens,
                                    codeaddress,outbuffer)
                if finalpass:
                    if areaisused(outbuffer, romaddress, len(bytes)):
                        raise AssemblerException("Overlapping ranges")
                    printlisting(romaddress, bytes, line)
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
        
def asm(sourcefile,hexfile):
    try:
        identifiers = { }
        rom = [None]*65536
        process(identifiers, sourcefile, [0, 0], rom, False)
        rom = [None]*65536
        process(identifiers, sourcefile, [0, 0], rom, True)
        printhexfile(hexfile, rom)
    except AssemblerException as e:
        print (e,file=sys.stderr) 

if len(sys.argv)>=2: 
    asm(sys.argv[1]+".asm",sys.argv[1]+".hex")
else:
    print("No filename given to assemble",file=sys.stderr)
