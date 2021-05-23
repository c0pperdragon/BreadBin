; ---- BCC r
    ORG $B000
    X CFLAG
    BRE BCS_r_nottaken
    NEXT_RELATIVE
BCS_r_nottaken:
    SKIP
    NEXT
