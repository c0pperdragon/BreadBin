
; ---- ADC #
    ORG $6900
    FETCH TMP4
    ADC8 ALO TMP4 CFLAG
    BRACCU16 ADC_#_16bit
    NZ8 ALO
    NEXT
ADC_#_16bit:    
    FETCH TMP4
    ADC8 AHI TMP4 CFLAG
    NZ16 ALO AHI
    NEXT

MACRO ADC_near amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP3
    ADC8 ALO TMP3 CFLAG
    BRACCU16 ADC_ >< amode >< _16bit
    NZ8 ALO
    NEXT
ADC_ >< amode >< _16bit:    
    INC16 TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP3
    ADC8 AHI TMP3 CFLAG
    NZ16 ALO AHI
    NEXT
ENDMACRO

MACRO ADC_far amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP4 TMP5 TMP6
    LOAD TMP4 TMP5 TMP6 TMP3
    ADC8 ALO TMP3 CFLAG
    BRACCU16 ADC_ >< amode >< _16bit
    NZ8 ALO
    NEXT
ADC_ >< amode >< _16bit:    
    INC24 TMP4 TMP5 TMP6
    LOAD TMP4 TMP5 TMP6 TMP3
    ADC8 AHI TMP3 CFLAG
    NZ16 ALO AHI
    NEXT
ENDMACRO
    
    ADC_far  a        $6D
    ADC_far  a_x      $7D
    ADC_far  a_y      $79
    ADC_far  al       $6F
    ADC_far  al_x     $7F
    ADC_near d        $65
    ADC_near d_s      $63
    ADC_near d_x      $75
    ADC_far  (d)      $72
    ADC_far  [d]      $67
    ADC_far  (d_s)_y  $73
    ADC_far  (d_x)    $61
    ADC_far  (d)_y    $71
    ADC_far  [d]_y    $77
