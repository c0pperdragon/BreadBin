; subtraction just uses the addition operation by first just 
; inverting the operand. 
; to make this work, the meaning of the C flag needs to be considered
; as inverted by the program.


; ---- SBC #
    ORG $E900
    FETCH TMP4
    INV8 TMP4
    BRACCU16 SBC_#_16bit
    ADC8 ALO TMP4
    NEXT
SBC_#_16bit:    
    FETCH TMP4
    INV8 TMP4
    ADC8 ALO TMP4
    COMPUTEZFLAG ALO AHI
    NEXT
