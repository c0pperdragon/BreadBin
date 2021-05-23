; ---- BEQ r
    ORG $F000
    X ZFLAG
    X ZFLAG
    OP NAND     
    SET TMP0   ; 255 if ZFLAG==0 (meaning result was zero)
    X V1
    X TMP0
    OP CRY
    SET TMP0   ; 2 if ZFLAG==0, 1 otherwise
    X TMP0
    BRE BEQ_r_taken
    SKIP
    NEXT
BEQ_r_taken:
    NEXT_RELATIVE
