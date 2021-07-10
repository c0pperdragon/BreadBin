    
MACRO STX_near amode opcode
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP2 TMP3
    STORE TMP2 TMP3 V0 XLO
    BRACCU16 STX_ >< amode >< _16bit
    NEXT
STX_ >< amode >< _16bit:    
    INC16 TMP2 TMP3 
    STORE TMP2 TMP3 V0 XHI
    NEXT
ENDMACRO
    
MACRO STX_far amode opcode
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP2 TMP3 TMP4
    STORE TMP2 TMP3 TMP4 XLO
    BRACCU16 STX_ >< amode >< _16bit
    NEXT
STX_ >< amode >< _16bit:    
    INC24 TMP2 TMP3 TMP4
    STORE TMP2 TMP3 TMP4 XHI
    NEXT
ENDMACRO


    STX_far  a        $8E
    STX_near d        $86
    STX_near d_y      $96
