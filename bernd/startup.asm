; ---- STARTUP ----
    ORG $0000
    ; create constant values after cold start
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
    A V2     ; construct a 4
    B V2
    OP ADD
    SET V4   
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
    A V4
    B V4
    OP MUL
    SET PBR  ; -> 16
    A PBR
    B V4
    SET PBR  ; -> 64
    A PBR
    B V2
    SET PBR  ; -> 128  = $80  
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
    ; stack pointer starts at $01FF
    GET V255
    SET SLO
    GET V1
    SET SHI
    ; initialize flags
    GET V0
    SET CFLAG
    SET NFLAG
    SET ZFLAG
    GET V1
    SET MFLAG
    SET XFLAG
    ; fetch first instruction and continue with it
    NEXT
    