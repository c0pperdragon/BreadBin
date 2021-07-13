; Forbidden instructions will cause immediate processor stop
    
; ---- CLD i
    ORG $D800
    NEXT    ; not supported, but harmless

; ---- CLI i
    ORG $5800
    NEXT    ; not supported, but harmless

; ---- COP s
    ORG $0200
    X V0
COP_s_stop:
    BRE COP_s_stop
    BRE COP_s_stop

; ---- RTI s
    ORG $4000
    X V0
RTI_s_stop:
    BRE RTI_s_stop
    BRE RTI_s_stop
    
; ---- SED i
    ORG $F800
    X V0
SED_i_stop:
    BRE SED_i_stop
    BRE SED_i_stop

; ---- SEI i
    ORG $7800
    X V0
SEI_i_stop:
    BRE SEI_i_stop
    BRE SEI_i_stop

; ---- WAI i
    ORG $CB00
    X V0
WAI_i_stop:
    BRE WAI_i_stop
    BRE WAI_i_stop
