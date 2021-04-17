
; ---- INY i
    ORG $C800
    A YLO
    B V1
    OP ADD
    SET YLO
    SET ZFLAG
    SET NFLAG
    OP OVL
    SET TMP4
    BRINDEX16 INY_i_16bit
    NEXT
INY_i_16bit: 
    A YHI
    B TMP4
    OP ADD
    SET YHI
    SET NFLAG
    COMPUTEZFLAG YLO YHI
    NEXT
