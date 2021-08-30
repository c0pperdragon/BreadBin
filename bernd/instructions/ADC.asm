
; ---- ADC #
    ORG $6900               ; = 71
    FETCH TMP4              ; 8
    BRACCU16 ADC_#_16bit    ; 2
    ADC8V ALO TMP4 CFLAG    ; 47
    NZ8 ALO                 ; 5
    NEXT                    ; 9
ADC_#_16bit:    
    ADC8 ALO TMP4 CFLAG
    FETCH TMP4
    ADC8V AHI TMP4 CFLAG
    NZ16 ALO AHI
    NEXT

MACRO ADC_near amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP3
    BRACCU16 ADC_ >< amode >< _16bit
    ADC8V ALO TMP3 CFLAG
    NZ8 ALO
    NEXT
ADC_ >< amode >< _16bit:    
    ADC8 ALO TMP3 CFLAG
    INC16 TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP3
    ADC8V AHI TMP3 CFLAG
    NZ16 ALO AHI
    NEXT
ENDMACRO

MACRO ADC_far amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP4 TMP5 TMP6
    LOAD TMP4 TMP5 TMP6 TMP3
    BRACCU16 ADC_ >< amode >< _16bit
    ADC8V ALO TMP3 CFLAG
    NZ8 ALO
    NEXT
ADC_ >< amode >< _16bit:    
    ADC8 ALO TMP3 CFLAG
    INC24 TMP4 TMP5 TMP6
    LOAD TMP4 TMP5 TMP6 TMP3
    ADC8V AHI TMP3 CFLAG
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
