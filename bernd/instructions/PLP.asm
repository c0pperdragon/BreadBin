; ---- PLP s
    ORG $2800

    ; bits are split into TMP0 - TMP7, where each
    ; register then holds its flag in its highest bit 
    ; the remaining bits are undefined

    PULL NFLAG  ; N flag is already in correct format
    OP ADD
    X NFLAG
    X NFLAG
    SET TMP6
    X TMP6
    X TMP6
    SET TMP5
    X TMP5
    X TMP5
    SET TMP4
    X TMP4
    X TMP4
    SET TMP3
    X TMP3
    X TMP3
    SET TMP2
    X TMP2
    X TMP2
    SET TMP1
    X TMP1
    X TMP1
    SET TMP0

    ; V flag
    OP OVF
    X TMP6
    X TMP6
    SET VFLAG 
    ; M flag
    X TMP5
    X TMP5
    SET MFLAG
    ; X flag
    X TMP4
    X TMP4
    SET XFLAG
    ; D flag
    X TMP3
    X TMP3
    SET TMP3
    ; I flag
    X TMP2
    X TMP2
    SET TMP2
    ; Z flag
    X TMP1   
    X TMP1
    SET ZFLAG
    ; C flag
    X TMP0
    X TMP0
    SET CFLAG
    
    ; transform ZFLAG to proper value range: 0 when set, FF when cleared
    X ZFLAG
    X V255
    OP ADD
    SET ZFLAG  

    ; check if need to clear the XHI and YHI registers when
    ; switching to 8-bit index mode
    X XFLAG
    BRE PLP_keep_16bit_index
    OP ZERO
    SET XHI
    SET YHI
PLP_keep_16bit_index:
    
    ; check for forbidden transitions
    X TMP3  
    BRE  PLP_D_not_set
    X V0
    BRE PLP_halt
PLP_D_not_set:
    X TMP2
    BRE  PLP_I_not_set
    X V0
    BRE PLP_halt
PLP_I_not_set:

    ; everything done
    NEXT
    
    ; in case of an illegal transition, stop the machine
PLP_halt:
    X V0
    BRE PLP_halt
    BRE PLP_halt
    