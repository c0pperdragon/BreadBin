; for comparison the same operation as for SBC is done, with a carry input of 1
; output flags are then identical, but no result is stored

; ---- CMP #
    ORG $C900
    FETCH TMP2
    INV8 TMP2
    ADC8 TMP2 ALO V1
    BRACCU16 CMP_#_16bit
    NZ8 ALO
    NEXT
CMP_#_16bit:    
    FETCH TMP3
    INV8 TMP3
    ADC8 TMP3 AHI CFLAG
    NZ16 TMP2 TMP3
    NEXT

MACRO CMP_near amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP2
    INV8 TMP2
    ADC8 TMP2 ALO V1
    BRACCU16 CMP_ >< amode >< _16bit
    NZ8 TMP2
    NEXT
CMP_ >< amode >< _16bit:    
    INC16 TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP3
    INV8 TMP3
    ADC8 TMP3 AHI CFLAG
    NZ16 TMP2 TMP3
    NEXT
ENDMACRO

MACRO CMP_far amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP4 TMP5 TMP6
    LOAD TMP4 TMP5 TMP6 TMP2
    INV8 TMP2
    ADC8 TMP2 ALO V1
    BRACCU16 CMP_ >< amode >< _16bit
    NZ8 TMP2
    NEXT
CMP_ >< amode >< _16bit:    
    INC24 TMP4 TMP5 TMP6
    LOAD TMP4 TMP5 TMP6 TMP3
    INV8 TMP3
    ADC8 TMP3 AHI CFLAG
    NZ16 TMP2 TMP3
    NEXT    
ENDMACRO
    
    
    CMP_far a         $CD
    CMP_far a_x       $DD
    CMP_far a_y       $D9
    CMP_far  al       $CF
    CMP_far  al_x     $DF
    CMP_near d        $C5
    CMP_near d_s      $C3
    CMP_near d_x      $D5
    CMP_far (d)       $D2
    CMP_far  [d]      $C7
    CMP_far  (d_s)_y  $D3
    CMP_far (d_x)     $C1
    CMP_far  (d)_y    $D1
    CMP_far  [d]_y    $D7
