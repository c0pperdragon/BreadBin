; ---- XCE i
    ORG $FB00
; Emulation mode is not supported by Bernd, so the E flag can not be changed.
; Any attemp to turn on emulation will halt execution.
; But the instruction will always set the carry flag, so the user code can find out
; that it is running in the Bernd interpreter.
    
    X CFLAG
    BRE XCE_disable_emulation

    ; error condition - loop forever
XCE_stop:
    X V0
    BRE XCE_stop
    NOP
    
XCE_disable_emulation:
    GET1
    SET CFLAG
    NEXT
