
; ---- LDX #
    ORG $A200
    FETCH XLO
    BRINDEX16 LDX_#_16bit
    NEXT
LDX_#_16bit:    
    FETCH XHI
    NEXT
