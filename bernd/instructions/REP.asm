; Reset M and/or X status flag. Other flags are not allowed here.

; ---- REP #
    ORG $C200
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
    OP OVF
    X TMP4
    X TMP4
    SET TMP4  ; X
    X TMP5
    X TMP5
    SET TMP5  ; M
        
    ; clear XFLAG and higher bytes of X and Y if requested
    X TMP4
    BRE REP_#_skipX    
    GET0    
    SET XFLAG
    SET XHI
    SET YHI
REP_#_skipX:

    ; clear MFLAG if requested
    X TMP5
    BRE REP_#_skipM
    GET0    
    SET MFLAG
REP_#_skipM:

    NEXT
