; ---- DEY i
    ORG $8800
    BRINDEX16 DEY_i_16bit
    DEC8ANDSETNZ YLO
    NEXT
DEY_i_16bit:    
    DEC16 YLO YHI
    NZ16 YLO YHI
    NEXT
