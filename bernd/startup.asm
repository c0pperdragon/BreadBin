; ---- STARTUP ----
    ORG $0000
    ; create constant values after cold start
    A V0     ; construct a 0 from arbitary start values
    B V0
    OP NOR
    SET V0
    B V0
    SET V0
    A V0       ; construct 1
    OP INC  
    SET V1
    A V0     ; construct 255
    B V0
    OP NOR
    SET V255
    ; initialize emulated registers
    GET V0
    SET ALO
    SET AHI
    SET DBR
    SET DLO
    SET DHI
    SET XLO
    SET XHI
    SET YLO
    SET YHI
    ; bernd starts execution at $80FFF8
    A V0
    B V1
    OP ROR
    SET PBR  ; $80
    GET V255
    SET PCHI ; 255 = $FF
    A V255
    B V255
    OP ADD
    SET TMP0  ; $FE
    A TMP0
    B TMP0
    SET TMP0  ; $FC
    A TMP0
    B TMP0
    SET PCLO  ; $F8
    ; stack pointer starts at $01FF
    GET V255
    SET SLO
    GET1
    SET SHI
    ; initialize flags
    GET0
    SET CFLAG
    SET NFLAG
    SET ZFLAG
    GET V1
    SET MFLAG
    SET XFLAG
    ; fetch first instruction and continue with it
    NEXT
    