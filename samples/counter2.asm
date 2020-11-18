    include startup.asm

    ; Counter demo program to be exectued from RAM (showing initial copying procdure)
    
    ORG $FF00
    COUNTER = $0200   ; have counter in low RAM region
MAIN:    
    ; zero out the counter
    SET R0 ^COUNTER
    DP R0
    SET R3 .COUNTER
    ZERO R0
    ST R0 R3    
LOOP:
    ZERO R3
    ZERO R2
DELAY:
    SET R0 1
    ADD R2 R0
    BGE R2 R0 DELAY
    ADD R3 R0
    BGE R3 R0 DELAY
    
    ; increment RAM-based counter and show on output ports
    SET R0 ^COUNTER
    DP R0
    SET R3 .COUNTER
    LD R2 R3
    SET R1 1
    ADD R2 R1
    ST R2 R3
    SET R0 1
    DP R0  ; page of IO range
    SET R0 2
    ST R2 R0  ; write counter to port 2
    SET R0 $FF
    XOR R2 R0
    SET R0 3  ; write inverted counter to port 3
    ST R2 R0

    BRA LOOP
