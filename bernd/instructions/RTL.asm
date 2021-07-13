; To compenate for the off-by-one quirk of the JSR instruction, the 
; RTL compensates for this by incrementing the program counter after
; retrieval from the stack. 

; ---- RTL s
    ORG $6B00
    PULL PCLO
    PULL PCHI
    PULL PBR
    INC16 PCLO PCHI
    NEXT
