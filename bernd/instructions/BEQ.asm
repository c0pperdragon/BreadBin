; ---- BEQ r
    ORG $F000
    A ZFLAG
    B ZFLAG
    OP NOR     
    SET TMP0   ; 255 if ZFLAG==0 
    A TMP0
    B V1
    OP CRY
    SET TMP0   ; 2 if ZFLAG==0, 1 otherwise
    B TMP0
    BBE BEQ_r_taken
    INC16 PCLO PCHI
    NEXT
BEQ_r_taken:
    NEXT_RELATIVE BEQ_r_taken2
