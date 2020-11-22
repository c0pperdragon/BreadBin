    include startup.asm
    include serial.asm

    ; private storage
    AREA $0200 2
MAIN_RETADDR:
    BYTE 0 0
    
    ; Write "Hello World" to the serial port
    AREA $0300 100
MESSAGE:
    BYTE 72 101 108 108 111 32 87 111 114 108 100 33 10
MAIN:
    SET R0 2
    DP R0
    
    SET R2 .MESSAGE
    SET R3 ^MESSAGE
    STORE R2 R3 SERIAL_DATA
    SET R2 13
    STORE R2 SERIAL_LENGTH
    INVOKE SERIAL_WRITEDATA
    
    SET R0 1
    SET R1 0
    SET R2 0
    SET R3 50
DELAY:    
    SUB R1 R0
    BGE R1 R0 DELAY
    SUB R2 R0
    BGE R2 R0 DELAY    
    SUB R3 R0
    BGE R3 R0 DELAY
        
    BRA MAIN
