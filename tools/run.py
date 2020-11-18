# BreadBin emulator.  ROM definition as Intel HEX format.

import sys

class Board:
    def __init__(self, rom):
        self.ram = [0]*(1<<16)
        self.xram = [0]*(1<<19)
        self.rom = rom
        self.xaddrlo = 0;
        self.xaddrhi = 0;
    def write(self,address,value):
        if address>=512:
            self.ram[address] = value
        elif address<256:
            xaddress = (self.xaddrhi<<16) | (self.xaddrlo<<8) | address
            if (xaddress<(1<<19)):
                pass   # no write to rom
            else:
                self.xram[xaddress-(1<<19)] = value
        elif address==256:
            self.xaddrlo = value;
        elif address==257:
            self.xaddrhi = value;
        elif address==259:  # out port 3
            print(format(value, "b").zfill(8)) 
    def read(self,address):
        if address>=512:
            return self.ram[address]
        elif address<256:
            xaddress = (self.xaddrhi<<16) | (self.xaddrlo<<8) | address
            if xaddress<(1<<19):
                return self.rom[xaddress]
            elif xaddress<(1<<20):
                return self.xram[xadrdress-(1<<19)]
        else:
            return 0;
        

def hextobytes(line):
    b = []
    if len(line)>=5 and line[0]==':':
        for i in range ((len(line)-3)>>1):
            b.append(int(line[1+2*i:3+2*i],16))
    return b        
    
def readhexfile(hexfile):
    rom = [0]*(1<<19)
    hex = open(hexfile, "r")
    for line in hex:
        b = hextobytes(line.strip())
        if len(b)>4 and b[3]==0 and len(b)>=b[0]+4:
            a = b[1]*256 + b[2];
            for i in range(b[0]):
                rom[a+i] = b[4+i]
    hex.close()
    return rom

def execute(board,steps,show):
    # dummy start values
    dp = 88
    reg = [47,11,8,15]   
    # well-defined start values
    pc = 0
    xmemptr = 0

    for i in range(steps):

        # instrution fetch
        opcode = board.read(pc)
        if i>=steps-show:
            print ("PC:",format(pc,"x").zfill(4),
                   "DP:",dp,
                   "REG:",reg,
                   "OP:",format(opcode, "x").zfill(2))
        x = opcode&0x03
        y = (opcode>>2)&0x03
        instruction = opcode>>4
        pc = (pc+1) & 0xffff

        # execute        
        if instruction == 0:    # GT
            if reg[x]>reg[y]:
                reg[x] = 1
            else:
                reg[x] = 0
        elif instruction == 1:  # ADD
            reg[x] = (reg[x]+reg[y])&0xff
        elif instruction == 2:  # SUB
            reg[x] = (reg[x]+256-reg[y])&0xff
        elif instruction == 3:  # MUL
            reg[x] = (reg[x]*reg[y])&0xff
        elif instruction == 4:  # DIV
            if reg[y]==0:
                reg[x]=0
            else:
                reg[x] = int(reg[x]/reg[y])
        elif instruction == 5:  # AND
            reg[x] = reg[x] & reg[y]
        elif instruction == 6:  # OR
            reg[x] = reg[x] | reg[y]
        elif instruction == 7:  # XOR
            reg[x] = reg[x] ^ reg[y]
        elif instruction == 8:  # BLE
            operand = board.read(pc)
            pc = (pc+1) & 0xffff
            if reg[x]<=reg[y]:
                pc = (pc & 0xff00) | operand
        elif instruction == 9:  # JMP
            pc = reg[x] | (reg[y]<<8)
        elif instruction == 10: # DP
            dp = reg[y]
        elif instruction == 11: # SET
            operand = board.read(pc)
            pc = (pc+1) & 0xffff
            reg[x] = operand
        elif instruction == 12: # LD
            reg[x] = board.read(reg[y] | (dp<<8))
        elif instruction == 13: # ST
            board.write (reg[y] | (dp<<8), reg[x])
        
    print ("END")

        
def run(hexfile, steps,show):
    rom = readhexfile(hexfile)
    board = Board(rom)
    execute(board,steps,show)
#    print(board.ram[0:1000])

if len(sys.argv)>1:
    steps = 1000
    show = 0
    if len(sys.argv)>2:
        steps = int(sys.argv[2])
    if len(sys.argv)>3:
        show = int(sys.argv[3])
    run(sys.argv[1]+".hex",steps,show)
else:
    print("No .hex filename given to run",file=sys.stderr)
