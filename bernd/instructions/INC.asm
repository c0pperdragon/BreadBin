
; ---- INC A
    ORG $1A00
    BRACCU16 INC_A_16bit
    INC8ANDSETNZ ALO
    NEXT
INC_A_16bit:    
    INC16 ALO AHI
    NZ16 ALO AHI
    NEXT

MACRO INC_near amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP2 TMP3 
    LOAD TMP2 TMP3 V0 TMP5
    INC8ANDSETNZ TMP5
    STORE TMP2 TMP3 V0 TMP5
    BRACCU16 INC_ >< amode >< _16bit
    NEXT
INC_ >< amode >< _16bit:
    INC16 TMP2 TMP3
    LOAD TMP2 TMP3 V0 TMP6
    INC_IF_ZERO TMP6 TMP5
    STORE TMP2 TMP3 V0 TMP6
    NZ16 TMP5 TMP6
    NEXT
ENDMACRO

MACRO INC_far amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 TMP5
    INC8ANDSETNZ TMP5
    STORE TMP2 TMP3 TMP4 TMP5
    BRACCU16 INC_ >< amode >< _16bit
    NEXT
INC_ >< amode >< _16bit:
    INC24 TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 TMP6
    INC_IF_ZERO TMP6 TMP5
    STORE TMP2 TMP3 TMP4 TMP6
    NZ16 TMP5 TMP6
    NEXT
ENDMACRO

    
    INC_far a         $EE
    INC_far a_x       $FE
    INC_near d        $E6
    INC_near d_x      $F6
