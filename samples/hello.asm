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
    
DONE:
    BRA DONE
