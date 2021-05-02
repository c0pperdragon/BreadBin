; ---- JSR a
    ORG $2000
    FETCH TMP2
    FETCH TMP3
    PUSH PCHI
    PUSH PCLO
    A V0
    OP CRY
    B TMP2
    SET PCLO
    B TMP3
    SET PCHI
    NEXT
