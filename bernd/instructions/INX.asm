
; ---- INX i
    ORG $E800
    A XLO
    B V1
    OP ADD
    SET XLO
    SET ZFLAG
    SET NFLAG
    OP OVL
    SET TMP4
    BRINDEX16 INX_i_16bit
    NEXT
INX_i_16bit: 
    A XHI
    B TMP4
    OP ADD
    SET XHI
    SET NFLAG
    COMPUTEZFLAG XLO XHI
    NEXT
