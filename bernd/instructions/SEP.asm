; Set a bunch of status flags. These flags are distributed across different registers.

; ---- REP #
    ORG $E200
    FETCH TMP4

    ; check if CFLAG needs to be set
    A TMP4
    B V1
    OP AND
    SET TMP0
    A TMP0
    B V0
    BEQ SEP_#_noC
    ; set CFLAG
    GET V1
    SET CFLAG
SEP_#_noC:

    ; check if ZFLAG needs to be set
    A TMP4
    B V2
    OP AND
    SET TMP0
    A TMP0
    B V0
    BEQ SEP_#_noZ
    ; set ZFLAG
    GET V0    
    SET ZFLAG
SEP_#_noZ:

    ; check if NFLAG needs to be set
    A TMP4
    B TMP4
    OP OVL
    SET TMP0
    A TMP0
    B V0
    BEQ SEP_#_noN
    ; set NFLAG
    GET V255    
    SET NFLAG
SEP_#_noN:

    ; continue with the M and X flags from higher nibble
    A TMP4
    B V4
    OP DIV
    SET TMP4
    A TMP4
    SET TMP4  

    ; check if XFLAG needs to be set
    A TMP4
    B V1
    OP AND
    SET TMP0
    A TMP0
    B V0
    BEQ SEP_#_noX
    ; set XFLAG
    GET V1    
    SET XFLAG
SEP_#_noX:
    
    ; check if MFLAG needs to be set
    A TMP4
    B V2
    OP AND
    SET TMP0
    A TMP0
    B V0
    BEQ SEP_#_noM
    ; set MFLAG
    GET V1    
    SET MFLAG
SEP_#_noM:
    

    NEXT