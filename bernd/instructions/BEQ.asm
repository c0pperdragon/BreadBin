; ---- BEQ r
    ORG $F000
    B ZFLAG
    BBZ BEQ_r_taken
    INC16 PCLO PCHI
    NEXT
BEQ_r_taken:
    NEXT_RELATIVE BEQ_r_taken2

    