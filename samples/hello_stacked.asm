    include startup.asm
    include serial_stacked.asm
    
    ; Write "Hello World" to the serial port
    AREA $0800 100
MESSAGE:
    BYTE 72 101 108 108 111 32 87 111 114 108 100 33 10
MAIN:
    ; set up stack frame for subroutine calls
    SET R0 2
    DP R0
    SET R3 0
    
    ; call output procedure
    SET R1 2
    ADD R1 R3
    SET R0 .MESSAGE
    ST R0 R1
    SET R1 3
    ADD R1 R3
    SET R0 ^MESSAGE
    ST R0 R1
    SET R1 4
    ADD R1 R3
    SET R0 13
    ST R0 R1
    
    CALL SERIAL_WRITEDATA
    
STOP:
    BRA STOP
