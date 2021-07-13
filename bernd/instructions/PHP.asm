; ---- PHP s
    ORG $0800
    
    ; bring the ZFLAG to a format suitable for storing 
    X ZFLAG
    X ZFLAG
    OP NAND     
    SET TMP1   ; 255 if ZFLAG==0 (meaning result was zero)
    X TMP1
    X V1
    OP OVF
    SET TMP1   ; 1 if result was zero, 0 otherwise
    
    ; bring the NFLAG to a format for storing
    X NFLAG
    X NFLAG
    OP OVF
    SET TMP7
    
    ; collect all remaining flags into TMP7
    OP ADD
    X TMP7
    X TMP7
    SET TMP7  ; shift
    X TMP7
    X VFLAG   
    SET TMP7  ; include V
    X TMP7
    X TMP7
    SET TMP7  ; shift
    X TMP7
    X MFLAG
    SET TMP7  ; include M
    X TMP7
    X TMP7
    SET TMP7  ; shift
    X TMP7
    X XFLAG
    SET TMP7  ; include X
    X TMP7
    X TMP7
    SET TMP7  ; shift
    ; don't include D
    X TMP7
    X TMP7
    SET TMP7  ; shift
    ; don't include I
    X TMP7
    X TMP7
    SET TMP7  ; shift
    X TMP7
    X TMP1
    SET TMP7  ; include Z
    X TMP7
    X TMP7
    SET TMP7  ; shift
    X TMP7
    X CFLAG
    SET TMP7  ; include C
    
    ; finally done
    PUSH TMP7
    NEXT
