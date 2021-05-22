; ---- BMI r
    ORG $3000
    X NFLAG
    X NFLAG
    OP OVF
    SET TMP0
    X TMP0
    BEV BMI_r_nottaken
    NEXT_RELATIVE
BMI_r_nottaken:
    SKIP
    NEXT
