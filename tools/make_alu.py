# Generate the content of the 512kB flash to work as the ALU

def op(o,a,b):
    if o==0:
        if a>b:                        # MAX
            return a
        else:
            return b
    elif o==1:                         # ADD
        return (a+b) & 0xff            
    elif o==2:                         # SUB
        return (a+256-b) & 0xff        
    elif o==3:                         # MUL
        return (a*b) & 0xff            
    elif o==4:                         # DIV
        if b!=0:                         # regular division
            return int(a/b) 
        elif a==0:                       # 0/0 -> 1
            return 1
        else:
            return 255                   # n/0 -> 255
    elif o==5:                         # AND
        return a & b                   
    elif o==6:                         # OR
        return a | b                   
    elif o==7:                         # EOR
        return a ^ b                   
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
