; Short 24-bit counter demo program.
; Couting is done in the registers which have their own LEDs, so no
; additional output is needed.
; The code is specifially crafted to avoid the SET and LD instructions which
; are on the critical path for the signal timing. Maybe this allows a faster clock.

    ORG $0000     
    
    ; Zero out the counters
    XOR R0 R0
    XOR R1 R1
    XOR R2 R2
    ; Need to get a valid number 1 into a register. As ALU operations alone can not 
    ; create any non-0 number from all 0es, lets try to somehow bring at least 
    ; anything into R3 (even if it is mangled). This can then be 
    ; turned into a valid 1.
    SET R3 255
    GT R3 R0

    ; Keep couting, propagate carries
LOOP:
    ADD R0 R3
    BGE R0 R3 LOOP
    ADD R1 R3
    BGE R1 R3 LOOP
    ADD R2 R3
    BRA LOOP
