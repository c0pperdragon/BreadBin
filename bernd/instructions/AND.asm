

; ---- AND #
    ORG $2900
    FETCH TMP4
    AND8 ALO TMP4
    BRACCU16 AND_#_16bit
    NEXT
AND_#_16bit:    
    FETCH TMP4
    AND8 AHI TMP4
    COMPUTEZFLAG ALO AHI
    NEXT
    
; ---- AND d
    ORG $2500
    FETCHADDRESS_d TMP2 TMP3
    LOAD TMP2 TMP3 V0 TMP4
    AND8 ALO TMP4
    BRACCU16 AND_d_16bit
    NEXT
AND_d_16bit:
    INC16 TMP2 TMP3
    LOAD TMP2 TMP3 V0 TMP4
    AND8 AHI TMP4
    COMPUTEZFLAG ALO AHI
    NEXT

; ---- AND al
    ORG $2F00
    FETCHADDRESS_al TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 TMP1
    AND8 ALO TMP1
    BRACCU16 AND_al_16bit
    NEXT
AND_al_16bit:
    INC16 TMP2 TMP3
    LOAD TMP2 TMP3 TMP4 TMP1
    AND8 AHI TMP1
    COMPUTEZFLAG ALO AHI
    NEXT    
