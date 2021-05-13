; for comparision the same operation as for SBC is done, with a carry input of 1
; output flags are then identical, but no result is stored

; ---- CMP #
    ORG $C900
    FETCH TMP2
    INV8 TMP2
    ADC8 TMP2 ALO V1
    BRACCU16 CMP_#_16bit
    NEXT
CMP_#_16bit:    
    FETCH TMP3
    INV8 TMP3
    ADC8 TMP3 AHI CFLAG
    COMPUTEZFLAG TMP2 TMP3
    NEXT

; ---- CMP d
    ORG $C500
    FETCHADDRESS_d TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP2
    INV8 TMP2
    ADC8 TMP2 ALO V1
    BRACCU16 CMP_d_16bit
    NEXT
CMP_d_16bit:    
    INC16 TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP3
    INV8 TMP3
    ADC8 TMP3 AHI CFLAG
    COMPUTEZFLAG TMP2 TMP3
    NEXT

    