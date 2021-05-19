; Unsupported instructions will cause immediate processor stop

; ---- BVC r
    ORG $5000
    B V0
BVC_r_stop:
    BBE BVC_r_stop
    BBE BVC_r_stop
    
; ---- BVS r
    ORG $7000
    B V0
BVS_r_stop:
    BBE BVS_r_stop
    BBE BVS_r_stop

; ---- CLD i
    ORG $D800
    B V0
CLD_i_stop:
    BBE CLD_i_stop
    BBE CLD_i_stop

; ---- CLV i
    ORG $B800
    B V0
CLV_i_stop:
    BBE CLV_i_stop
    BBE CLV_i_stop

; ---- COP s
    ORG $0200
    B V0
COP_s_stop:
    BBE COP_s_stop
    BBE COP_s_stop

; ---- PHP s
    ORG $0800
    B V0
PHP_s_stop:
    BBE PHP_s_stop
    BBE PHP_s_stop

; ---- PLP s
    ORG $2800
    B V0
PLP_s_stop:
    BBE PLP_s_stop
    BBE PLP_s_stop

; ---- RTI s
    ORG $4000
    B V0
RTI_s_stop:
    BBE RTI_s_stop
    BBE RTI_s_stop

; ---- SED i
    ORG $F800
    B V0
SED_i_stop:
    BBE SED_i_stop
    BBE SED_i_stop

; ---- SEI i
    ORG $7800
    B V0
SEI_i_stop:
    BBE SEI_i_stop
    BBE SEI_i_stop

; ---- STP i
    ORG $DB00
    B V0
STP_i_stop:
    BBE STP_i_stop
    BBE STP_i_stop

; ---- WAI i
    ORG $CB00
    B V0
WAI_i_stop:
    BBE WAI_i_stop
    BBE WAI_i_stop

    
    