; ---- PLX s
    ORG $FA00
    PULL XLO
    BRINDEX16 PLX_16bit
    NZ8 XLO
    NEXT
PLX_16bit:
    PULL XHI
    NZ16 XLO XHI    
    NEXT
