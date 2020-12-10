    include core.asm
    include math16.asm

; ------ various print routines (strings, numbers, etc) --------------------------

    ; Write a single character to the standard output (normally serial port)
    AREA CODE 10
PRINT:
    GOTO TRANSMIT
    


    AREA DATA 4
PRINTSTRING_RETADDR:
    BYTE 0 0 
PRINTSTRING_PTR:
    BYTE 0 0
    
    ; --- Write a null-terminated string to the standard output
    ; param L0 ... low byte of pointer to string
    ; param L1 ... high byte of pointer to string
    AREA CODE 40
PRINTSTRING:
    STORE R2 R3 PRINTSTRING_RETADDR

    LOAD R2 R3 L0
    STORE R2 R3 PRINTSTRING_PTR
PRINTSTRING_LOOP:    
    LOAD R2 R3 PRINTSTRING_PTR
    DP R3
    LD R1 R2
    ZERO R0
    BLE R1 R0 PRINTSTRING_DONE

    STORE R1 L0
    CALL TRANSMIT
    
    LOAD R2 R3 PRINTSTRING_PTR
    SET R0 1
    ADD R2 R0
    BGE R2 R0 PRINTSTRING_NOOVERFLOW
    ADD R3 R0
PRINTSTRING_NOOVERFLOW:
    STORE R2 R3 PRINTSTRING_PTR
    BRA PRINTSTRING_LOOP
    
PRINTSTRING_DONE:    
    LOAD R2 R3 PRINTSTRING_RETADDR
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
    GOTO PRINT  ; - tail call

    AREA CODE 30
PRINTNEWLINE_CRLF:
    BYTE 13 10 0
    ; --- Write a line break (ascii 13 10) to the standard output
PRINTNEWLINE:
    SET R1 .PRINTNEWLINE_CRLF
    STORE R1 L0
    SET R1 ^PRINTNEWLINE_CRLF
    STORE R1 L1
    GOTO PRINTSTRING
    
    AREA CODE 10
    ; --- Write a single blank space to the standard output
PRINTSPACE:
    SET R1 32  ; ' '
    STORE R1 L0
    GOTO PRINT

    
    AREA CODE 10
    ; --- Write decimal representation of an 8-bit unsigned number to the standard output
    ; param L0 ... the number
PRINT8:    
    ZERO R1
    STORE R1 L1
    GOTO PRINTHEX  ; tail call


    AREA DATA 4
PRINT16_RETADDR:
    BYTE 0 0 
PRINT16_VALUE:
    BYTE 0 0
PRINT16_BUFFER:
    BYTE 0 0 0 0 0
PRINT16_ENDMARKER:
    BYTE 0
PRINT16_INDEX:
    BYTE 0
    
    AREA CODE 100
    ; --- Write decimal representation of an 8-bit unsigned number to the standard output
    ; param L0 ... low byte of the number
    ; param L1 ... high byte of the number
PRINT16:    
    STORE R2 R3 PRINT16_RETADDR

    ; set up counters
    LOAD R2 R3 L0
    STORE R2 R3 PRINT16_VALUE
    SET R1 .PRINT16_ENDMARKER
    STORE R1 PRINT16_INDEX
    
    ; convert the number from back to front
PRINT16_LOOP:
    ; divide by 10
    LOAD R2 R3 PRINT16_VALUE
    STORE R2 R3 L0
    SET R2 10
    STORE R2 L2
    CALL DIV168
    LOAD R2 R3 L0  ; fetch result to registers
    ; determine the remainder
    LOAD R1 PRINT16_VALUE
    SET R0 10
    MUL R0 R2  ; multiply result back by 10
    SUB R1 R0  ; subtract from dividend get remainder
    ; keep division result for next iteration
    STORE R2 R3 PRINT16_VALUE
    ; write current digit to buffer backwards
    LOAD R2 PRINT16_INDEX
    SET R0 1
    SUB R2 R0
    STORE R2 PRINT16_INDEX
    DP ^PRINT16_BUFFER
    SET R0 48  ; get ASCII value of digit
    ADD R1 R0
    ST R1 R2
    ; continue while value is not 0
    LOAD R2 R3 PRINT16_VALUE
    SET R1 1
    BGE R2 R1 PRINT16_LOOP
    BGE R3 R1 PRINT16_LOOP
    
    ; print the content of the buffer
    LOAD R1 PRINT16_INDEX
    STORE R1 L0
    SET R1 ^PRINT16_BUFFER
    STORE R1 L1 
    
    LOAD R2 R3 PRINT16_RETADDR
    GOTO PRINTSTRING  ; tail call
    
    
    AREA DATA 4
PRINTHEX_RETADDR:
    BYTE 0 0 
PRINTHEX_LOW:
    BYTE 0
PRINTHEX_HIGH:
    BYTE 0
    
    AREA CODE 50
    ; --- Write hexadecimal representation of a 16-bit number to the standard output.
    ; param L0 ... low byte 
    ; param L1 ... high byte
PRINTHEX:
    STORE R2 R3 PRINTHEX_RETADDR
    LOAD R2 R3 L0
    STORE R2 R3 PRINTHEX_LOW

    SET R0 16
    DIV R3 R0
    STORE R3 L0
    CALL PRINTDIGIT

    LOAD R3 PRINTHEX_HIGH
    SET R0 $0f
    AND R3 R0
    STORE R3 L0
    CALL PRINTDIGIT
    
    LOAD R3 PRINTHEX_LOW
    SET R0 16
    DIV R3 R0
    STORE R3 L0
    CALL PRINTDIGIT
    
    LOAD R3 PRINTHEX_LOW
    SET R0 $0f
    AND R3 R0
    STORE R3 L0
    
    LOAD R2 R3 PRINTHEX_RETADDR
    GOTO PRINTDIGIT   ; tail call
