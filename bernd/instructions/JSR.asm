; ---- JSR a
    ORG $2000
    FETCH TMP2
    FETCH TMP3
    PUSH PCHI
    PUSH PCLO
    COPY16 PCLO PCHI TMP2 TMP3
    NEXT