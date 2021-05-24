# BreadBin emulator.  ROM definition as Intel HEX format or binary. 

import sys

mnemonic = [ "SET", " IN", "OUT", " OP", "  X", "NOP", "BBZ", "JMP" ]

class Board:
    def __init__(self):
        pass

    def wr(self,address,value):
        print(value,end='\n',flush=True)
        
    def latch(self,prevb):
        pass
    
    def rd(self,address):
        return 0xff

class BreadBinBoard(Board):
    def __init__(self, extrarom):
        Board.__init__(self)
        self.extraram = [255]*(1<<19)
        self.extrarom = extrarom
        self.bank = 0
        self.collectedbits = 0
        self.rts = 1
        self.inputcharacters = []
        self.inputbits = []
        
    def wr(self,address,value):
        a = (self.bank<<16)+address;
#        print(format(a,"06x"),"<-",format(value,"02x"))
        if (a & 0xC00000) == 0x000000:    # writing to RAM
            self.extraram[a&0x7ffff] = value
        elif (a & 0xC00000) == 0x400000:  # writing to IO
            self.output((a>>8) & 0xff)   # use bits 8-15 of address as data
        
    def rd(self,address):
        v = 0
        a = (self.bank<<16)+address;
        if (a & 0xC00000) == 0x000000:     # reading from RAM 
            v = self.extraram[a & 0x7ffff]
        elif (a & 0xC00000) == 0x400000:   # reading from IO
            v = self.input()
        else:
            v = self.extrarom[a & 0x7ffff] # reading from ROM
#        print(format(a,"06x"),"->",format(v,"02x"))
        return v

    def latch(self,bank):
        self.bank = bank
    
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
            # if necessary fetch new line from console
            if len(self.inputcharacters)==0:
                self.inputcharacters.extend(list(input()))
                self.inputcharacters.append("\n")
            # bit serialization
            bitserialize(self.inputbits, self.inputcharacters.pop(0))
        # as long as there is stuff in the serialized buffer, receive it
        bit = 1  # idle state of input line
        if len(self.inputbits)>0:
            bit = self.inputbits.pop(0)
        value = 0xFC | bit   # additionally keep CTS input asserted
#        print("IN  "+format(value,"08b"),end='\n',flush=True)
        return value

def bitserialize(bitlist, c):
    b = ord(c) & 0xFF
    bitlist.append(0);  # start bit
    for i in range(8):
        bitlist.append(b & 0x01)
        b = b>>1
    bitlist.append(1);  # stop bit    

def hextobytes(line):
    b = []
    if len(line)>=5 and line[0]==':':
        for i in range ((len(line)-3)>>1):
            b.append(int(line[1+2*i:3+2*i],16))
    return b        
    
def readromfile(filename):
    if filename.lower().endswith(".hex"):
        f = open(filename, "r")
        rom = [255]*(1<<19)
        for line in f:
            b = hextobytes(line.strip())
            if len(b)>4 and b[3]==0 and len(b)>=b[0]+4:
                a = b[1]*256 + b[2];
                for i in range(b[0]):
                    rom[a+i] = b[4+i]
        f.close()
        return rom
    else:
        f = open(filename, "rb")
        rom = f.read(1<<19)
        f.close()
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
            "{15:0>2X} "                  # NFLAG
            "{16:0>2X} "                  # ZFLAG
            "{17:0>2X} "                  # MFLAG
            "{18:0>2X} "                  # XFLAG
            "{19:0>2X} "                  # TMP0
            "{20:0>2X} "                  # TMP1
            "{21:0>2X} "                  # TMP2
            "{22:0>2X} "                  # TMP3
            "{23:0>2X} "                  # TMP4
            "{24:0>2X} "                  # TMP5
            "{25:0>2X}{26:0>2X}{27:0>2X}" # consts 
            "{28:0>2X}{29:0>2X}{30:0>2X}" # consts
            "{31:0>2X}"
            ).format(*ram)

def alu(a,b,op):
    if op==0:      # ADD
        return (a+b)&0xff
    elif op==1:    # OVF
        return 1 if a+b>0xff else 0
    elif op==2:    # NAND
        return 0xff ^ (a & b)
    elif op==3:    # REV
        return (
            ((a&1)<<7)|
            ((a&2)<<5)|
            ((a&4)<<3)|
            ((a&8)<<1)|
            ((a&16)>>1)|
            ((a&32)>>3)|
            ((a&64)>>5)|
            ((a&128)>>7))
    elif op==4:    # CRY
        return ((b+1)&0xff) if a==0xff else b
    elif op==5:    # TOP
        return 1 if a==0xff and b==0xff else 0
    elif op==6:    # FF
        return 0xff
    elif op==7:    # ZERO
        return 0
    else:
        return 0

def execute(board,rom,stop,onlyjumps):
    didjump = 0
    start = stop-5000 if onlyjumps else stop-200

    # state of the controller, start with dummy values
    ram = [255]*32
    a = 47
    b = 11
    op = 8
    ir = 77
    pc = 55 
    
    # start values after reset sequence
    ir = 0xe0   
    pc = 0
    ram[0] = 0

    # only run for the desired number of steps
    for step in range(stop):
         # unless instruction overrides this, the pc just increments
        nextpc = ((pc+1) & 0x00ff) | (pc&0xff00)

        # basic tracing
        if (step>=start) and ((didjump==1) or not onlyjumps):
            print (step,
                   format(pc,"x").zfill(4),
                   mnemonic[ir//32],
                   format(ir&31, "x").zfill(2),
                   "A:",format(a, "x").zfill(2),
                   "B:",format(b, "x").zfill(2),
                   "OP:",format(op, "x").zfill(1),
                   "M:",printableram(ram))

        # execution
        instr = ir & 0xe0
        param = ir & 0x1f
        didjump = didjump+1
        if instr==0x00:    # SET
            ram[param] = alu(a,b,op)
        elif instr==0x20:  # IN
            ram[param] = board.rd(b*256+a)
        elif instr==0x40:  # OUT
            board.wr(b*256+a,ram[param])
        elif instr==0x60:  # OP
            op = param & 0x07
        elif instr==0x80:  # X
            board.latch(b)
            b = a
            a = ram[param]
        elif instr==0xA0:  # NOP
            pass
        elif instr==0xC0:  # BRE
            if (a%2)==0:
                nextpc = (pc & 0xff00) | (param<<3)
        elif instr==0xE0:  # JMP
            nextpc = ram[param]<<8
            didjump = 0
        
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
breadbin = None
for i in range(len(sys.argv)-1):
    if sys.argv[i]=='-stop':
        stop = int(sys.argv[i+1])
    elif sys.argv[i]=='-jumps':
        onlyjumps = True
    elif sys.argv[i]=='-breadbin':
        breadbin = sys.argv[i+1]

# execute
rom = readromfile(sys.argv[len(sys.argv)-1])
board = Board() if breadbin==None else BreadBinBoard(readromfile(breadbin))
execute(board,rom,stop,onlyjumps)
    
