
; rotate right 8-bit value. update ZFLAG, NFLAG, CFLAG
MACRO ROR8 r
    A r
    B CFLAG
    OP ROR
    SET r
    B V1
    OP AND
    SET CFLAG
ENDMACRO

; rotate right 16-bit value. update ZFLAG, NFLAG, CFLAG
; temporary value: TMP0
MACRO ROR16 rlo rhi
    A CFLAG
    B CFLAG
    OP OR
    SET TMP0
    A rlo
    B rhi
    OP ROR
    SET rlo
    B V1
    OP AND
    SET CFLAG
    A rhi
    B TMP0
    OP ROR
    SET rhi
ENDMACRO


; ---- ROR A
    ORG $6A00
    BRACCU16 ROR_A_16bit
    ROR8 ALO
    NEXT
ROR_A_16bit:
    ROR16 ALO AHI
    NEXT
