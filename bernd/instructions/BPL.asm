; ---- BPL r
    ORG $1000            ; = 21 (not taken), 47 (taken)
    X NFLAG              ; 1
    X NFLAG              ; 1
    OP OVF               ; 1
    SET TMP0             ; 1
    X TMP0               ; 1
    BRE BPL_r_taken      ; 1
    SKIP                 ; 6
    NEXT                 ; 9
BPL_r_taken:
    NEXT_RELATIVE        ; 41
