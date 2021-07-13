; This instruction has the most unbelievable quirk I have ever seen in
; a processor design:
; I actually writes not the return address, but one less to the stack.
; This later gets compensated by the RTL instruction.   

; ---- JSL al
    ORG $2200
    FETCH TMP2
    FETCH TMP3
    PUSH PBR
    PUSH PCHI
    PUSH PCLO
    FETCH PBR
    COPY16 PCLO PCHI TMP2 TMP3
    NEXT
