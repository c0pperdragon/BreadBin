; Set M and/or X status flag. Other flags are not allowed here.

; ---- REP #
    ORG $E200
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
    BEV SEP_#_skipX
    
    ; set XFLAG 
    GET V1    
    SET XFLAG
    
SEP_#_skipX:
    ; shift bit for M to lowest
    OP AVG
    X TMP4
    X V0
    SET TMP4
    X TMP4
    BEV SEP_#_skipM

    ; set MFLAG
    GET V1   
    SET MFLAG

SEP_#_skipM:   
    NEXT
