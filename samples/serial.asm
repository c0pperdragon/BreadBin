; serial communcation library.
; output is sent to pin 0 of port 3, with 38400 baud.

    ; -- Write a whole block of data to the serial port
    AREA $0200 6
    ; parameters:
SERIAL_DATA:
    BYTE 0 0
SERIAL_LENGTH:
    BYTE 0
    ; internals
SERIAL_WRITEDATA_RETADDR:
    BYTE 0 0
SERIAL_WRITEDATA_CTR:
    BYTE 0

    AREA $0300 100
SERIAL_WRITEDATA:
    STORE R2 R3 SERIAL_WRITEDATA_RETADDR

    ZERO R1
    STORE R1 SERIAL_WRITEDATA_CTR
    
SERIAL_DATALOOP:
    LOAD R3 SERIAL_WRITEDATA_CTR
    LOAD R2 SERIAL_LENGTH
    BGE R3 R2 SERIAL_DATADONE

    LOAD R1 R2 SERIAL_DATA
    ADD R1 R3
    DP R2
    LD R3 R1
    SET R0 2
    DP R0
    
    STORE R3 SERIAL_BYTE
    INVOKE SERIAL_WRITEBYTE
            
    LOAD R3 SERIAL_WRITEDATA_CTR
    SET R2 1
    ADD R3 R2
    STORE R3 SERIAL_WRITEDATA_CTR    
    BRA SERIAL_DATALOOP

SERIAL_DATADONE:
    LOAD R2 R3 SERIAL_WRITEDATA_RETADDR
    JMP R2 R3

    
    ; -- Write one byte to the serial port
    AREA $0200 6
    ; parameters:
SERIAL_BYTE:
    BYTE 0
    ; internals
SERIAL_WRITEBYTE_RETADDR:
    BYTE 0 0
SERIAL_WRITEBYTE_CTR:
    BYTE 0

    AREA $0300 100
SERIAL_WRITEBYTE:
    STORE R2 R3 SERIAL_WRITEBYTE_RETADDR
    ; start bit
    ZERO R1
    STORE R1 SERIAL_BIT
    INVOKE SERIAL_WRITEBIT
    ; loop index
    ZERO R1
    STORE R1 SERIAL_WRITEBYTE_CTR
SERIAL_WRITELOOP:
    ; write next bit
    LOAD R1 SERIAL_BYTE
    STORE R1 SERIAL_BIT
    INVOKE SERIAL_WRITEBIT
    ; shift bits
    LOAD R1 SERIAL_BYTE
    SET R0 2
    DIV R1 R0
    STORE R1 SERIAL_BYTE
    ; loop index
    LOAD R1 SERIAL_WRITEBYTE_CTR
    SET R0 1
    ADD R1 R0
    STORE R1 SERIAL_WRITEBYTE_CTR
    ; continue
;    LOAD R1 SERIAL_WRITEBYTE_CTR
    SET R0 7
    BGE R0 R1 SERIAL_WRITELOOP    
    ; write stop bits
    SET R1 1
    STORE R1 SERIAL_BIT
    INVOKE SERIAL_WRITEBIT
    INVOKE SERIAL_WRITEBIT
    ; remove stack frame and return
    LOAD R2 R3 SERIAL_WRITEBYTE_RETADDR          
    JMP R2 R3
    
    ; -- Write one bit to the serial port, including pause for timing (roughly)
    AREA $0200 1
    ; parameters:
SERIAL_BIT:
    BYTE 0

    AREA $0300 100
SERIAL_WRITEBIT:
    LOAD R0 SERIAL_BIT
    SET R1 $FE
    OR R1 R0
    ; address output register port 3
    SET R0 1
    DP R0
    SET R0 3
    ST R1 R0
    ; switch back to stack
    SET R0 2
    DP R0
    ; wait loop 
    SET R1 1
    SET R0 80   ; should give approximately 38400 baud
SERIAL_DELAY:
    SUB R0 R1
    BGE R0 R1 SERIAL_DELAY
    JMP R2 R3
