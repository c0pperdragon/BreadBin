
; ---- LSR A
    ORG $4A00
    BRACCU16 LSR_A_16bit
    LSR8 ALO
    NZ8 ALO
    NEXT
LSR_A_16bit:    
    LSR8 AHI
    ROR8 ALO
    NZ16 ALO AHI
    NEXT
