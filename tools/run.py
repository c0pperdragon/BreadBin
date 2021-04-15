# BreadBin emulator.  ROM definition as Intel HEX format. 

import sys

class Board:
    def __init__(self):
        pass

    def wr(self,address,value):
        print(value,end='\n',flush=True)
        
    def wr2(self,value):
        pass
    
    def rd(self,address):
        return 0xff

class ByteMachineBoard(Board):
    def __init__(self, extrarom):
        Board.__init__(self)
        self.extraram = [255]*(1<<19)
        self.extrarom = extrarom
        self.bank = 0
        self.rombank = False
        self.iomode = False
        
    def wr(self,address,value):
        if self.rombank:         # by writing to ROM, switch to IO mode
            self.iomode = True
            self.output(value)
        else:                    # by writing to RAM, switch to RAM mode
            self.iomode = False
            self.extraram[self.bank*(1<<16)+address] = value
        
    def wr2(self,value):
        self.bank = value & 0x07
        self.rombank = (value & 0x80) != 0
    
    def rd(self,address):
        if self.rombank:
            return self.extrarom[bank*(1<<16)+address]
        elif self.iomode:
            return self.input()
        else:
            return self.extraram[bank*(1<<16)+address]

    def output(self,value):
        print(format(value,"08b"),end='\n',flush=True)

    def input(self):
        return 255


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
        

def execute(board,rom,steps,show):
    tracing = False

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

    for i in range(steps):
        # turn on full tracing at specified code point
        if pc==show:
            tracing = True

        # unless instruction overrides this, the pc just increments
        nextpc = ((pc+1) & 0x00ff) | (pc&0xff00)

        # basic tracing
        if tracing:  # i>=steps-show:
            print ("PC:",format(pc,"x").zfill(4),
                   "IR:",format(ir, "x").zfill(2),
                   "A:",format(a, "x").zfill(2),
                   "B:",format(b, "x").zfill(2),
                   "OP:",format(op, "x").zfill(1) )

        # execution
        instr = ir & 0xe0
        param = ir & 0x1f
        if instr==0x00:  # SET
            result = 0
            if op==0:      # OVL
                result = 1 if a+b>255 else 0
            elif op==1:    # ADD
                result = (a+b) & 0xff
            elif op==2:    # SUB
                result = (a+256-b) & 0xff
            elif op==3:    # MUL
                result = (a*b) & 0xff
            elif op==4:    # DIV
                if b==0:
                    result = 1 if a==0 else 255
                else:
                    result = a // b
            elif op==5:    # AND
                result = a & b
            elif op==6:    # OR
                result = a | b
            elif op==7:    # EOR
                result = a ^ b
            ram[param] = result
        elif instr==0x20:  # IN
            ram[param] = board.rd(b*256+a)
        elif instr==0x40:  # OUT
            board.wr(b*256+a,ram[param])
        elif instr==0x60:  # OP
            op = param & 0x07
            board.wr2(ram[param])
        elif instr==0x80:  # A
            a = ram[param]
        elif instr==0xA0:  # B
            b = ram[param]
        elif instr==0xC0:  # BEQ
            if a==b:
                nextpc = (pc & 0xff00) | (param<<3)
        elif instr==0xE0:  # JMP
            nextpc = ram[param]<<8
        
        # fetch instruction and progress program counter
        ir = rom[pc]
        pc = nextpc



# decode parameters
steps = 1000000000
show = -1
extra = None
for i in range(len(sys.argv)-1):
    if sys.argv[i]=='-steps':
        steps = int(sys.argv[i+1])
    elif sys.argv[i]=='-show':
        show = int(sys.argv[i+1])
    elif sys.argv[i]=='-extra':
        extra = sys.argv[i+1]

# execute
rom = readromfile(sys.argv[len(sys.argv)-1])
board = Board() if extra==None else ByteMachineBoard(readromfile(extra))
execute(board,rom,steps,show)
