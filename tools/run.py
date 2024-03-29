# BreadBin emulator.  ROM definition as Intel HEX format or binary. 

import sys
import msvcrt


# Facility to get a single character from input (Windows only)
def read8bitchar():
    if msvcrt.kbhit():
        ch = msvcrt.getch()
        b = ord(ch) & 0xFF
        if b==3:  # support for Ctrl-C
            sys.exit()
        if b==13: # use \n throught
            return 10
        return b
    else:
        return -1

mnemonic = [ "SET", " IN", "OUT", " OP", "  X", "NOP", "BRE", "JMP" ]
asm =[
"BRK","ORA","COP","ORA","TSB","ORA","ASL","ORA","PHP","ORA","ASL","PHD","TSB","ORA","ASL","ORA",
"BPL","ORA","ORA","ORA","TRB","ORA","ASL","ORA","CLC","ORA","INC","TCS","TRB","ORA","ASL","ORA",
"JSR","AND","JSL","AND","BIT","AND","ROL","AND","PLP","AND","ROL","PLD","BIT","AND","ROL","AND",
"BMI","AND","AND","AND","BIT","AND","ROL","AND","SEC","AND","DEC","TSC","BIT","AND","ROL","AND",
"RTI","EOR","WDM","EOR","MVP","EOR","LSR","EOR","PHA","EOR","LSR","PHK","JMP","EOR","LSR","EOR",
"BVC","EOR","EOR","EOR","MVN","EOR","LSR","EOR","CLI","EOR","PHY","TCD","JMP","EOR","LSR","EOR",
"RTS","ADC","PER","ADC","STZ","ADC","ROR","ADC","PLA","ADC","ROR","RTL","JMP","ADC","ROR","ADC",
"BVS","ADC","ADC","ADC","STZ","ADC","ROR","ADC","SEI","ADC","PLY","TDC","JMP","ADC","ROR","ADC",
"BRA","STA","BRL","STA","STY","STA","STX","STA","DEY","BIT","TXA","PHB","STY","STA","STX","STA",
"BCC","STA","STA","STA","STY","STA","STX","STA","TYA","STA","TXS","TXY","STZ","STA","STZ","STA",
"LDY","LDA","LDX","LDA","LDY","LDA","LDX","LDA","TAY","LDA","TAX","PLB","LDY","LDA","LDX","LDA",
"BCS","LDA","LDA","LDA","LDY","LDA","LDX","LDA","CLV","LDA","TSX","TYX","LDY","LDA","LDX","LDA",
"CPY","CMP","REP","CMP","CPY","CMP","DEC","CMP","INY","CMP","DEX","WAI","CPY","CMP","DEC","CMP",
"BNE","CMP","CMP","CMP","PEI","CMP","DEC","CMP","CLD","CMP","PHX","STP","JML","CMP","DEC","CMP",
"CPX","SBC","SEP","SBC","CPX","SBC","INC","SBC","INX","SBC","NOP","XBA","CPX","SBC","INC","SBC",
"BEQ","SBC","SBC","SBC","PEA","SBC","INC","SBC","SED","SBC","PLX","XCE","JSR","SBC","INC","SBC"
]

class Board:
    def __init__(self):
        pass

    def wr(self,address,value):
        print(value,end='\n',flush=True)
            
    def rd(self,address):
        return 0xff

    def dump(self,address,len):
        pass

class BreadBoard(Board):
    def __init__(self, extrarom):
        Board.__init__(self)
        self.extraram = [-1]*(1<<19)
        self.extrarom = extrarom
        self.romwritesequence = 0
        
    def wr(self,address,value):
#        print(format(address,"06x"),"<-",format(value,"02x"))
        if (address & 0xC00000) == 0x000000:    # writing to RAM
            self.extraram[address&0x7ffff] = value
        elif (address & 0xC00000) == 0x400000:  # writing to IO
            self.output(value)
        elif (address & 0xC00000) == 0xC00000:  # writing to ROM
            lowadr = address & 0x7FFF
            if self.romwritesequence == 0:
                self.romwritesequence = 1 if lowadr==0x5555 and value==0xAA else 0
            elif self.romwritesequence == 1:
                self.romwritesequence = 2 if lowadr==0x2AAA and value==0x55 else 0
            elif self.romwritesequence == 2:
                self.romwritesequence = 0
                if lowadr==0x5555 and value==0x80:  # continue with sector erase trigger
                    self.romwritesequence = 3
                if lowadr==0x5555 and value==0xA0:  # complete write-byte trigger
                    self.romwritesequence = 6
            elif self.romwritesequence == 3:
                self.romwritesequence = 4 if lowadr==0x5555 and value==0xAA else 0
            elif self.romwritesequence == 4:
                self.romwritesequence = 5 if lowadr==0x2AAA and value==0x55 else 0
            elif self.romwritesequence == 5:
                if value==0x30:                 # sector erase sequence complete
                    for i in range(4096):
                        self.extrarom[(address&0x7F000) + i] = 0xff
                    self.romwritesequence = 7
            elif self.romwritesequence == 6:    # this actually writes the byte
                self.extrarom[address&0x7ffff] = self.extrarom[address&0x7ffff] & value
                self.romwritesequence = 7
    def rd(self,address):
        v = 0
        if (address & 0xC00000) == 0x000000:     # reading from RAM 
            v = self.extraram[address & 0x7ffff]
            if v<0:
                v=0
        elif (address & 0xC00000) == 0x400000:   # reading from IO
            v = self.input()
        elif (address & 0xC00000) == 0xC00000:
            v = self.extrarom[address & 0x7ffff] # reading from ROM
            if self.romwritesequence<7 or self.romwritesequence>12:
                self.romwritesequence=0
            else:
                self.romwritesequence = self.romwritesequence+1
                v = (self.romwritesequence & 1) << 6
