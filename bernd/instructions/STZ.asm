; ---- STZ d
    ORG $6400
    FETCHADDRESS_d TMP2 TMP3
    STORE TMP2 TMP3 V0 V0
    BRACCU16 STZ_d_16bit
    NEXT
STZ_d_16bit:    
    INC16 TMP2 TMP3
    STORE TMP2 TMP3 V0 V0
    NEXT

