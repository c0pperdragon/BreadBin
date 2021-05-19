
; rotate right 8-bit value. update ZFLAG, NFLAG, CFLAG
MACRO ROR8 r
    B r
    OP ROR
    SET TMP4 ; received the carry in bit 7

    A r
    B CFLAG
    OP ROR
    SET r
    SET NFLAG
    SET ZFLAG

    A TMP4
    B TMP4
    OP OVL
    SET CFLAG  ; transfer bit 7 to bit 0 and clear everything else    
ENDMACRO

; rotate right 16-bit value. update ZFLAG, NFLAG, CFLAG
; temporary value: TMP0
MACRO ROR16 rlo rhi
    B rlo
    OP ROR
    SET TMP4  ; received the carry in bit 7
    
    A rlo
    B rhi
    OP ROR
    SET rlo
    A rhi
    B CFLAG
    SET rhi
    COMPUTENZFLAGS rlo rhi    

    A TMP4
    B TMP4
    OP OVL
    SET CFLAG  ; transfer bit 7 to bit 0 and clear everything else    
ENDMACRO


; ---- ROR A
    ORG $6A00
    BRACCU16 ROR_A_16bit
    ROR8 ALO
    NEXT
ROR_A_16bit:
    ROR16 ALO AHI
    NEXT
