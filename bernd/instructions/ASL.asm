
; ---- ASL A
    ORG $0A00
    BRACCU16 ASL_A_16bit
    LSL8 ALO
    NZ8 ALO
    NEXT
ASL_A_16bit:
    LSL8 ALO
    ROL8 AHI
    NZ16 ALO AHI
    NEXT
