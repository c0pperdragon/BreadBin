; ---- BNE r
    ORG $D000
    X ZFLAG
    X ZFLAG
    OP NAND
    SET TMP0     ; 255 if ZFLAG==0
    X V0
    X TMP0
    OP CRY
    SET TMP0     ; 1 if ZFLAG==0, 0 otherwise
    X TMP0
    BRE BNE_r_taken
    SKIP
    NEXT
BNE_r_taken:
    NEXT_RELATIVE
