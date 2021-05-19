; Reset M and/or X status flag. Other flags are not allowed here.

; ---- REP #
    ORG $C200
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
    BBE REP_#_skipX
    
    ; clear XFLAG and higher bytes of X and Y
    GET0    
    SET XFLAG
    SET XHI
    SET YHI
    
REP_#_skipX:
    ; shift bit for M to lowest
    OP ROR
    A TMP4
    SET TMP4
    B TMP4
    BBE REP_#_skipM

    ; clear MFLAG
    GET0    
    SET MFLAG

REP_#_skipM:   
    NEXT
