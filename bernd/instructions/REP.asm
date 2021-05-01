; Reset M and/or X status flag. Other flags are not allowed here.

; ---- REP #
    ORG $C200
    FETCH TMP4

    ; check allowed values of operand (most likely cases first)
    A TMP4
    OP EOR    
    B V32
    SET TMP0
    B TMP0
    BBZ REP_#_M
    B V16
    SET TMP0
    B TMP0
    BBZ REP_#_X
    B V48
    SET TMP0
    B TMP0
    BBZ REP_#_MX

    ; halt processor on invalid operand
    B V0
REP_#_halt:
    BBZ REP_#_halt
    BBZ REP_#_halt

    ; clear MFLAG
REP_#_M:
    GET0    
    SET MFLAG
    NEXT
    
    ; clear XFLAG and higher bytes of X and Y
REP_#_X:
    GET0    
    SET XFLAG
    SET XHI
    SET YHI
    NEXT
    
    ; combine both operations
REP_#_MX:
    GET0    
    SET MFLAG
    SET XFLAG
    SET XHI
    SET YHI
    NEXT
