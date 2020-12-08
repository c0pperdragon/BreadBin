    include core.asm
    include print.asm
    include math16.asm
    
    ; Short test program to write a prompt to the serial port and then
    ; echo all incomming bytes back 
        
    AREA CODE 256
MESSAGE:
    BYTE 69 99 104 111 32 116 101 115 116 0
    
MAIN:
    SET R2 $11
    SET R3 $47
    STORE R2 R3 L0
    CALL PRINT16

    SET R2 $9F
    SET R3 $10
    STORE R2 R3 L0
    SET R2 $CB
    SET R3 $10
    STORE R2 R3 L2
    CALL ADD16
    CALL PRINT16

    SET R2 $9F
    SET R3 $10
    STORE R2 R3 L0
    SET R2 $CB
    SET R3 $10
    STORE R2 R3 L2
    CALL SUB16
    CALL PRINT16
    
    CALL PRINTNEWLINE
    
    SET R2 .20000
    SET R3 ^20000
    STORE R2 R3 L0
    SET R2 .17323
    SET R3 ^17323
    STORE R2 R3 L2
    CALL MUL16
    CALL PRINT16
    CALL PRINTNEWLINE

    SET R2 .MESSAGE
    SET R3 ^MESSAGE
    STORE R2 R3 L0
    CALL PRINT
    
    CALL PRINTNEWLINE
    
    GOTO ECHOING
    
    
    AREA CODE 100
ECHOING:    
    ; receive input
    CALL RECEIVE
    ; debug: write to port 2
    STORE R1 PORT2
    ; replace CR with CR-LF
    SET R0 13
    XOR R0 R1
    SET R3 1
    BGE R0 R3 UNCHANGED
    SET R1 13
    STORE R1 L0
    CALL TRANSMIT
    SET R1 10
    STORE R1 L0
    CALL TRANSMIT
    BRA ECHOING
    ; don't change other characters
UNCHANGED:
    STORE R1 L0
    CALL TRANSMIT
    BRA ECHOING

