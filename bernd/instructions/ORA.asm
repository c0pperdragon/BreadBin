
; ---- ORA #
    ORG $0900
    FETCH TMP3
    OR8 ALO TMP3
    BRACCU16 ORA_#_16bit
    NZ8 ALO
    NEXT
ORA_#_16bit:    
    FETCH TMP3
    OR8 AHI TMP3
    NZ16 ALO AHI
    NEXT

MACRO ORA_near amode opcode
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP3
    OR8 ALO TMP3
    BRACCU16 ORA_ >< amode >< _16bit
    NZ8 ALO
    NEXT
ORA_ >< amode >< _16bit:    
    INC16 TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP3
    OR8 AHI TMP3
    NZ16 ALO AHI
    NEXT
ENDMACRO

MACRO ORA_far amode opcode
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP4 TMP5 TMP6
    LOAD TMP4 TMP5 TMP6 TMP3
    OR8 ALO TMP3
    BRACCU16 ORA_ >< amode >< _16bit
    NZ8 ALO
    NEXT
ORA_ >< amode >< _16bit:    
    INC24 TMP4 TMP5 TMP6
    LOAD TMP4 TMP5 TMP6 TMP3
    OR8 AHI TMP3
    NZ16 ALO AHI
    NEXT
ENDMACRO


    ORA_far  a        $0D
    ORA_far  a_x      $1D
    ORA_far  a_y      $19
    ORA_far  al       $0F
    ORA_far  al_x     $1F
    ORA_near d        $05
    ORA_near d_s      $03
    ORA_near d_x      $15
    ORA_far  (d)      $12
    ORA_far  [d]      $07
    ORA_far  (d_s)_y  $13
    ORA_far  (d_x)    $01
    ORA_far  (d)_y    $11
    ORA_far  [d]_y    $17
