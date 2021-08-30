; ---- BCC r
    ORG $9000               ; = 17 (not taken), 43 (taken)
    X CFLAG                 ; 1
    BRE BCC_r_taken         ; 1
    SKIP                    ; 6
    NEXT                    ; 9
BCC_r_taken:
    NEXT_RELATIVE           ; 41
