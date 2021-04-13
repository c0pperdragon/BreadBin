; Demo program to drive an 8-bit led display that is directly hooked up to the TX line.

    ORG $0000     
    
    ; Define RAM locations
    ZERO = 0
    ONE = 1
    COUNTER = 2

    ; Set up constant values:
    A ZERO
    B ZERO
    OP EOR
    SET ZERO
    OP DIV    
    SET ONE

    ; Init variables
    A ZERO
    B ZERO
    OP AND
    SET COUNTER

LOOP:
    ; write counter to LED display
    OUT COUNTER

    ; delay loop
    A ZERO
    B ZERO
    OP AND
    SET 30
    SET 31
DELAY:
    A 30
    B ONE
    OP ADD
    SET 30
    A ZERO
    B 30
    BEQ DONE1
    B ZERO
    BEQ DELAY
    NOP
DONE1:
    A 31
    B ONE
    OP ADD
    SET 31
    A ZERO
    B 31
    BEQ DONE2
    B ZERO
    BEQ DELAY
    NOP
DONE2:

    ; increment counter and continue endless loop
    A COUNTER
    B ONE
    OP ADD
    SET COUNTER
    A ZERO
    B ZERO
    BEQ LOOP
    NOP 
