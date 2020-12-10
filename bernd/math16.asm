; ----------- various routines for unsigned 16-bit mathematics ----------------------

;  -- Add two 16 bit values
;  input: L0 low byte of first operand
;         L1 high byte of first operand
;         L2 low byte of second operand
;         L3 high byte of second operand
;  output: L0 low byte of sum
;          L1 high byte of sum
    AREA CODE 40
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

    

; -- Divide a 16-bit vaulue by an 8-bit value
;  input: L0 low byte of first operand
;         L1 high byte of first operand
;         L2 second operand (divisor)
;  output: L0 low byte of result
;          L1 high byte of operand
    AREA CODE 200
DIV168:
    ; check if first operand <= 255 
    LOAD R1 L1
    SET R0 1
    BGE R1 R0 DIV168_FULL
    ; use built-in operation
    LOAD R1 L0
    LOAD R0 L2
    DIV R1 R0
    STORE R1 L0
    JMP R2 R3
    
    ; full operation
DIV168_FULL:    
    STORE R2 R3 L4

    ; high byte of the result can be created with built in operation
    LOAD R1 L1
    LOAD R2 L2
    COPY R3 R1
    DIV R1 R2
    STORE R1 L1
    MUL R1 R2
    SUB R3 R1    ; remainder

    ; process the low byte bit by bit doing a full division algorithm
    ;  R3 ... current remainder
    ;  R2 ... active bit counter (running from $80 to $01)
    ;  R1 ... low result byte
    SET R2 $80
    ZERO R1
DIV168_LOOP:
    ; decide if the remainder can be shifted without overflow
    SET R0 128
    BGE R3 R0 DIV168_BIGREMAINDER    
    ; shift remainder and bring in next bit
    SET R0 2
    MUL R3 R0
    LOAD R0 L0
    AND R0 R2
    BGE R0 R2 DIV168_BRING_1
    BRA DIV168_CHECKFIT
    ; get next bit from second operand
DIV168_BRING_1:
    SET R0 1
    OR R3 R0
    ; test if divisor fits into extended remainder
DIV168_CHECKFIT:
    LOAD R0 L2
    BGE R3 R0 DIV168_DOSUBTRACT:
    BRA DIV168_ENDOFLOOP
    ; in case the remainder is >=128 the divisor will
    ; surely fit after shifting, so just shift and add bit
    ; and no need to do any fit test
DIV168_BIGREMAINDER:    
    SET R0 2
    MUL R3 R0
    LOAD R0 L0
    AND R0 R2
    BGE R0 R2 DIV168_BRING_1_NOCHECK:
    BRA DIV168_DOSUBTRACT
DIV168_BRING_1_NOCHECK:
    SET R0 1
    OR R3 R0
    ; if divisor fits, subtract it and use a 1 digit in result
DIV168_DOSUBTRACT:
    LOAD R0 L2
    SUB R3 R0
    OR R1 R2
    ; progress bit counter
DIV168_ENDOFLOOP:
    SET R0 2
    DIV R2 R0
    SET R0 1
    BGE R2 R0 DIV168_LOOP
    
    ; store result and return
    STORE R1 L0
    LOAD R2 R3 L4
    JMP R2 R3
