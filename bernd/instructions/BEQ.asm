; ---- BEQ r
    ORG $F000
    B ZFLAG
    BBZ BEQ_r_taken
    INC16 PCLO PCHI
    NEXT
BEQ_r_taken:
    FETCH TMP4
    JUMPRELATIVE TMP4
    NEXT
