
; subtract two 8-bit values using the carry flag
; and store into the dest and update CFLAG,NFLAG,ZFLAG
; uses TMP0 and TMP1
MACRO SBC8 destination operand
    ; subtraction works like add with inverted second operand
    ; therefore the meaning of the carry flag is also inverted
    A operand
    B V255
    OP EOR
    SET TMP0
    
    A destination
    B TMP0
    OP ADD
    SET destination
    OP OVL
    SET TMP0  ; first carry possibility
    A destination
    B CFLAG
    OP ADD
    SET destination
    Set NFLAG
    Set ZFLAG
    OP OVL
    SET TMP1  ; second carry possibility
    A TMP0
    B TMP1
    OP OR
    SET CFLAG ; compose carry 
ENDMACRO

; ---- SBC #
    ORG $E900
    FETCH TMP4
    SBC8 ALO TMP4
    BRACCU16 SBC_#_16bit
    NEXT
SBC_#_16bit:    
    FETCH TMP4
    SBC8 AHI TMP4
    COMPUTEZFLAG ALO AHI
    NEXT
