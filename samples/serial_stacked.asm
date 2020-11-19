; serial communcation library.
; output is sent to pin 0 of port 3, with 38400 baud.

    ; Write a whole block of data to the serial port
    ;  parameter:
    ;   0,1  return address    -6,-5
    ;   2,3  data address      -4,-3,
    ;   4    length            -2
    ;  locals:
    ;   5    loop counter      -1
    AREA $800 100
SERIAL_WRITEDATA:
    ; add stack frame for subroutine calls
    SET R0 6
    ADD R3 R0

    ; init loop counter
    SET R0 255 ; -1
    ADD R0 R3
    ZERO R1
    ST R1 R0
    
SERIAL_DATALOOP:
    SET R0 255 ; -1
    ADD R0 R3
    LD R1 R0   ; loop counter
    SET R0 254 ; -2
    ADD R0 R3
    LD R2 R0   ; length
    BGE R1 R2 SERIAL_DATADONE

    SET R0 252   ; -4
    ADD R0 R3
    LD R0 R0
    SET R1 253   ; -3
    ADD R1 R3
    LD R1 R1    
    SET R2 255   ; -1
    ADD R2 R3
    LD R2 R2
    ADD R0 R2
    DP R1    
    LD R2 R0   ; data from buffer    
    SET R0 2
    DP R0

    SET R0 2
    ADD R0 R3
    ST R2 R0
    CALL SERIAL_WRITEBYTE
        
    SET R0 255 ; -1
    ADD R0 R3
    LD R1 R0   
    SET R2 1
    ADD R1 R2
    ST R1 R0       
    BRA SERIAL_DATALOOP:

SERIAL_DATADONE:
    ; remove stack frame and return
    SET R0 6
    SUB R3 R0
    RETURN

    ; Write one byte to the serial port
    ;  parameter:
    ;   0,1  return address          -4,-3
    ;   2    data                    -2
    ; locals: 
    ;   3    index                   -1
    AREA $800 100
SERIAL_WRITEBYTE:
    ; add stack frame for subroutine calls
    SET R0 4
    ADD R3 R0
    ; start bit
    SET R0 2
    ADD R0 R3
    SET R1 0
    ST R1 R0
    CALL SERIAL_WRITEBIT
    ; set loop index
    SET R0 255  ; -1 
    ADD R0 R3
    SET R1 8
    ST R1 R0
SERIAL_WRITELOOP:
    ; write next bit
    SET R0 254  ; -2
    ADD R0 R3   ; *data
    LD R1 R0    ; data
    SET R0 2
    ADD R0 R3   ; *bit
    ST R1 R0
    CALL SERIAL_WRITEBIT
    ; shift bits
    SET R0 254  ; -2
    ADD R0 R3
    LD R1 R0
    SET R2 2
    DIV R1 R2
    ST R1 R0
    ; decrement loop index
    SET R0 255  ; -1
    ADD R0 R3
    LD R1 R0
    SET R2 1
    SUB R1 R2
    ST R1 R0
    ; continue writing
    BLE R2 R1 SERIAL_WRITELOOP
    ; write stop bits
    SET R0 2
    ADD R0 R3
    SET R1 1
    ST R1 R0
    CALL SERIAL_WRITEBIT
    SET R0 2
    ADD R0 R3
    SET R1 1
    ST R1 R0
    CALL SERIAL_WRITEBIT
    ; remove stack frame and return
    SET R0 4
    SUB R3 R0
    RETURN
    
    ; Write one bit to the serial port, including pause for timing (roughly)
    ;  parameter:
    ;   0,1  return address
    ;   2    either 1 or 0 in the lowest bit (higher bits are irrelevant)
    AREA $800 100
SERIAL_WRITEBIT:
    ; fetch bit from stack
    SET R0 2
    ADD R0 R3
    LD R1 R0     
    ; mask to keep other ouput pins high
    SET R0 $FE
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
    RETURN
    
