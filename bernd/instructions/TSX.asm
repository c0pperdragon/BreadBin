
; ---- TSX i
    ORG $BA00
    GET SLO
    SET XLO
    BRINDEX16 TSX_i_16
    NZ8 XLO
    NEXT
TSX_i_16:
    GET SHI
    SET XHI
    NZ16 XLO XHI
    NEXT
