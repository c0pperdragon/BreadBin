; ----------- various routines for unsigned 16-bit mathematics ----------------------

;  -- Add two 16 bit values
;  input: L0 low byte of first operand
;         L1 high byte of first operand
;         L2 low byte of second operand
;         L3 high byte of second operand
;  output: L0 low byte of sum
;          L1 high byte of sum
    AREA CODE 30
ADD16:
    STORE R2 R3 L4

    LOAD R2 R3 L0
    LOAD R0 R1 L2
    ADD R3 R1
    ADD R2 R0
    GT R0 R2  ; overflow detection
    ADD R3 R0 ; carry
    STORE R2 R3 L0
    
    LOAD R2 R3 L4
    JMP R2 R3

;  -- Subtract two 16 bit values
;  input: L0 low byte of first operand
;         L1 high byte of first operand
;         L2 low byte of second operand
;         L3 high byte of second operand
;  output: L0 low byte of sum
;          L1 high byte of sum
    AREA CODE 50
SUB16:
    STORE R2 R3 L4

    LOAD R2 R3 L0
    LOAD R0 R1 L2
    SUB R3 R1
    SUB R2 R0
    COPY R1 R2
    LOAD R0 L0
    GT R1 R0  ; underflow detection
    SUB R3 R1 ; borrow
    STORE R2 R3 L0
    
    LOAD R2 R3 L4
    JMP R2 R3

; -- Multiply a 16-bit value with a 4-bit value
;  input: L0 low byte of first operand
;         L1 high byte of first operand
;         L2 second operand (only 4 bit)
;  output: L0 low byte of result
;          L1 high byte of operand
    AREA CODE 100
MUL164:
    STORE R2 R3 L4

    LOAD R3 L2
    SET R0 15
    AND R3 R0    ; keep second operand in R3
    
    LOAD R2 L0   ; compute the carry from low to high byte
    SET R1 16
    AND R2 R1
    MUL R2 R3
    DIV R2 R1    ;    the carry from low nybble to high nybble
    LOAD R0 L0   ;  
    DIV R0 R1    ;    bring high nybble to low position  
    MUL R0 R3    ;    multiply this nybble  
    ADD R0 R2    ;    add carry from low nybble
    DIV R0 R1    ;    normalize the total carry of low byte (now in R0)

    LOAD R1 L1   ; compute high byte and add carry
    MUL R1 R3
    ADD R1 R0
    STORE R1 L1
    
    LOAD R1 L0    ; compute low byte (easy)
    MUL R1 R3
    STORE R1 L0
    
    LOAD R2 R3 L4
    JMP R2 R3
    


    AREA DATA 8
MUL16_RET:
    BYTE 0 0
MUL16_A:
    BYTE 0 0
MUL16_B:
    BYTE 0 0
MUL16_X:
    BYTE 0 0

; -- Multiply two 16-bit values
;  input: L0 low byte of first operand
;         L1 high byte of first operand
;         L2 low byte of second operand
;         L3 high byte of second operand
;  output: L0 low byte of result
;          L1 high byte of operand
    AREA CODE 100
MUL16:
    STORE R2 R3 MUL16_RET
    
    LOAD R2 R3 L0
    STORE R2 R3 MUL16_A
    LOAD R2 R3 L2
    STORE R2 R3 MUL16_B
    
    ; 4. row in multiplication matrix (operand 2 is already there)
    CALL MUL164    
    LOAD R2 R3 L0
    STORE R2 R3 MUL16_X
    
    ; 3. row in matrix    
        ; shift first operand
    LOAD R2 R3 MUL16_A
    SET R0 16
    MUL R3 R0
    COPY R1 R2
    MUL R2 R0
    DIV R1 R0
    ADD R3 R1
    STORE R2 R3 L0
        ; take correct 4 bits from second operand
    LOAD R2 R3 MUL16_B
    SET R0 16
    DIV R2 R0
    STORE R2 L2
    ; multiply row and add to total result
    CALL MUL164
    LOAD R2 R3 MUL16_X
    STORE R2 R3 L2
    CALL ADD16
    LOAD R2 R3 L0
    STORE R2 R3 MUL16_X

    ; 2. row in matrix    
        ; shift first operand
    LOAD R2 R3 MUL16_A
    ZERO R3
    STORE R3 R2 L0
        ; take correct 4 bits from second operand
    LOAD R2 R3 MUL16_B
    STORE R3 L2
    ; multiply row and add to total result
    CALL MUL164
    LOAD R2 R3 MUL16_X
    STORE R2 R3 L2
    CALL ADD16
    LOAD R2 R3 L0
    STORE R2 R3 MUL16_X

    ; 1. row in matrix    
        ; shift first operand
    LOAD R2 R3 MUL16_A
    ZERO R3
    SET R0 16
    MUL R2 R0
    STORE R3 R2 L0
        ; take correct 4 bits from second operand
    LOAD R2 R3 MUL16_B
    SET R0 16
    DIV R3 R0
    STORE R3 L2
    ; multiply row and add to total result
    CALL MUL164
    LOAD R2 R3 MUL16_X
    STORE R2 R3 L2
    CALL ADD16
    
    LOAD R2 R3 MUL16_RET
    JMP R2 R3
