; ---- JSL al
    ORG $2200
    FETCH TMP2
    FETCH TMP3
    FETCH TMP4
    PUSH PBR
    PUSH PCHI
    PUSH PCLO
    A V0
    OP CRY
    B TMP2
    SET PCLO
    B TMP3
    SET PCHI
    B TMP4
    SET PBR
    NEXT
