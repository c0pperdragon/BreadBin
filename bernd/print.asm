; ------ various print routines (strings, numbers, etc) --------------------------

    AREA CODE 30
PRINTNEWLINE_CRLF:
    BYTE 13 10 0
    ; --- Write a line break (ascii 13 10) to the serial port
PRINTNEWLINE:
    SET R1 .PRINTNEWLINE_CRLF
    STORE R1 L0
    SET R1 ^PRINTNEWLINE_CRLF
    STORE R1 L1
    GOTO PRINT


    AREA DATA 4
PRINT_RETADDR:
    BYTE 0 0 
PRINT_PTR:
    BYTE 0 0
    
    ; --- Write a null-terminated string to the serial port.
    ; param L0 ... low byte of pointer to string
    ; param L1 ... high byte of pointer to string
    AREA CODE 40
PRINT:
    STORE R2 R3 PRINT_RETADDR

    LOAD R2 R3 L0
    STORE R2 R3 PRINT_PTR
PRINT_LOOP:    
    LOAD R2 R3 PRINT_PTR
    DP R3
    LD R1 R2
    ZERO R0
    BLE R1 R0 PRINT_DONE

    STORE R1 L0
    CALL TRANSMIT
    
    LOAD R2 R3 PRINT_PTR
    SET R0 1
    ADD R2 R0
    BGE R2 R0 PRINT_NOOVERFLOW
    ADD R3 R0
PRINT_NOOVERFLOW:
    STORE R2 R3 PRINT_PTR
    BRA PRINT_LOOP
    
PRINT_DONE:    
    LOAD R2 R3 PRINT_RETADDR
    JMP R2 R3

    AREA CODE 20
    ; ---- Write a single number (0 - 15) as a hex digit
    ; param L0: the number to write
PRINTDIGIT:
    LOAD R1 L0
    SET R0 9
    BLE R1 R0 PRINTDIGIT_ISDECIMAL
    SET R0 7   ; gap between '9' and 'A' in ASCII
    ADD R1 R0
PRINTDIGIT_ISDECIMAL:
    SET R0 48  ; ASCII '0'
    ADD R1 R0
    STORE R1 L0
    GOTO TRANSMIT  ; - tail call
    
    
    AREA CODE
    ; --- Write decimal representation of an 8-bit unsigned number to the serial port.
    ; param L0 ... the number
PRINT8:    
    ZERO R1
    STORE R1 L1
    GOTO PRINT16  ; tail call
    
    
    AREA DATA 4
PRINT16_RETADDR:
    BYTE 0 0 
PRINT16_LOW:
    BYTE 0
PRINT16_HIGH:
    BYTE 0
    
    AREA CODE 50
    ; --- Write decimal representation of a 16-bit signed number to the serial port.
    ; param L0 ... low byte 
    ; param L1 ... high byte
PRINT16:
    STORE R2 R3 PRINT16_RETADDR
    LOAD R2 R3 L0
    STORE R2 R3 PRINT16_LOW

    SET R0 16
    DIV R3 R0
    STORE R3 L0
    CALL PRINTDIGIT

    LOAD R3 PRINT16_HIGH
    SET R0 $0f
    AND R3 R0
    STORE R3 L0
    CALL PRINTDIGIT
    
    LOAD R3 PRINT16_LOW
    SET R0 16
    DIV R3 R0
    STORE R3 L0
    CALL PRINTDIGIT
    
    LOAD R3 PRINT16_LOW
    SET R0 $0f
    AND R3 R0
    STORE R3 L0
    
    LOAD R2 R3 PRINT16_RETADDR
    GOTO PRINTDIGIT   ; tail call
