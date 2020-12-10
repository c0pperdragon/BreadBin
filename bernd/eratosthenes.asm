    include core.asm
    include print.asm
    include math16.asm

    AREA DATA 3
P:  BYTE 0 0 
TMP: BYTE 0    

    ; Test program that implements the sieve of erathostenes prime number calculator. 
    ; This uses the RAM at external memory bank 8 to memorize the found non-primes.     
    AREA CODE 256    
MAIN:
    ; set up external RAM bank to use in program
    SET R1 8
    STORE R1 XDATABANK
    
    ; clear the prime number flags
    ZERO R3 0
    ZERO R2 0
CLEARLOOP:    
    STORE R3 XDATAPAGE
    ZERO R0
    SET R1 1
    DP 0
CLEARLOOP2:
    ST R0 R2
    ADD R2 R1
    BGE R2 R1 CLEARLOOP2
    ADD R3 R1
    BGE R3 R1 CLEARLOOP
    
    CALL PRINTNEWLINE
    GOTO MAIN2
    
    AREA CODE 256    
MAIN2:    
    ; loop from 2 to 255
    SET R2 2
    SET R3 0
    STORE R2 R3 P
PRIMELOOP:    
    ; check if this numbers was marked. If not, this is a prime
    LOAD R2 R3 P
    STORE R3 XDATAPAGE
    DP 0
    LD R1 R2
    SET R0 1
    BGE R1 R0 FINDNEXT
    ; print the prime number
    LOAD R2 R3 P
    STORE R2 R3 L0
    CALL PRINT16    
    CALL PRINTSPACE
    ; loop to mark all multiplies
    LOAD R2 R3 P
    STORE R2 R3 L0    ; use L0/L1 as loop counter
MARKLOOP:
    ; go to next multiple
    LOAD R2 R3 L0
    STORE R3 TMP
    LOAD R2 R3 P
    STORE R2 R3 L2
    CALL ADD16
    ; test if overflowing
    LOAD R2 R3 L0
    LOAD R1 TMP
    GT R1 R3  ; if previous is bigger, this was overflow
    SET R0 1
    BGE R1 R0 FINDNEXT    
    ; mark the multiple
    LOAD R2 R3 L0
    STORE R3 XDATAPAGE
    DP 0
    SET R0 1
    ST R0 R2
    BRA MARKLOOP
FINDNEXT:
    ; increment the counter until reaching >255
    LOAD R2 P
    SET R0 1
    ADD R2 R0
    BLE R2 R0 PRINTLOOP
    STORE R2 P
    BRA PRIMELOOP
    
    ; after running the sieve, print all further primes 
PRINTLOOP:
    ; check if this numbers was marked. If not, this is a prime
    LOAD R2 R3 P
    STORE R3 XDATAPAGE
    DP 0
    LD R1 R2
    SET R0 1
    BGE R1 R0 NOTPRIME
    ; print the prime number
    LOAD R2 R3 P
    STORE R2 R3 L0
    CALL PRINT16    
    CALL PRINTSPACE
NOTPRIME:
    ; increment P until overflow
    LOAD R2 R3 P
    SET R1 1
    ADD R2 R1
    STORE R2 P
    BGE R2 R1 PRINTLOOP
    ADD R3 R1
    STORE R2 R3 P
    BGE R3 R1 PRINTLOOP   

OVER:
    BRA OVER
    