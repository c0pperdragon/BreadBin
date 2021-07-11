
; ---- ASL A
    ORG $0A00
    LSL8 ALO
    BRACCU16 ASL_A_16bit
    NZ8 ALO
    NEXT
ASL_A_16bit:
    ROL8 AHI
    NZ16 ALO AHI
    NEXT

MACRO ASL_near amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP2 TMP3
    LOAD TMP2 TMP3 V0 TMP5
    LSL8 TMP5
    STORE TMP2 TMP3 V0 TMP5
    BRACCU16 ASL_ >< amode >< _16bit
    NZ8 TMP5
    NEXT
ASL_ >< amode >< _16bit:
    INC16 TMP2 TMP3
    LOAD TMP2 TMP3 V0 TMP6
    ROL8 TMP6
    STORE TMP2 TMP3 V0 TMP6
    NZ16 TMP5 TMP6
    NEXT
ENDMACRO

MACRO ASL_far amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 TMP5
    LSL8 TMP5
    STORE TMP2 TMP3 TMP4 TMP5
    BRACCU16 ASL_ >< amode >< _16bit
    NZ8 TMP5
    NEXT
ASL_ >< amode >< _16bit:
    INC24 TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 TMP6
    ROL8 TMP6
    STORE TMP2 TMP3 TMP4 TMP6
    NZ16 TMP5 TMP6
    NEXT
ENDMACRO


    ASL_far  a        $0E
    ASL_far  a_x      $1E
    ASL_near d        $06
    ASL_near d_x      $16
