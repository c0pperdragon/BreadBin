
; ---- MVN xyc
    ORG $5400
    FETCH DBR  ; destination bank
    FETCH TMP4 ; source bank

MVN_loop:    
    ; get from source
    B TMP4    
    A XLO
    B XHI
    IN TMP0
    
    ; write to destination
    B DBR
    A YLO
    B YHI
    OUT TMP0
    
    ; increment X and Y
    INC16 XLO XHI
    INC16 YLO YHI
    
    ; check if C is already 0
    A ALO
    B AHI
    OP NOR
    SET TMP0
    A TMP0
    B V1
    OP CRY
    SET TMP0
    B TMP0
    BBE MVN_done
    
    ; decrement C and keep going
    DEC16 ALO AHI
    B V0
    BBE MVN_loop
    
MVN_done:
    NEXT
    