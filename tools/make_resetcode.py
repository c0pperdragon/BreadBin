# Generate the content of the low 64K of the ROM flash. This is used
# to implement the reset sequence.
# This reset code should bring the CPU into a defined state, no matter
# what the initial content of all the registers were.
# Reset code must be addressed for at least 15 cycles after power up.
# First regular executed user code then starts at 0000, with R0 cleared.

table = bytearray(256*256)
for a in range(256):
    table[a] = 7<<5              # JMP R0
for page in range(1,256):
    table[page*256+0] = 4<<5     # A R0
    table[page*256+1] = 5<<5     # B R0
    table[page*256+2] = (3<<5) + 7 # OP EOR
    table[page*256+3] = 0<<5     # SET R0
    for a in range(4,256):
        table[page*256+a] = 7<<5 # JMP R0

dest = open("resetcode.bin", "wb")
dest.write(table)
dest.close()
