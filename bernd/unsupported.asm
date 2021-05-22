; Unsupported instructions will cause immediate processor stop

; ---- BVC r
    ORG $5000
    X V0
BVC_r_stop:
    BEV BVC_r_stop
    BEV BVC_r_stop
    
; ---- BVS r
    ORG $7000
    X V0
BVS_r_stop:
    BEV BVS_r_stop
    BEV BVS_r_stop

; ---- CLD i
    ORG $D800
    X V0
CLD_i_stop:
    BEV CLD_i_stop
    BEV CLD_i_stop

; ---- CLV i
    ORG $B800
    X V0
CLV_i_stop:
    BEV CLV_i_stop
    BEV CLV_i_stop

; ---- COP s
    ORG $0200
    X V0
COP_s_stop:
    BEV COP_s_stop
    BEV COP_s_stop

; ---- PHP s
    ORG $0800
    X V0
PHP_s_stop:
    BEV PHP_s_stop
    BEV PHP_s_stop

; ---- PLP s
    ORG $2800
    X V0
PLP_s_stop:
    BEV PLP_s_stop
    BEV PLP_s_stop

; ---- RTI s
    ORG $4000
    X V0
RTI_s_stop:
    BEV RTI_s_stop
    BEV RTI_s_stop
    
; ---- SED i
    ORG $F800
    X V0
SED_i_stop:
    BEV SED_i_stop
    BEV SED_i_stop

; ---- SEI i
    ORG $7800
    X V0
SEI_i_stop:
    BEV SEI_i_stop
    BEV SEI_i_stop

; ---- STP i
    ORG $DB00
    X V0
STP_i_stop:
    BEV STP_i_stop
    BEV STP_i_stop

; ---- WAI i
    ORG $CB00
    X V0
WAI_i_stop:
    BEV WAI_i_stop
    BEV WAI_i_stop
