; ---- BCC r
    ORG $9000
    X CFLAG
    BEV BCC_r_taken
    SKIP 
    NEXT
BCC_r_taken:
    NEXT_RELATIVE
