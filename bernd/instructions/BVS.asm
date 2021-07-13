; ---- BVS r
    ORG $7000
    X VFLAG
    BRE BVS_r_nottaken
    NEXT_RELATIVE
BVS_r_nottaken:
    SKIP
    NEXT
