; Clear various processor status flags.
; I, D are not supported

; ---- REP #
    ORG $C200
    
    ; bits are split into TMP0 - TMP7, where each
    ; register holds its flag in its lowest bit
    ; the remaining bits are undefined
    FETCH TMP0 
    OP ROR
    X TMP0
    X V0
    SET TMP1
    X TMP1
    X V0
    SET TMP2
    X TMP2
    X V0
    SET TMP3
    X TMP3
    X V0
    SET TMP4
    X TMP4
    X V0
    SET TMP5
    X TMP5
    X V0
    SET TMP6
    X TMP6
    X V0
    SET TMP7
    
    X TMP7          ; N flag
    BRE REP_skip_N
    OP ZERO
    SET NFLAG
REP_skip_N:    

    X TMP6          ; V flag
    BRE REP_skip_V
    OP ZERO
    SET VFLAG
REP_skip_V:

    X TMP5          ; M flag
    BRE REP_skip_M
    OP ZERO    
    SET MFLAG
REP_skip_M:    
    
    X TMP4           ; X flag
    BRE REP_skip_X    
    OP ZERO
    SET XFLAG
REP_skip_X:

    X TMP1          ; Z flag
    BRE REP_skip_Z
    OP FF    
    SET ZFLAG
REP_skip_Z:    

    X TMP0          ; C flag
    BRE REP_skip_C
    OP ZERO    
    SET CFLAG
REP_skip_C:    

    NEXT
