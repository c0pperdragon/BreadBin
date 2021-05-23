; ---- BMI r
    ORG $3000
    X NFLAG
    OP REV
    SET TMP0
    X TMP0
    BRE BMI_r_nottaken
    NEXT_RELATIVE
BMI_r_nottaken:
    SKIP
    NEXT
