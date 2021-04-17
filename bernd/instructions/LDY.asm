
; ---- LDY #
    ORG $A000
    FETCH YLO
    BRINDEX16 LDY_#_16bit
    NEXT
LDY_#_16bit:    
    FETCH YHI
    NEXT
