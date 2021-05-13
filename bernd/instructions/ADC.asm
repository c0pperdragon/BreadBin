; add source to destination, using the provided carry input 
; and also set the output carry in CFLAG
; set NFLAG and ZFLAG according to the result
; uses storage: TMP0, TMP1
MACRO ADC8 destination source carryin
    A source
    B destination
    OP ADD
    SET destination
    OP OVL
    SET TMP0  ; first carry possibility
    A destination
    B carryin
    SET TMP1  ; second carry possibility
    OP ADD
    SET destination
    SET NFLAG
    SET ZFLAG
    A TMP0
    B TMP1
    SET CFLAG ; compose carry (only one input can be 1)
ENDMACRO

; ---- ADC #
    ORG $6900
    FETCH TMP4
    ADC8 ALO TMP4 CFLAG
    BRACCU16 ADC_#_16bit
    NEXT
ADC_#_16bit:    
    FETCH TMP4
    ADC8 AHI TMP4 CFLAG
    COMPUTEZFLAG ALO AHI
    NEXT

; ---- ADC d
    ORG $6500
    FETCHADDRESS_d TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP3
    ADC8 ALO TMP3 CFLAG
    BRACCU16 ADC_d_16bit
    NEXT
ADC_d_16bit:    
    INC16 TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP3
    ADC8 AHI TMP3 CFLAG
    COMPUTEZFLAG ALO AHI
    NEXT
    
