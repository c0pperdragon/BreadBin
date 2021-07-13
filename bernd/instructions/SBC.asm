; subtraction just uses the addition operation by first just 
; inverting the operand. 
; to make this work, the meaning of the C flag needs to be considered
; as inverted by the user program.

; ---- SBC #
    ORG $E900
    FETCH TMP4
    INV8 TMP4
    BRACCU16 SBC_#_16bit
    ADC8V ALO TMP4 CFLAG
    NZ8 ALO
    NEXT
SBC_#_16bit:    
    ADC8 ALO TMP4 CFLAG
    FETCH TMP4
    INV8 TMP4
    ADC8V AHI TMP4 CFLAG
    NZ16 ALO AHI
    NEXT

MACRO SBC_near amode opcode
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP3
    INV8 TMP3
    BRACCU16 SBC_ >< amode >< _16bit
    ADC8V ALO TMP3 CFLAG
    NZ8 ALO
    NEXT
SBC_ >< amode >< _16bit:    
    ADC8 ALO TMP3 CFLAG
    INC16 TMP4 TMP5
    LOAD TMP4 TMP5 V0 TMP3
    INV8 TMP3
    ADC8V AHI TMP3 CFLAG
    NZ16 ALO AHI
    NEXT
ENDMACRO

MACRO SBC_far amode opcode
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP4 TMP5 TMP6
    LOAD TMP4 TMP5 TMP6 TMP3
    INV8 TMP3
    BRACCU16 SBC_ >< amode >< _y_16bit
    ADC8V ALO TMP3 CFLAG
    NZ8 ALO
    NEXT
SBC_ >< amode >< _y_16bit:    
    ADC8 ALO TMP3 CFLAG
    INC24 TMP4 TMP5 TMP6
    LOAD TMP4 TMP5 TMP6 TMP3
    INV8 TMP3
    ADC8V AHI TMP3 CFLAG
    NZ16 ALO AHI
    NEXT
ENDMACRO
    
    SBC_far  a        $ED
    SBC_far  a_x      $FD
    SBC_far  a_y      $F9
    SBC_far  al       $EF
    SBC_far  al_x     $FF
    SBC_near d        $E5
    SBC_near d_s      $E3
    SBC_near d_x      $F5
    SBC_far  (d)      $F2
    SBC_far  [d]      $E7
    SBC_far  (d_s)_y  $F3
    SBC_far  (d_x)    $E1
    SBC_far  (d)_y    $F1
    SBC_far  [d]_y    $F7
