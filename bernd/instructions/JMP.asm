; ---- JMP al
    ORG $5C00
    FETCH TMP1
    FETCH TMP2
    LOAD PCLO PCHI PBR PBR
    A V0
    OP CRY
    B TMP1
    SET PCLO
    B TMP2
    SET PCHI
    NEXT
