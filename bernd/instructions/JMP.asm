; ---- JMP al
    ORG $5C00
    FETCH TMP1
    FETCH TMP2
    FETCH PBR  
    GET TMP1
    SET PCLO
    GET TMP2
    SET PCHI
    NEXT
