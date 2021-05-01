; Reset a bunch of status flags. These flags are distributed across different registers.

; ---- REP #
    ORG $C200
    FETCH TMP4

    ; check if CFLAG needs to be cleared
    A TMP4
    B V1
    OP AND
    SET TMP0
    B TMP0
    BBZ REP_#_noC
    ; clear CFLAG
    GET V0
    SET CFLAG
REP_#_noC:

    ; check if ZFLAG needs to be cleared
    A TMP4
    B V2
    OP AND
    SET TMP0
    B TMP0
    BBZ REP_#_noZ
    ; clear ZFLAG
    GET V1    
    SET ZFLAG
REP_#_noZ:

    ; check if XFLAG needs to be cleared
    A TMP4
    B V16
    OP AND
    SET TMP0
    B TMP0
    BBZ REP_#_noX
    ; clear XFLAG
    GET V0    
    SET XFLAG
    ; clear high bytes of the index registers    
    SET XHI
    SET YHI
REP_#_noX:
    
    ; check if MFLAG needs to be cleared
    A TMP4
    B V32
    OP AND
    SET TMP0
    B TMP0
    BBZ REP_#_noM
    ; clear MFLAG
    GET V0    
    SET MFLAG
REP_#_noM:

    ; check if NFLAG needs to be cleared
    A TMP4
    B TMP4
    OP OVL
    SET TMP0
    B TMP0
    BBZ REP_#_noN
    ; clear NFLAG
    GET V0    
    SET NFLAG
REP_#_noN:
    
    NEXT
    