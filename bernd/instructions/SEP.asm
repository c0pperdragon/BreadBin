; Set M and/or X status flag. Other flags are not allowed here.

; ---- REP #
    ORG $E200
    FETCH TMP4

    
    ; check allowed values of operand (most likely cases first)
    A TMP4
    OP EOR    
    B V32
    SET TMP0
    B TMP0
    BBZ SEP_#_M
    B V16
    SET TMP0
    B TMP0
    BBZ SEP_#_X
    B V48
    SET TMP0
    B TMP0
    BBZ SEP_#_MX

    ; halt processor on invalid operand
    B V0
SEP_#_halt:
    BBZ SEP_#_halt
    BBZ SEP_#_halt

    ; set MFLAG
SEP_#_M:
    GET1    
    SET MFLAG
    NEXT
    
    ; set XFLAG
SEP_#_X:
    GET1    
    SET XFLAG
    NEXT
    
    ; combine both operations
SEP_#_MX:
    GET1    
    SET MFLAG
    SET XFLAG
    NEXT
