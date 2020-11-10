; Short 24-bit counter demo program.

    ; copy program from ROM to RAM before executing
    ORG $0000
    
    XOR R3 R3
    DP R3    
COPYLOOP:
    SET R0 $18
    ADD R0 R3
    LD R1 R0
    SET R0 .MAIN
    ADD R0 R3
    ST R1 R0
    SET R0 1
    ADD R3 R0
    SET R0 39
    BLE R3 R0 COPYLOOP 
    
    ; start to execute from RAM
    BRA MAIN
 
    ; actual counter program is located in RAM, but needs to
    ; be placed to different ROM location to copied from there  
    ORG $0018 $0098 
        
MAIN:    
    ; Zero out the counters
    XOR R0 R0
    XOR R1 R1
    DP R0
    SET R3 128
    ST R0 R3
    
    ; Keep counting, propagate carries
LOOP:
    SET R3 1
    ADD R0 R3
    BGE R0 R3 LOOP
    ADD R1 R3
    BGE R1 R3 LOOP

    ; use ram for slowest counter
    SET R3 128
    LD R2 R3
    SET R3 1
    ADD R2 R3
    SET R3 128
    ST R2 R3
    
    ; send value of R2 to output ports
    SET R3 64
    ST R2 R3
    SET R3 65
    ST R2 R3
    SET R3 66
    ST R2 R3
    SET R3 67
    ST R2 R3
    
    BRA LOOP
