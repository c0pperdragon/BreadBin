; ---- LDA #
    ORG $A900
    FETCH ALO
    BRACCU16 LDA_#_16bit
    NZ8 ALO 
    NEXT
LDA_#_16bit:
    FETCH AHI
    NZ16 ALO AHI
    NEXT


MACRO LDA_near amode opcode
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP2 TMP3
    LOAD TMP2 TMP3 V0 ALO
    BRACCU16 LDA_ >< amode >< _16bit
    NZ8 ALO
    NEXT
LDA_ >< amode >< _16bit:    
    INC16 TMP2 TMP3
    LOAD TMP2 TMP3 V0 AHI
    NZ16 ALO AHI
    NEXT
ENDMACRO

MACRO LDA_far amode opcode
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 ALO
    BRACCU16 LDA_ >< amode >< _16bit
    NZ8 ALO
    NEXT
LDA_ >< amode >< _16bit:    
    INC24 TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 AHI
    NZ16 ALO AHI
    NEXT
ENDMACRO
    
    
    LDA_far  a        $AD
    LDA_far  a_x      $BD
    LDA_far  a_y      $B9
    LDA_far  al       $AF
    LDA_far  al_x     $BF
    LDA_near d        $A5
    LDA_near d_s      $A3
    LDA_near d_x      $B5
    LDA_far  (d)      $B2
    LDA_far  [d]      $A7
    LDA_far  (d_s)_y  $B3
    LDA_far  (d_x)    $A1
    LDA_far  (d)_y    $B1
    LDA_far  [d]_y    $B7
