; ---- BCC r
    ORG $B000
    B CFLAG
    BBZ BCS_r_nottaken
    NEXT_RELATIVE BCS_r_taken2
BCS_r_nottaken:
    INC16 PCLO PCHI
    NEXT
