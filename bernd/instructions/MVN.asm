
; ---- MVN xyc
    ORG $5400
    FETCH DBR  ; destination bank
    FETCH TMP4 ; source bank

    ; use inverted counter, so can use increment instead
    INV8 ALO
    INV8 AHI
    
MVN_loop:    
    ; transfer data and proceed index counters
    LOAD_POSTINC XLO XHI TMP4 TMP1
    STORE_POSTINC YLO YHI DBR TMP1
    
    ; increment A and test if overflowing
    X AHI
    X ALO
    OP TOP
    SET TMP0  ; 1 when A was 255 already
    OP CRY
    SET AHI
    X V255
    SET ALO

    ; continue when no overflow
    X TMP0
    BRE MVN_loop
    
    ; A is already 0 at the end
    NEXT
