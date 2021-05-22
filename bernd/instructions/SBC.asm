; subtraction just uses the addition operation by first just 
; inverting the operand. 
; to make this work, the meaning of the C flag needs to be considered
; as inverted by the user program.

; ---- SBC #
    ORG $E900
    FETCH TMP4
    INV8 TMP4
    ADC8 ALO TMP4 CFLAG
    BRACCU16 SBC_#_16bit
    NEXT
SBC_#_16bit:    
    FETCH TMP4
    INV8 TMP4
    ADC8 AHI TMP4 CFLAG
    COMPUTEZFLAG ALO AHI
    NEXT

; ---- SBC d
    ORG $E500
    FETCHADDRESS_d TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP3
    INV8 TMP3
    ADC8 ALO TMP3 CFLAG
    BRACCU16 SBC_d_16bit
    NEXT
SBC_d_16bit:    
    INC16 TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP3
    INV8 TMP3
    ADC8 AHI TMP3 CFLAG
    COMPUTEZFLAG ALO AHI
    NEXT
