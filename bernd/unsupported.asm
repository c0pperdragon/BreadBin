; Unsupported instructions will cause immediate processor stop

; ---- BVC r
    ORG $5000
    X V0
BVC_r_stop:
    BRE BVC_r_stop
    BRE BVC_r_stop
    
; ---- BVS r
    ORG $7000
    X V0
BVS_r_stop:
    BRE BVS_r_stop
    BRE BVS_r_stop

; ---- CLD i
    ORG $D800
    X V0
CLD_i_stop:
    BRE CLD_i_stop
    BRE CLD_i_stop

; ---- CLV i
    ORG $B800
    X V0
CLV_i_stop:
    BRE CLV_i_stop
    BRE CLV_i_stop

; ---- COP s
    ORG $0200
    X V0
COP_s_stop:
    BRE COP_s_stop
    BRE COP_s_stop

; ---- PHP s
    ORG $0800
    X V0
PHP_s_stop:
    BRE PHP_s_stop
    BRE PHP_s_stop

; ---- PLP s
    ORG $2800
    X V0
PLP_s_stop:
    BRE PLP_s_stop
    BRE PLP_s_stop

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

; ---- STP i
    ORG $DB00
    X V0
STP_i_stop:
    BRE STP_i_stop
    BRE STP_i_stop

; ---- WAI i
    ORG $CB00
    X V0
WAI_i_stop:
    BRE WAI_i_stop
    BRE WAI_i_stop
