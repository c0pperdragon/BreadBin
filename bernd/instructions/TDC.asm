; ---- TDC i
    ORG $7B00
    COPY16 ALO AHI DLO DHI 
    NZ16 ALO AHI
    NEXT
    