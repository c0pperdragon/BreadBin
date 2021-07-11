; for comparison the same operation as for SBC is done, with a carry input of 1
; output flags are then identical, but no result is stored

; ---- CPY #
    ORG $C000
    FETCH TMP2
    INV8 TMP2
    ADC8 TMP2 YLO V1
    BRINDEX16 CPY_#_16bit
    NZ8 TMP2
    NEXT
CPY_#_16bit:    
    FETCH TMP3
    INV8 TMP3
    ADC8 TMP3 YHI CFLAG
    NZ16 TMP2 TMP3
    NEXT

MACRO CPY_near amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP2
    INV8 TMP2
    ADC8 TMP2 YLO V1
    BRINDEX16 CPY_ >< amode >< _16bit
    NZ8 TMP2
    NEXT
CPY_ >< amode >< _16bit:    
    INC16 TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP3
    INV8 TMP3
    ADC8 TMP3 YHI CFLAG
    NZ16 TMP2 TMP3
    NEXT
ENDMACRO

MACRO CPY_far amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP4 TMP5 TMP6
    LOAD TMP4 TMP5 TMP6 TMP2
    INV8 TMP2
    ADC8 TMP2 YLO V1
    BRINDEX16 CPY_ >< amode >< _16bit
    NZ8 TMP2
    NEXT
CPY_ >< amode >< _16bit:    
    INC24 TMP4 TMP5 TMP6
    LOAD TMP4 TMP5 TMP6 TMP3
    INV8 TMP3
    ADC8 TMP3 YHI CFLAG
    NZ16 TMP2 TMP3
    NEXT    
ENDMACRO
    
    
    CPY_far a         $CC
    CPY_near d        $C4
