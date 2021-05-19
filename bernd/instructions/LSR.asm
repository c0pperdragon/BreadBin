; perfrom 8-bit logic shift right and set N,Z,C flags
MACRO LSR8 r
    B r
    OP ROR
    SET TMP4 ; received the carry in bit 7

    A r
    B V0
    OP ROR
    SET r
    SET NFLAG
    SET ZFLAG

    A TMP4
    B TMP4
    OP OVL
    SET CFLAG  ; transfer bit 7 to bit 0 and clear everything else    
ENDMACRO

; perfrom 16-bit logic shift right and set flags
MACRO LSR16 rlo rhi
    B rlo
    OP ROR
    SET TMP4  ; received the carry in bit 7
    
    A rlo
    B rhi
    OP ROR
    SET rlo
    A rhi
    B V0
    SET rhi
    COMPUTENZFLAGS rlo rhi    

    A TMP4
    B TMP4
    OP OVL
    SET CFLAG  ; transfer bit 7 to bit 0 and clear everything else    
ENDMACRO


; ---- LSR A
    ORG $4A00
    BRACCU16 LSR_A_16bit
    LSR8 ALO
    NEXT
LSR_A_16bit:    
    LSR16 ALO AHI
    NEXT
