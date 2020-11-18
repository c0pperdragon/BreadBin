; Startup code to copy program from ROM to RAM and start it

    ; copy program from ROM to RAM before executing
    ORG $0000
    ; first part: copy ROM page 0 including second copy loop to RAM page 2
    ZERO R3    ; loop counter
COPYLOOP1:
    SET R0 0
    DP R0
    LD R1 R3
    SET R0 2
    DP R0
    ST R1 R3
    SET R0 1
    ADD R3 R0
    BGE R3 R0 COPYLOOP1
    
    ; go to start of second copy routine
    SET R0 .COPYROUTINE2
    SET R1 ^COPYROUTINE2
    JMP R0 R1   
    
    ; second part: this code is executed from RAM so it can 
    ; switch ROM banks. 
    ; in order for itself to be copied, its own ROM location and execution address 
    ; can not be identical 
    ORG $0080 $0280 
COPYROUTINE2:
    SET R3 $08 ; loop counter: high byte of target address  
COPYLOOP2:    
    ; set up the extension memory page address 
    SET R0 1
    DP R0     ; access the IO registers
    ZERO R0
    ST R3 R0  ; low byte of page number
    SET R1 1
    ST R0 R1  ; high byte of page number is always 0  
    ; copy a whole page in one loop
    ZERO R2   ; loop counter for low byte target address
INNERLOOP2:
    ZERO R0
    DP R0
    LD R1 R2
    DP R3
    ST R1 R2
    SET R0 1
    ADD R2 R0
    BGE R2 R0 INNERLOOP2
    ADD R3 R0
    BGE R3 R0 COPYLOOP2
    ; start main program from RAM
    SET R0 .MAIN
    SET R1 ^MAIN
    JMP R0 R1


