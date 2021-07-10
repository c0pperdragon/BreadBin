; ---- PHX s
    ORG $DA00
    BRINDEX16 PHX_16bit
    PUSH XLO
    NEXT
PHX_16bit:
    PUSH XHI
    PUSH XLO
    NEXT
