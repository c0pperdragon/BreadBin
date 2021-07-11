
; ---- ROL A
    ORG $2A00
    ROL8 ALO
    BRACCU16 ROL_A_16bit
    NZ8 ALO
    NEXT
ROL_A_16bit:
    ROL8 AHI
    NZ16 ALO AHI
    NEXT
    
MACRO ROL_near amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP2 TMP3
    LOAD TMP2 TMP3 V0 TMP5
    ROL8 TMP5
    STORE TMP2 TMP3 V0 TMP5
    BRACCU16 ROL_ >< amode >< _16bit
    NZ8 TMP5
    NEXT
ROL_ >< amode >< _16bit:
    INC16 TMP2 TMP3
    LOAD TMP2 TMP3 V0 TMP6
    ROL8 TMP6
    STORE TMP2 TMP3 V0 TMP6
    NZ16 TMP5 TMP6
    NEXT
ENDMACRO

MACRO ROL_far amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 TMP5
    ROL8 TMP5
    STORE TMP2 TMP3 TMP4 TMP5
    BRACCU16 ROL_ >< amode >< _16bit
    NZ8 TMP5
    NEXT
ROL_ >< amode >< _16bit:
    INC24 TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 TMP6
    ROL8 TMP6
    STORE TMP2 TMP3 TMP4 TMP6
    NZ16 TMP5 TMP6
    NEXT
ENDMACRO


    ROL_far  a        $2E
    ROL_far  a_x      $3E
    ROL_near d        $26
    ROL_near d_x      $36
