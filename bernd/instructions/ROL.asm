
; ---- ROL A
    ORG $2A00
    BRACCU16 ROL_A_16bit
    ROL8 ALO
    NZ8 ALO
    NEXT
ROL_A_16bit:
    ROL8 ALO
    ROL8 AHI
    NZ16 ALO AHI
    NEXT
