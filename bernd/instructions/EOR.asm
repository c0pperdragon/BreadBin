
; ---- EOR #
    ORG $4900
    FETCH TMP4
    EOR8 ALO TMP4
    BRACCU16 EOR_#_16bit
    NZ8 ALO
    NEXT
EOR_#_16bit:    
    FETCH TMP4
    EOR8 AHI TMP4
    NZ16 ALO AHI
    NEXT
    
MACRO EOR_near amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP2 TMP3
    LOAD TMP2 TMP3 V0 TMP5
    EOR8 ALO TMP5
    BRACCU16 EOR_ >< amode >< _16bit
    NZ8 ALO
    NEXT
EOR_ >< amode >< _16bit:
    INC16 TMP2 TMP3
    LOAD TMP2 TMP3 V0 TMP5
    EOR8 AHI TMP5
    NZ16 ALO AHI
    NEXT
ENDMACRO

MACRO EOR_far amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 TMP5
    EOR8 ALO TMP5
    BRACCU16 EOR_ >< amode >< _16bit
    NZ8 ALO
    NEXT
EOR_ >< amode >< _16bit:
    INC24 TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 TMP5
    EOR8 AHI TMP5
    NZ16 ALO AHI
    NEXT
ENDMACRO

    EOR_far  a        $4D
    EOR_far  a_x      $5D
    EOR_far  a_y      $59
    EOR_far  al       $4F
    EOR_far  al_x     $5F
    EOR_near d        $45
    EOR_near d_s      $43
    EOR_near d_x      $55
    EOR_far  (d)      $52
    EOR_far  [d]      $47
    EOR_far  (d_s)_y  $53
    EOR_far  (d_x)    $41
    EOR_far  (d)_y    $51
    EOR_far  [d]_y    $57
