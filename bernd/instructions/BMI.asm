; ---- BMI r
    ORG $3000
    A NFLAG
    B NFLAG
    OP OVL
    SET TMP0
    B TMP0
    BBZ BMI_r_nottaken
    NEXT_RELATIVE BMI_r_taken2
BMI_r_nottaken:
    INC16 PCLO PCHI
    NEXT
