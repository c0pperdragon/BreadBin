
MACRO STA_near amode opcode
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP2 TMP3
    STORE TMP2 TMP3 V0 ALO
    BRACCU16 STA_ >< amode >< _16bit
    NEXT
STA_ >< amode >< _16bit:    
    INC16 TMP2 TMP3 
    STORE TMP2 TMP3 V0 AHI
    NEXT
ENDMACRO
    
MACRO STA_far amode opcode
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP2 TMP3 TMP4
    STORE TMP2 TMP3 TMP4 ALO
    BRACCU16 STA_ >< amode >< _16bit
    NEXT
STA_ >< amode >< _16bit:    
    INC24 TMP2 TMP3 TMP4
    STORE TMP2 TMP3 TMP4 AHI
    NEXT
ENDMACRO

    STA_far  a        $8D
    STA_far  a_x      $9D
    STA_far  a_y      $99
    STA_far  al       $8F
    STA_far  al_x     $9F
    STA_near d        $85
    STA_near d_s      $83
    STA_near d_x      $95
    STA_far  (d)      $92
    STA_far  [d]      $87
    STA_far  (d_s)_y  $93
    STA_far  (d_x)    $81
    STA_far  (d)_y    $91
    STA_far  [d]_y    $97
