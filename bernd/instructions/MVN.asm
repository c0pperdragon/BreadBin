
; ---- MVN xyc
    ORG $5400
    FETCH DBR  ; destination bank
    FETCH TMP4 ; source bank

MVN_loop:    
    ; transfer data 
    LOAD XLO XHI TMP4 TMP1
    STORE YLO YHI DBR TMP1
    
    ; increment X and Y
    INC16 XLO XHI
    INC16 YLO YHI
    
    ; check if C is already 0, if so: break
    OP NAND
    X ALO
    X V255
    SET TMP0   ; = ~ ALO
    X AHI
    SET TMP1   ; = ~ AHI
    X TMP0
    X TMP1
    SET TMP0   ; = ALO OR AHI
    X TMP0
    X TMP0
    SET TMP0   ; = 255, if C = 0, otherwise anything else
    X V1
    X TMP0
    OP CRY
    SET TMP0   ; 2 if C = 0.  1 otherwise
    X TMP0
    BRE MVN_done
    
    ; decrement C and keep going
    DEC16 ALO AHI
    X V0
    BRE MVN_loop
    
MVN_done:
    NEXT
