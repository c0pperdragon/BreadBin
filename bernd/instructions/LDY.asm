
; ---- LDY #
    ORG $A000
    FETCH YLO
    BRINDEX16 LDY_#_16bit
    NZ8 YLO
    NEXT
LDY_#_16bit:    
    FETCH YHI
    NZ16 YLO YHI
    NEXT

MACRO LDY_near amode opcode    
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP2 TMP3 
    LOAD TMP2 TMP3 V0 YLO
    BRINDEX16 LDY_ >< amode >< _16bit
    NZ8 YLO
    NEXT
LDY_ >< amode >< _16bit:    
    INC16 TMP2 TMP3
    LOAD TMP2 TMP3 V0 YHI
    NZ16 YLO YHI
    NEXT
ENDMACRO
    
MACRO LDY_far amode opcode    
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP2 TMP3 TMP4 
    LOAD TMP2 TMP3 TMP4 YLO
    BRINDEX16 LDY_ >< amode >< _16bit
    NZ8 YLO
    NEXT
LDY_ >< amode >< _16bit:    
    INC24 TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 YHI
    NZ16 YLO YHI
    NEXT
ENDMACRO


    LDY_far  a     $AC
    LDY_far  a_x   $BC
    LDY_near d     $A4
    LDY_near d_x   $B4
    