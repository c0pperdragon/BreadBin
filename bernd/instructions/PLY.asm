; ---- PLY s
    ORG $7A00
    PULL YLO
    BRINDEX16 PLY_16bit
    NZ8 YLO
    NEXT
PLY_16bit:
    PULL YHI
    NZ16 YLO YHI    
    NEXT