#        print(format(v,"02x"))
        return v
    
    def output(self,value):
        print("OUT "+format(value,"08b"),end='\n',flush=True)

    def input(self):
        return 0xff

    def dump(self,a,len):
        s = ""
        for address in range(a,a+len):
            v = 0
            if (address & 0xC00000) == 0x000000:     # reading from RAM 
                v = self.extraram[address & 0x7ffff]
            elif (address & 0xC00000) == 0x400000:   # reading from IO
                v = self.input()
            elif (address & 0xC00000) == 0xC00000:   # reading from ROM
                v = self.extrarom[address & 0x7ffff] 
            s = s + format(v,"02x")
        return s

class BreadBinBoard(BreadBoard):
    def __init__(self, extrarom):
        BreadBoard.__init__(self, extrarom)
        self.collectedbits = 0
        self.rts = 1
        self.inputbits = []
        
    def output(self,value):
#        print("OUT "+format(value,"08b"),end='\n',flush=True)
        # collect serial bits and print
        if self.collectedbits!=0:
            self.collectedbits = (self.collectedbits>>1) | ((value & 0x01) << 8)
            if (self.collectedbits & 1) == 1:  # mark bit reached end position
                print (chr(self.collectedbits>>1),end='',flush=True)
                self.collectedbits = 0            
        elif (value&0x01) == 0x00:  # detected start bit
            self.collectedbits = 0x100  # start with only the mark bit
        # keep track of the RTS output
        self.rts = (value&0x02)>>1

    def input(self):
        # when the bit buffer has run empty and program still wants to get
        # data, next character is fetched and prepared
        if self.rts==0 and len(self.inputbits)==0:
            b = read8bitchar()
            # bit serialization
            if b>=0:
                bitserialize(self.inputbits, b)
        # as long as there is stuff in the serialized buffer, receive it
        bit = 1  # idle state of input line
        if len(self.inputbits)>0:
            bit = self.inputbits.pop(0)
        value = 0x3F | (bit<<7)   # additionally keep CTS input asserted
#        print("IN  "+format(value,"08b"),end='\n',flush=True)
        return value

def bitserialize(bitlist, b):
    bitlist.append(0);  # start bit
    for i in range(8):
        bitlist.append(b & 0x01)
        b = b>>1
    bitlist.append(1);  # stop bit
#    print ("bitlist:", bitlist)

def hextobytes(line):
    b = []
    if len(line)>=5 and line[0]==':':
        for i in range ((len(line)-3)>>1):
            b.append(int(line[1+2*i:3+2*i],16))
    return b        

def readtoromfile(rom, filename):
    if filename.lower().endswith(".hex"):
        f = open(filename, "r")
        segment = 0
        for line in f:
            b = hextobytes(line.strip())
            if len(b)>=6 and b[3]==2:
                segment = (b[4]*256+b[5]) * 16
            elif len(b)>4 and b[3]==0 and len(b)>=b[0]+4:
                a = b[1]*256 + b[2];
                for i in range(b[0]):
                    addr = segment+a+i
                    if rom[addr]!=255:
                        print ("Rom definition conflict:",addr)
                    else:
                        rom[addr] = b[4+i]
        f.close()
    else:
        print ("Can not read format: "+filename);
   
    
def readromfile(filename):
    rom = [255]*(1<<19)
    for n in filename.split(','):
        readtoromfile(rom,n)
    return rom
        

