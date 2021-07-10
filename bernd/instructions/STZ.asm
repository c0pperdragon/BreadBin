
MACRO STZ_near amode opcode
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP2 TMP3
    STORE TMP2 TMP3 V0 V0
    BRACCU16 STZ_ >< amode >< _16bit
    NEXT
STZ_ >< amode >< _16bit:    
    INC16 TMP2 TMP3
    STORE TMP2 TMP3 V0 V0
    NEXT
ENDMACRO

MACRO STZ_far amode opcode
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP2 TMP3 TMP4
    STORE TMP2 TMP3 TMP4 V0
    BRACCU16 STZ_ >< amode >< _16bit
    NEXT
STZ_ >< amode >< _16bit:    
    INC24 TMP2 TMP3 TMP4
    STORE TMP2 TMP3 TMP4 V0
    NEXT
ENDMACRO

    
    STZ_far  a        $9C
    STZ_far  a_x      $9E 
    STZ_near d        $64
    STZ_near d_x      $74
