; ---- TYA i
    ORG $9800
    BRACCU16 TYA_to16
; to 8
    GET YLO
    SET ALO
    NZ8 ALO
    NEXT
TYA_to16:
    BRINDEX16 TYA_16to16
; 8 to 16
    COPY16 ALO AHI YLO V0
    NZ16 ALO AHI
    NEXT
TYA_16to16:
    COPY16 ALO AHI YLO YHI 
    NZ16 ALO AHI
    NEXT
