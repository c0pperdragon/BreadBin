    include core.asm

    ; Short test program to write a prompt to the serial port and then
    ; echo all incomming bytes back 
    
    AREA DATA
MAIN_CTR:
    BYTE 0
    
    AREA CODE 100
MESSAGE:
    BYTE 69 99 104 111 32 116 101 115 116 10 0
    
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
    ZERO R0
    BGE R0 R1 ECHOING   ; zero terminated string    
    ; write byte to serial
    STORE R1 L0
    INVOKE TRANSMIT
    ; increment counter
    LOAD R1 MAIN_CTR
    SET R0 1
    ADD R1 R0
    STORE R1 MAIN_CTR
    BRA TEXTLOOP

ECHOING:    
    ; copy from incomming to outgoing
    INVOKE RECEIVE
    STORE R1 L0
    INVOKE TRANSMIT
    BRA ECHOING

