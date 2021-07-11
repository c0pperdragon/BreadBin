; ---- BPL r
    ORG $1000
    X NFLAG
    X NFLAG
    OP OVF
    SET TMP0
    X TMP0
    BRE BPL_r_taken
    SKIP
    NEXT
BPL_r_taken:
    NEXT_RELATIVE