def printableram(ram):
    return ("{2:0>2X}{1:0>2X}{0:0>2X} "   # PC
            "{4:0>2X}{3:0>2X} "           # A
            "{5:0>2X} "                   # DBR
            "{7:0>2X}{6:0>2X} "           # D
            "{9:0>2X}{8:0>2X} "           # X
            "{11:0>2X}{10:0>2X} "         # Y
            "{13:0>2X}{12:0>2X} "         # S
            "{14:0>2X} "                  # CFLAG
            "{15:0>2X} "                  # ZFLAG
            "{16:0>2X} "                  # XFLAG
            "{17:0>2X} "                  # MFLAG
            "{18:0>2X} "                  # VFLAG
            "{19:0>2X} "                  # NFLAG
            "{20:0>2X} "                  # TMP0
            "{21:0>2X} "                  # TMP1
            "{22:0>2X} "                  # TMP2
            "{23:0>2X} "                  # TMP3
            "{24:0>2X} "                  # TMP4
            "{25:0>2X} "                  # TMP5
            "{26:0>2X} "                  # TMP6
            "{27:0>2X} "                  # TMP7
            "{28:0>2X} "                  # TMP8
            "{29:0>2X}{30:0>2X}{31:0>2X}" # consts
            ).format(*ram)

def alu(a,b,op):
    x = a if (op&0b1000)!=0 else 0
    c = 1 if a==0xff and (op&0b0100)!=0 else 0
    m = op&0b0011
    if m==0b0000:      # ADD
        return (x+b+c)&0xff
    elif m==0b0001:    # OVF
        return 1 if x+b+c>0xff else 0
    elif m==0b0010:    # NAND
        return 0xff ^ (x & b)
    else:              # AVG
        return (x+b+c)>>1

def execute(board,rom,stop,onlyjumps,afterjump):
    didjump = 0
    start = stop-200000 if onlyjumps else stop-1000

    # state of the controller, start with dummy values
    reg = [42]*32
    a = 47
    b = 11
    c = 33
    op = 8
    ir = 77
    pc = 55 
    
    # start values after reset sequence
    reg[0] = 0
    ir = 0xe0
    pc = 0
    
    # only run for the desired number of steps
    for step in range(stop):
         # unless instruction overrides this, the pc just increments
        nextpc = ((pc+1) & 0x00ff) | (pc&0xff00)

        # basic tracing
        if (step>=start) and ((didjump==1) or not onlyjumps):
            mempos = reg[0] | (reg[1]<<8) | (reg[2]<<16)
            print (step,
                   (board.dump(mempos-1,3) + " "+ asm[pc>>8]+" " if onlyjumps else format(pc,"x").zfill(4) ),
                   mnemonic[ir//32],
                   format(ir&31, "x").zfill(2),
                   "A:",format(a, "x").zfill(2),
                   "B:",format(b, "x").zfill(2),
                   "OP:",format(op, "x").zfill(1),
                   "M:",printableram(reg))

        # execution
        instr = ir & 0xe0
        param = ir & 0x1f
        didjump = didjump+1
        if instr==0x00:    # IN
            reg[param] = board.rd((c<<16)|(b<<8)|a)
        elif instr==0x20:  # SET
            reg[param] = alu(a,b,op)
        elif instr==0x40:  # OUT
            board.wr((c<<16)|(b<<8)|a,reg[param])
        elif instr==0x60:  # OP
            op = param & 0b1111
        elif instr==0x80:  # X
            c = b
            b = a
            a = reg[param]
        elif instr==0xA0:  # NOP
            pass
        elif instr==0xC0:  # BRE
            if (a%2)==0:
                nextpc = (pc & 0xff00) | (param<<3)
                if nextpc==pc:
                    print ("Execution stops after",step,"steps at {0:0>4X}".format(pc));
                    return
        elif instr==0xE0:  # JMP
            nextpc = reg[param]<<8
            didjump = 0
            if reg[param]==afterjump:
                start=0
        
        # for debugging: reading a 0xFF instruction halts the processor
        if rom[pc]==0xFF:
            print ("Hit the 0xFF instruction after",step,"steps at:",
                   format(pc,"x").zfill(4) )            
            return
        
        # fetch instruction and progress program counter
        ir = rom[pc]
        pc = nextpc

        


# decode parameters
stop = 100000000000
onlyjumps = False
afterjump = -1
breadboard =  None
breadbin = None
for i in range(len(sys.argv)-1):
    if sys.argv[i]=='-stop':
        stop = int(sys.argv[i+1])
    elif sys.argv[i]=='-jumps':
        onlyjumps = True
    elif sys.argv[i]=='-jump':
        afterjump = int(sys.argv[i+1])
    elif sys.argv[i]=='-breadboard':
        breadboard = sys.argv[i+1]
    elif sys.argv[i]=='-breadbin':
        breadbin = sys.argv[i+1]

# execute
rom = readromfile(sys.argv[len(sys.argv)-1])
board = BreadBinBoard(readromfile(breadbin)) if breadbin!=None else BreadBoard(readromfile(breadboard)) if breadboard!=None else Board()
execute(board,rom,stop,onlyjumps,afterjump)
    
