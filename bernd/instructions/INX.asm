; ---- INX i
    ORG $E800    
    BRINDEX16 INX_i_16bit
    INC8ANDSETNZ XLO    
    NEXT
INX_i_16bit: 
    INC16 XLO XHI
    NZ16 XLO XHI
    NEXT
