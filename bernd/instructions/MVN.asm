
; ---- MVN xyc
    ORG $5400
    FETCH DBR  ; destination bank
    FETCH TMP4 ; source bank

MVN_loop:    
    ; get from source
    B TMP4    
    OUT2
    A XLO
    B XHI
    IN TMP0
    
    ; write to destination
    B DBR
    OUT2
    A YLO
    B YHI
    OUT TMP0
    
    ; increment X and Y
    INC16 XLO XHI
    INC16 YLO YHI
    
    ; check if C is already 0
    A ALO
    B AHI
    OP OR
    SET TMP0
    A TMP0
    B V0
    BEQ MVN_done
    
    ; decrement C and keep going
    DEC16 ALO AHI
    BRA MVN_loop
    
MVN_done:
    NEXT
    