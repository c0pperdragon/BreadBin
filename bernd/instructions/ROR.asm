
; ---- ROR A
    ORG $6A00
    BRACCU16 ROR_A_16bit
    ROR8 ALO
    NZ8 ALO
    NEXT
ROR_A_16bit:
    ROR8 AHI
    ROR8 ALO
    NZ16 ALO AHI
    NEXT
