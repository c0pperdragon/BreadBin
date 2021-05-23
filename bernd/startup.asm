; ---- STARTUP ----
    ORG $0000
    ; create constant values after cold start
    X V255     ; construct a 255 from arbitary start values
    X V255
    OP NAND
    SET TMP0
    X TMP0
    X V255
    SET V255
    X V255     ; construct 0
    X V255
    OP NAND
    SET V0
    X V0       ; construct 1
    X V255
    OP CRY  
    SET V1
    X V1       ; construct 128
    OP REV  
    SET V128
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
    GET128
    SET PBR   ; $80
    GET V255
    SET PCHI  ; $FF
    X V255
    X V255
    OP ADD
    SET TMP0  ; $FE
    X TMP0
    X TMP0
    SET TMP0  ; $FC
    X TMP0
    X TMP0
    SET PCLO  ; $F8
    ; stack pointer starts at $01FF
    GET255
    SET SLO
    GET1
    SET SHI
    ; initialize flags
    GET0
    SET CFLAG
    SET NFLAG
    SET ZFLAG
    GET1
    SET MFLAG
    SET XFLAG
    ; fetch first instruction and continue with it
    NEXT
    