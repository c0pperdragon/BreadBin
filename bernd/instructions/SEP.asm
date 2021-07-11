; Set various processor status flags.
; V, I are not supported, D is forbidden

; ---- SEP #
    ORG $E200
    
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
    BRE SEP_skip_N
    OP FF
    SET NFLAG
SEP_skip_N:    

    X TMP5          ; M flag
    BRE SEP_skip_M
    GET1    
    SET MFLAG
SEP_skip_M:    
    
    X TMP4           ; X flag
    BRE SEP_skip_X    
    GET1
    SET XFLAG
    OP ZERO    ; when entering 8-bit mode, cut down X and Y
    SET XHI  
    SET YHI
SEP_skip_X:

    X TMP3            ; D flag (causes halt)
    BRE SEP_skip_D
    X V0
SEP_halt:
    BRE  SEP_halt
    BRE  SEP_halt
SEP_skip_D:

    X TMP1          ; Z flag
    BRE SEP_skip_Z
    OP ZERO   
    SET ZFLAG
SEP_skip_Z:    

    X TMP0          ; C flag
    BRE SEP_skip_C
    GET1    
    SET CFLAG
SEP_skip_C:    

    NEXT
