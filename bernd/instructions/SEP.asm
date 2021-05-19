; Set M and/or X status flag. Other flags are not allowed here.

; ---- REP #
    ORG $E200
    FETCH TMP4

    ; shift bit for X to lowest bit
    OP ROR
    A TMP4
    SET TMP4
    A TMP4
    SET TMP4
    A TMP4
    SET TMP4
    A TMP4
    SET TMP4
    B TMP4
    BBE SEP_#_skipX
    
    ; set XFLAG 
    GET1    
    SET XFLAG
    
SEP_#_skipX:
    ; shift bit for M to lowest
    OP ROR
    A TMP4
    SET TMP4
    B TMP4
    BBE SEP_#_skipM

    ; set MFLAG
    GET1   
    SET MFLAG

SEP_#_skipM:   
    NEXT
