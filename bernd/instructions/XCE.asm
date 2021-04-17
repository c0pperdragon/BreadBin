; ---- XCE i
; Emulation mode is not supported by Bernd, so this instruction has no effect
; besides clearing the carry flag
    ORG $FB00
    GET V0
    SET CFLAG
    NEXT
