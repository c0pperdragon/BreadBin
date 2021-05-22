; Reset M and/or X status flag. Other flags are not allowed here.

; ---- REP #
    ORG $C200
    FETCH TMP4
    
    ; shift bit for X to lowest bit (4 shifts)
    OP AVG
    X TMP4
    X V0
    SET TMP4  (1. shift)
    X TMP4
    SET TMP4  (2. shift)
    X TMP4
    X V0
    SET TMP4  (3. shift)
    X TMP4
    SET TMP4  (4. shift)
    X TMP4
    BEV REP_#_skipX
    
    ; clear XFLAG and higher bytes of X and Y
    GET V0    
    SET XFLAG
    SET XHI
    SET YHI
    
REP_#_skipX:
    ; shift bit for M to lowest
    OP AVG
    X TMP4
    X V0
    SET TMP4  (5. shift)
    X TMP4
    BEV REP_#_skipM

    ; clear MFLAG
    GET V0    
    SET MFLAG

REP_#_skipM:   
    NEXT
