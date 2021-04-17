; ---- TAX i
    ORG $AA00
    BRINDEX16 TAX_to16
; to 8
    GET ALO
    SET XLO
    NEXT
TAX_to16:
    BRACCU16 TAX_16to16
; 8 to 16
    GET ALO
    SET XLO
    GET V0
    SET XHI
    NEXT
TAX_16to16:
    GET ALO
    SET XLO
    GET AHI
    SET XHI
    NEXT
    