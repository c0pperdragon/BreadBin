
; ---- LSR A
    ORG $4A00
    BRACCU16 LSR_A_16bit
    LSR8 ALO
    NZ8 ALO
    NEXT
LSR_A_16bit:    
    LSR8 AHI
    ROR8 ALO
    NZ16 ALO AHI
    NEXT

MACRO LSR_near amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP2 TMP3
    BRACCU16 LSR_ >< amode >< _16bit
    LOAD TMP2 TMP3 V0 TMP5
    LSR8 TMP5
    STORE TMP2 TMP3 V0 TMP5
    NZ8 TMP5
    NEXT
LSR_ >< amode >< _16bit:    
    CPINC16 TMP7 TMP8 TMP2 TMP3
    LOAD TMP7 TMP8 V0 TMP6
    LSR8 TMP6
    STORE TMP7 TMP8 V0 TMP6
    LOAD TMP2 TMP3 V0 TMP5
    ROR8 TMP5
    STORE TMP2 TMP3 V0 TMP5
    NZ16 TMP5 TMP6
    NEXT
ENDMACRO

MACRO LSR_far amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP2 TMP3 TMP4
    BRACCU16 LSR_ >< amode >< _16bit
    LOAD TMP2 TMP3 TMP4 TMP5
    LSR8 TMP5
    STORE TMP2 TMP3 TMP4 TMP5
    NZ8 TMP5
    NEXT
LSR_ >< amode >< _16bit:    
    CPINC24 TMP6 TMP7 TMP8 TMP2 TMP3 TMP4
    LOAD TMP6 TMP7 TMP8 TMP5
    LSR8 TMP5
    STORE TMP6 TMP7 TMP8 TMP5
    LOAD TMP2 TMP3 TMP4 TMP6
    ROR8 TMP6
    STORE TMP2 TMP3 TMP4 TMP6
    NZ16 TMP6 TMP5
    NEXT
ENDMACRO

    LSR_far  a        $4E
    LSR_far  a_x      $5E
    LSR_near d        $46
    LSR_near d_x      $56
