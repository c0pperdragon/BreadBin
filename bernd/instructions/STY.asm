
MACRO STY_near amode opcode
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP2 TMP3
    STORE TMP2 TMP3 V0 YLO
    BRACCU16 STY_ >< amode >< _16bit
    NEXT
STY_ >< amode >< _16bit:    
    INC16 TMP2 TMP3 
    STORE TMP2 TMP3 V0 YHI
    NEXT
ENDMACRO
    
MACRO STY_far amode opcode
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP2 TMP3 TMP4
    STORE TMP2 TMP3 TMP4 YLO
    BRACCU16 STY_ >< amode >< _16bit
    NEXT
STY_ >< amode >< _16bit:    
    INC24 TMP2 TMP3 TMP4
    STORE TMP2 TMP3 TMP4 YHI
    NEXT
ENDMACRO


    STY_far  a        $8C
    STY_near d        $84
    STY_near d_x      $94
