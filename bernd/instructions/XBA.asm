; ---- XBA i
    ORG $EB00
    GET ALO
    SET TMP0
    GET AHI
    SET ALO
    GET TMP0
    SET AHI
    NZ16 ALO AHI
    NEXT
