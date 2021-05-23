; Set M and/or X status flag. Other flags are not allowed here.

; ---- REP #
    ORG $E200
    FETCH TMP5
    
    ; separate M and X bits 
    OP ADD
    X TMP5
    X TMP5
    SET TMP5
    X TMP5
    X TMP5
    SET TMP5
    X TMP5
    X TMP5
    SET TMP4
    X TMP4
    OP REV
    SET TMP4  ; X
    X TMP5
    SET TMP5  ; M
        
    ; set XFLAG if requested
    X TMP4
    BRE SEP_#_skipX    
    GET1
    SET XFLAG
SEP_#_skipX:

    ; set MFLAG if requested
    X TMP5
    BRE SEP_#_skipM
    GET1
    SET MFLAG
SEP_#_skipM:

    NEXT
