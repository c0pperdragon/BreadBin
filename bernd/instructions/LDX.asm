
; ---- LDX #
    ORG $A200
    FETCH XLO
    BRINDEX16 LDX_#_16bit
    NZ8 XLO
    NEXT
LDX_#_16bit:    
    FETCH XHI
    NZ16 XLO XHI
    NEXT

MACRO LDX_near amode opcode    
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP2 TMP3 
    LOAD_POSTINC TMP2 TMP3 V0 XLO
    BRINDEX16 LDX_ >< amode >< _16bit
    NZ8 XLO
    NEXT
LDX_ >< amode >< _16bit:    
    LOAD TMP2 TMP3 V0 XHI
    NZ16 XLO XHI
    NEXT
ENDMACRO
    
MACRO LDX_far amode opcode    
    ORG opcode >< 00    
    FETCHADDRESS_ >< amode TMP2 TMP3 TMP4 
    LOAD TMP2 TMP3 TMP4 XLO
    BRINDEX16 LDX_ >< amode >< _16bit
    NZ8 XLO
    NEXT
LDX_ >< amode >< _16bit:    
    INC24 TMP2 TMP3 TMP4
    LOAD TMP2 TMP3 TMP4 XHI
    NZ16 XLO XHI
    NEXT
ENDMACRO

    
    LDX_far  a     $AE
    LDX_far  a_y   $BE
    LDX_near d     $A6
    LDX_near d_y   $B6
    