; ---- BNE r
    ORG $D000
    A ZFLAG
    B ZFLAG
    OP NOR
    SET TMP0     ; 255 if ZFLAG==0
    A TMP0
    B V0
    OP CRY
    SET TMP0     ; 1 if ZFLAG==0, 0 otherwise
    B TMP0
    BBE BNE_r_taken
    INC16 PCLO PCHI
    NEXT
BNE_r_taken:
    NEXT_RELATIVE BNE_r_taken2
