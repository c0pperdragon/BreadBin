; ---- BVC r
    ORG $5000
    X VFLAG
    BRE BVC_r_taken
    SKIP 
    NEXT
BVC_r_taken:
    NEXT_RELATIVE

