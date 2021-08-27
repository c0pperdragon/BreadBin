; ---- STARTUP ----
    ORG $0000
    ; create constant values after cold start
    OP FF      ; construct 255
    SET V255 
    OP ZERO    ; construct 0
    SET V0
    X V0       ; construct 1
    X V255
    OP CRY  
    SET V1
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
    X V0       ; construct 128
    X V255
    OP ROR
    SET PBR   ; $80
    GET255
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
    SET NFLAG
    SET VFLAG
    SET CFLAG
    SET MFLAG
    SET XFLAG
    GET1
    SET ZFLAG
    ; fetch first instruction and continue with it
    NEXT
    