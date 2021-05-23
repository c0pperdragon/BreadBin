; ---- PLA s
    ORG $6800
    PULL ALO
    BRACCU16 PLA_16bit
    NZ8 ALO
    NEXT
PLA_16bit:
    PULL AHI
    NZ16 ALO AHI    
    NEXT
