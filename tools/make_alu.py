# Generate the content of the 512kB flash to work as the ALU

def op(o,a,b):
    if o==0:
        if a+b>255:                    # OVL
            return 1
        else:
            return 0
    elif o==1:                         # ADD
        return (a+b) & 0xff            
    elif o==2:                         # INC
        return (a+1) & 0xff        
    elif o==3:                         # CRY
        if a==255:
            return (b+1) & 0xff
        else:
            return b;
    elif o==4:                         # ROR
        return ((b&0x01)<<7) | ((a&0xfe)>>1)
    elif o==5:                         # NOR
        return (a | b) ^ 255                   
    else:
        return 0

table = bytearray(256*256*8)
for o in range(8):
    for a in range(256):
        for b in range(256):
            table[a | (b<<8) | (o<<16)] = op(o,a,b)
            
dest = open("alu.bin", "wb")
dest.write(table)
dest.close()
