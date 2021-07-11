

; ---- AND #
    ORG $2900
    FETCH TMP4
    AND8 ALO TMP4
    BRACCU16 AND_#_16bit
    NZ8 ALO
    NEXT
AND_#_16bit:    
    FETCH TMP4
    AND8 AHI TMP4
    NZ16 ALO AHI
    NEXT
    
MACRO AND_near amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP2 TMP3
    LOAD TMP2 TMP3 V0 TMP5
    AND8 ALO TMP5
    BRACCU16 AND_ >< amode >< _16bit
    NZ8 ALO
    NEXT
AND_ >< amode >< _16bit:
    INC16 TMP2 TMP3
    LOAD TMP2 TMP3 V0 TMP5
    AND8 AHI TMP5
    NZ16 ALO AHI
    NEXT
ENDMACRO

MACRO AND_far amode opcode
    ORG opcode >< 00
    FETCHADDRESS_ >< amode TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 TMP5
    AND8 ALO TMP5
    BRACCU16 AND_ >< amode >< _16bit
    NZ8 ALO
    NEXT
AND_ >< amode >< _16bit:
    INC24 TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 TMP5
    AND8 AHI TMP5
    NZ16 ALO AHI
    NEXT
ENDMACRO

    AND_far  a        $2D
    AND_far  a_x      $3D
    AND_far  a_y      $39
    AND_far  al       $2F
    AND_far  al_x     $3F
    AND_near d        $25
    AND_near d_s      $23
    AND_near d_x      $35
    AND_far  (d)      $32
    AND_far  [d]      $27
    AND_far  (d_s)_y  $33
    AND_far  (d_x)    $21
    AND_far  (d)_y    $31
    AND_far  [d]_y    $37
