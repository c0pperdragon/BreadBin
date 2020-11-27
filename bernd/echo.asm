    include core.asm

    ; Short test program to write "Hello World" to the serial port
    
    AREA DATA 1
MAIN_CTR:
    BYTE 0
    
    AREA CODE 100
MAIN:
    SET R1 0
    STORE R1 MAIN_CTR
    
TEXTLOOP:
    ; fetch next byte to write
    LOAD R1 MAIN_CTR
    SET R0 .MESSAGE
    ADD R1 R0
    SET R0 ^MESSAGE
    DP R0
    LD R1 R1
    ; write byte to serial
    STORE R1 L0
    INVOKE SEND
    ; increment counter
    LOAD R1 MAIN_CTR
    SET R0 1
    ADD R1 R0
    STORE R1 MAIN_CTR
    ; loop for all bytes
    LOAD R1 MAIN_CTR
    SET R0 12
    BGE R0 R1 TEXTLOOP

    ; delay before printing next line
    SET R1 250 
    STORE R1 L0
    INVOKE DELAY
        
    BRA MAIN

MESSAGE:
    BYTE 72 101 108 108 111 32 87 111 114 108 100 33 10
