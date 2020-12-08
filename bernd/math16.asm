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

; -- Multiply a 16-bit value with a 8-bit value
;  input: L0 low byte of first operand
;         L1 high byte of first operand
;         L2 second operand 
;  output: L0 low byte of result
;          L1 high byte of operand
;  The most diffcult part of the computation is to compute the high byte
;  of the product of the low bytes. This is done by splitting the numbers to
;  4-bit digits and manually do the multiplication matrix.
;  L0 = A B    L2 = C D   
    AREA CODE 100
MUL168:
    STORE R2 R3 L4
    
    ; Compute the high byte of the low-byte multiplications
    LOAD R3 L0
    SET R0 15
    AND R3 R0   ; B
    LOAD R2 L2
    AND R2 R0   ; D
    MUL R3 R2   ; B*D
    SET R0 16
    DIV R3 R0   ; overflow to digit 1  
    
    LOAD R2 L0
    SET R0 15
    AND R2 R0   ; B
    LOAD R1 L2
    SET R0 16
    DIV R1 R0   ; C
    MUL R2 R1   ; B*C
    ADD R3 R2   ; collect digit 1&2

    LOAD R2 L0
    SET R0 16
    DIV R2 R0   ; A
    LOAD R1 L2
    SET R0 15
    AND R1 R0   ; D
    MUL R2 R1   ; A*D
    ADD R3 R2   ; collect digit 1&2
    GT R2 R3    ; overflow to digit 3
    SET R0 16
    DIV R3 R0   ; start with columns 2&3
    MUL R2 R0   ; adjust overflow to fit digit 2&3
    ADD R3 R2   ; join from the overflow
    
    LOAD R2 L0
    SET R0 16
    DIV R2 R0   ; A
    LOAD R1 L2
    DIV R1 R0   ; C
    MUL R2 R1   ; A*C
    ADD R3 R2   ; complete column 2&3
    ; we have the high byte of low byte multiplication now in R3
    
    ; complete the high byte of the result
    LOAD R1 L1
    LOAD R2 L2
    MUL R2 R1
    ADD R3 R2
    STOrE R3 L1
    
    ; compute low byte of result (easy)
    LOAD R1 L0
    LOAD R2 L2
    MUL R1 R2
    STORE R1 L0
    
    LOAD R2 R3 L4
    JMP R2 R3
    
    
    AREA DATA 3
MUL16_RET:
    BYTE 0 0
MUL16_VX:
    BYTE 0

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

    LOAD R2 L0      ; calculate first row of multiplication matrix
    LOAD R3 L3
    MUL R2 R3
    STORE R2 MUL16_VX

    CALL MUL168     ; calculate second row of multiplication matrix
    
    LOAD R2 MUL16_VX  ; join rows
    LOAD R3 L1
    ADD R3 R2
    STORE R3 L1
    
    LOAD R2 R3 MUL16_RET
    JMP R2 R3
