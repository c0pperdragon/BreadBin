
; ---- BIT #
    ORG $8900
    FETCH TMP5
    BRACCU16 BIT_#_16bit
    SETNVFROMHIGHBITS TMP5
    AND8 TMP5 ALO
    Z8 TMP5
    NEXT
BIT_#_16bit:    
    FETCH TMP6
    NZ16 TMP5 TMP6
    SETNVFROMHIGHBITS TMP6
    AND8 TMP5 ALO
    AND8 TMP6 AHI
    Z16 TMP5 TMP6
    NEXT
    
MACRO BIT_near amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP2 TMP3
    LOAD TMP2 TMP3 V0 TMP5
    BRACCU16 BIT_ >< amode >< _16bit
    SETNVFROMHIGHBITS TMP5
    AND8 TMP5 ALO
    Z8 TMP5
    NEXT
BIT_ >< amode >< _16bit:
    INC16 TMP2 TMP3
    LOAD TMP2 TMP3 V0 TMP6
    SETNVFROMHIGHBITS TMP6
    AND8 TMP5 ALO
    AND8 TMP6 AHI
    Z16 TMP5 TMP6
    NEXT
ENDMACRO

MACRO BIT_far amode opcode
    ORG opcode >< 00                          ; = 55
    FETCHADDRESS_ >< amode TMP2 TMP3 TMP4     ; 20
    LOAD TMP2 TMP3 TMP4 TMP5                  ;  3
    BRACCU16 BIT_ >< amode >< _16bit          ;  2
    SETNVFROMHIGHBITS TMP5                    ; 10
    AND8 TMP5 ALO                             ;  7
    Z8 TMP5                                   ;  4
    NEXT                                      ;  9
BIT_ >< amode >< _16bit:
    INC24 TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 TMP6
    SETNVFROMHIGHBITS TMP6
    AND8 TMP5 ALO
    AND8 TMP6 AHI
    Z16 TMP5 TMP6
    NEXT
ENDMACRO


    BIT_far  a        $2C
    BIT_far  a_x      $3C
    BIT_near d        $24
    BIT_near d_x      $34
