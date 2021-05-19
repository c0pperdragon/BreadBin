; ---- BCC r
    ORG $9000
    B CFLAG
    BBE BCC_r_taken
    INC16 PCLO PCHI
    NEXT
BCC_r_taken:
    NEXT_RELATIVE BCC_r_taken2
