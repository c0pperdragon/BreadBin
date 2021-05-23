; ---- TCD i
    ORG $5B00
    COPY16 DLO DHI ALO AHI
    NZ16 DLO DHI
    NEXT
    