; ---- TXY i
    ORG $9B00
    BRINDEX16 TXY_16to16
    GET XLO
    SET YLO
    NZ8 YLO
    NEXT
TXY_16to16:    
    COPY16 YLO YHI XLO XHI
    NZ16 YLO YHI
    NEXT
    