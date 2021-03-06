
; ---- MVN xyc
    ORG $5400
    FETCH DBR  ; destination bank
    FETCH TMP4 ; source bank

MVN_loop:    
    ; transfer data 
    LOAD XLO XHI TMP4 TMP1
    STORE YLO YHI DBR TMP1
    
    ; proceed counters 
    INC16 XLO XHI
    INC16 YLO YHI
    DEC16 ALO AHI
    
    ; stop if A reached FFFF _after_ increment
    X ALO
    X AHI
    OP TOP
    SET TMP0
    X TMP0
    BRE MVN_loop
    
    ; fix A to always hold 0 after operation
    OP ZERO
    SET ALO
    SET AHI

    NEXT
