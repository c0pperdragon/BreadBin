
; add two 8-bit values plus the carry flag
; and store into the dest and update CFLAG,NFLAG,ZFLAG
; uses TMP0 and TMP1
MACRO ADC8 destination operand
    A destination
    B operand
    OP ADD
    SET destination
    OP OVL
    SET TMP0  ; first carry possibility
    A destination
    B CFLAG
    OP ADD
    SET destination
    SET NFLAG
    SET ZFLAG
    OP OVL
    SET TMP1  ; second carry possibility
    A TMP0
    B TMP1
    OP OR
    SET CFLAG ; compose carry 
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
