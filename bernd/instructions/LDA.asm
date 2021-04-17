
; ---- LDA d
    ORG $A500
    FETCHADDRESS_d
    LOAD V0 ALO
    BRACCU16 LDA_d_16bit
    NEXT
LDA_d_16bit:    
    INCREMENTADDRESS
    LOAD V0 AHI
    NEXT

; ---- LDA #
    ORG $A900
    FETCH ALO
    BRACCU16 LDA_#_16bit
    NEXT
LDA_#_16bit:
    FETCH AHI
    NEXT
    
; ---- LDA al,x
    ORG $BF00
    FETCHADDRESS_a_x
    FETCH TMP4      ; data bank
    LOAD TMP4 ALO
    BRACCU16 LDA_alx_16bit
    NEXT
LDA_alx_16bit:    
    INCREMENTADDRESS
    LOAD TMP4 AHI
    NEXT
    
; ---- LDA al
    ORG $AF00
    FETCHADDRESS_a
    FETCH TMP4      ; data bank
    LOAD TMP4 ALO
    BRACCU16 LDA_al_16bit
    NEXT
LDA_al_16bit:    
    INCREMENTADDRESS
    LOAD TMP4 AHI
    NEXT
    