
; ---- DEC A
    ORG $3A00
    BRACCU16 DEC_A_16bit
    DEC8ANDSETNZ ALO
    NEXT
DEC_A_16bit:    
    DEC16 ALO AHI
    NZ16 ALO AHI
    NEXT

MACRO DEC_near amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP2 TMP3 
    LOAD TMP2 TMP3 V0 TMP5
    DEC8ANDSETNZ TMP5
    STORE TMP2 TMP3 V0 TMP5
    BRACCU16 DEC_ >< amode >< _16bit
    NEXT
DEC_ >< amode >< _16bit:
    INC16 TMP2 TMP3
    LOAD TMP2 TMP3 V0 TMP6
    DEC_IF_255 TMP6 TMP5
    STORE TMP2 TMP3 V0 TMP6
    NZ16 TMP5 TMP6
    NEXT
ENDMACRO

MACRO DEC_far amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 TMP5
    DEC8ANDSETNZ TMP5
    STORE TMP2 TMP3 TMP4 TMP5
    BRACCU16 DEC_ >< amode >< _16bit
    NEXT
DEC_ >< amode >< _16bit:
    INC24 TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 TMP6
    DEC_IF_255 TMP6 TMP5
    STORE TMP2 TMP3 TMP4 TMP6
    NZ16 TMP5 TMP6
    NEXT
ENDMACRO

    
    DEC_far a         $CE
    DEC_far a_x       $DE
    DEC_near d        $C6
    DEC_near d_x      $D6
