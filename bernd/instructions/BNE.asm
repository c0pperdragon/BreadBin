; ---- BNE r
    ORG $D000
    B ZFLAG
    BBZ BNE_r_nottaken
    NEXT_RELATIVE BNE_r_taken2
BNE_r_nottaken:
    INC16 PCLO PCHI
    NEXT

