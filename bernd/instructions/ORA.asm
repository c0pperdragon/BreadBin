

; ---- ORA #
    ORG $0900
    FETCH TMP4
    OR8 ALO TMP4
    BRACCU16 ORA_#_16bit
    NZ8 ALO
    NEXT
ORA_#_16bit:    
    FETCH TMP4
    OR8 AHI TMP4
    NZ16 ALO AHI
    NEXT
