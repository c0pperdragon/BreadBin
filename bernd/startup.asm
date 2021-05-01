; ---- STARTUP ----
    ORG $0000
    ; create constant values after cold start
    A V0     ; construct a 0 from arbitary start values
    B V0
    OP EOR
    SET V0   
    A V0     ; construct a 1
    OP INC  
    SET V1
    OP ADD   ; further constructions use ADD
    A V1     ; construct a 16
    B V1
    SET TMP0   ; 2
    A TMP0
    B TMP0
    SET TMP0   ; 4
    A TMP0
    B TMP0
    SET TMP0   ; 8
    A TMP0
    B TMP0
    SET V16  
    A V16     ; construct a 32
    B V16
    SET V32
    A V16     ; construct a 48
    B V32
    SET V48
    A V1      ; construct a 255 
    B V1
    SET TMP0  ; 2
    A TMP0
    SET TMP0  ; 3
    A TMP0
    B V48
    SET TMP0  ; 0x33
    A TMP0
    B TMP0
    SET TMP1  ; 0x66
    A TMP1
    B TMP1
    SET TMP1  ; 0xCC
    A TMP0
    B TMP1
    SET V255   ; 0xFF
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
    A V32
    B V32
    OP ADD
    SET TMP0 ; 64 
    A TMP0
    B TMP0
    SET PBR  ; 128  = $80
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
    