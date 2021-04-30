; ---- BNE r
    ORG $D000
    B ZFLAG
    BBZ BNE_r_nottaken
    FETCH TMP4
    JUMPRELATIVE TMP4
    NEXT
BNE_r_nottaken:
    INC16 PCLO PCHI
    NEXT

