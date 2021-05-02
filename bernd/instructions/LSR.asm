; perfrom 8-bit logic shift right and set N,Z,C flags
MACRO LSR8 r
    A r
    B V1
    OP AND
    SET CFLAG    
    B V0
    OP ROR
    SET r
    SET NFLAG
    SET ZFLAG
ENDMACRO

; perfrom 16-bit logic shift right and set flags
MACRO LSR16 rlo rhi
    A rlo
    B V1
    OP AND
    SET CFLAG    
    B rhi
    OP ROR
    SET rlo
    A rhi
    B V0
    SET rhi
    COMPUTENZFLAGS ALO AHI    
ENDMACRO


; ---- LSR A
    ORG $4A00
    BRACCU16 LSR_A_16bit
    LSR8 ALO
    NEXT
LSR_A_16bit:    
    LSR16 ALO AHI
    NEXT
