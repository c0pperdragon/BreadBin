; ---- BCC r
    ORG $9000
    B CFLAG
    BBZ BCC_r_taken
    INC16 PCLO PCHI
    NEXT
BCC_r_taken:
    FETCH TMP4
    JUMPRELATIVE TMP4
    NEXT
