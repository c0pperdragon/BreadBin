; ---- STARTUP ----
    ORG $0000
    ; create constant values from cold start
    A V0     ; construct a 0
    B V0
    OP EOR
    SET V0
    A V0     ; construct a 1
    B V0   
    OP DIV
    SET V1
    A V1     ; construct a 2
    B V1
    OP ADD
    SET V2   
    A V2     ; construct 128
    B V2
    OP MUL
    SET TMP0 ; 4
    A TMP0
    B TMP0
    OP MUL
    SET TMP0 ; 16
    OP ADD
    SET TMP1 ; 8
    A TMP0
    B TMP1
    OP MUL
    SET V128 ; 128
    A V1     ; construct a 255
    B V0
    OP DIV
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
    ; bernd starts program at $80FFF8
    GET V128
    SET PBR
    GET V255
    SET PCHI
    A V255
    B V2
    OP MUL
    SET PCLO  ; $FE
    A PCLO
    SET PCLO  ; $FC
    A PCLO
    SET PCLO  ; $F8
    ; stack pointer starts at $00FF
    GET V255
    SET SLO
    GET V0
    SET SHI
    ; flags
    GET V0
    SET CFLAG
    SET NFLAG
    SET ZFLAG
    GET V1
    SET MFLAG
    SET XFLAG
    ; fetch first instruction and continue with it
    NEXT
    