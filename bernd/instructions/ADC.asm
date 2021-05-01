; add source to destination, using the CFLAG as carry input 
; and also set the output carry
; set NFLAG and ZFLAG according to the result
; uses storage: TMP0, TMP1
MACRO ADC8 destination source 
    A destination
    B source
    OP ADD
    SET destination
    OP OVL
    SET TMP0  ; first carry possibility
    A destination
    B CFLAG
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
    ADC8 ALO TMP4
    BRACCU16 ADC_#_16bit
    NEXT
ADC_#_16bit:    
    FETCH TMP4
    ADC8 AHI TMP4
    COMPUTEZFLAG ALO AHI
    NEXT
