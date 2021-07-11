; ---- PHY s
    ORG $5A00
    BRINDEX16 PHY_16bit
    PUSH YLO
    NEXT
PHY_16bit:
    PUSH YHI
    PUSH YLO
    NEXT
