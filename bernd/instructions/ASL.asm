
; shift left 8-bit value. update ZFLAG, NFLAG, CFLAG
MACRO ASL8 r
    X r
    X r
    OP ADD
    SET r
    SET ZFLAG
    SET NFLAG
    OP OVF
    SET CFLAG
ENDMACRO

; shift left 16-bit value. update ZFLAG, NFLAG, CFLAG
; temporary value: TMP0
MACRO ASL16 rlo rhi
    X rlo
    X rlo
    OP ADD
    SET rlo   ; multiply by 2
    SET ZFLAG ; first half of zero - detection
    OP OVF  
    SET TMP0  ; carry from Bit7 to bit 8
    X rhi
    X rhi
    OP OVF
    SET CFLAG ; carry out from bit15 
    OP ADD    
    SET rhi   ; multiply high byte by 2
    X TMP0
    X rhi
    SET rhi   ; include the carry-in from low byte
    SET NFLAG
    COMPUTEZFLAG rhi ZFLAG  ; combine both bytes for zero-detection
ENDMACRO


; ---- ASL A
    ORG $0A00
    BRACCU16 ASL_A_16bit
    ASL8 ALO
    NEXT
ASL_A_16bit:
    ASL16 ALO AHI
    NEXT
