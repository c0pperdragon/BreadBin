# BreadBin emulator.  ROM definition as Intel HEX format. 

import sys

class Board:
    def __init__(self):
        pass
#        self.xaddrlo = 0
#        self.xaddrhi = 0
#        self.uarttxcounter = -1
#        self.uarttxdata = 0
#        self.uartrxdata = 0
#        self.uartrxcounter = -1
#        self.inputbuffer = []

    def wr(self,value):
        print(value,end='\n',flush=True)
        
    def rd(self):
        return 0xff

def hextobytes(line):
    b = []
    if len(line)>=5 and line[0]==':':
        for i in range ((len(line)-3)>>1):
            b.append(int(line[1+2*i:3+2*i],16))
    return b        
    
def readhexfile(hexfile):
    rom = [255]*(1<<19)
    hex = open(hexfile, "r")
    for line in hex:
        b = hextobytes(line.strip())
        if len(b)>4 and b[3]==0 and len(b)>=b[0]+4:
            a = b[1]*256 + b[2];
            for i in range(b[0]):
                rom[a+i] = b[4+i]
    hex.close()
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
#                   "RAM:",ram)

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
            ram[param] = board.rd()
        elif instr==0x40:  # OUT
            board.wr(ram[param])
        elif instr==0x60:  # OP
            op = param & 0x07
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

        
def run(hexfile, steps,show):
    rom = readhexfile(hexfile)
    board = Board()
    execute(board,rom,steps,show)
#    print(board.ram[0:1000])

if len(sys.argv)>1:
    steps = 10000000
    show = -1
    if len(sys.argv)>2:
        steps = int(sys.argv[2])
    if len(sys.argv)>3:
        show = int(sys.argv[3],16)
    run(sys.argv[1]+".hex",steps,show)
else:
    print("No .hex filename given to run",file=sys.stderr)
