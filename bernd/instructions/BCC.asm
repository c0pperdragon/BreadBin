; ---- BCC r
    ORG $9000
    B CFLAG
    BBZ BCC_r_taken
    INC16 PCLO PCHI
    NEXT
BCC_r_taken:
    FETCH TMP3 
    A TMP3   ; create a sign-extension byte in TMP4
    B TMP3
    OP OVL
    SET TMP4 ; only the sign bit remains
    A TMP4
    B V255
    OP MUL
    SET TMP4
    JUMPRELATIVELONG TMP3 TMP4
    NEXT

