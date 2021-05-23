; ---- XCE i
    ORG $FB00
; Emulation mode is not supported by Bernd, so the E flag can not be changed.
; But the instruction will always set the carry flag, so the user code can find out
; that it is running in the Bernd interpreter.
    GET1
    SET CFLAG
    NEXT
