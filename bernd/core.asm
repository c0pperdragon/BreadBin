; ------ Memory layout and hardware registers   -----------------------------

DATA      = $0200
CODE      = $0800
XDATAPAGE = $0100
XDATABANK = $0101
PORT2     = $0102
PORT3     = $0103

; -------- universally usable variables and call parameters -----------------
    AREA DATA 10
L0: BYTE 0
L1: BYTE 0
L2: BYTE 0
L3: BYTE 0
L4: BYTE 0
L5: BYTE 0
L6: BYTE 0
L7: BYTE 0


; ------ Startup code to copy program from ROM to RAM and start it ----------
    
    ; at first action init output ports to idle level
    ORG $0000
    
    SET R1 $FF
    STORE R1 PORT2
    STORE R1 PORT3
       
    ; copy ROM page 0 containing the second copy loop to RAM page 2
    ZERO R3    ; loop counter
COPYLOOP1:
    DP 0
    LD R1 R3
    DP 2
    ST R1 R3
    SET R0 1
    ADD R3 R0
    BGE R3 R0 COPYLOOP1
    
    GOTO COPYROUTINE2   
    
    ; second copy loop: this code is executed from RAM so it can 
    ; switch ROM banks. 
    ; in order for itself to be copied from page 0, its own ROM location 
    ; and execution address can not be identical 
    ORG $0080 $0280 

COPYROUTINE2:
    SET R3 $03 ; loop counter: high byte of target address  
COPYLOOP2:    
    ; set up the extension memory page address 
    STORE R3 XDATAPAGE
    ; copy a whole page in one loop
    ZERO R2   ; loop counter for low byte target address
INNERLOOP2:
    DP 0
    LD R1 R2
    DP R3
    ST R1 R2
    SET R0 1
    ADD R2 R0
    BGE R2 R0 INNERLOOP2
    ADD R3 R0
    BGE R3 R0 COPYLOOP2

    GOTO MAIN

; ------------------------------ Serial communication -----------------------

    SERIALSTARTBITDELAY = 70
    SERIALBITDELAY = 65

    ; - Write one byte to the serial port
    ; param L0 ... value to write
    ; local L1 ... counter)
    AREA CODE 100
    
SEND:
    ; counter for bits, including stop bit
    SET R1 9
    STORE R1 L1
    
    ; start bit
    SET R1 $FE 
    STORE R1 PORT3
    ; do delay
    SET R1 1
    SET R0 SERIALSTARTBITDELAY
SEND_DELAYLOOP1:
    SUB R0 R1
    BGE R0 R1 SEND_DELAYLOOP1:    

SEND_WRITELOOP:
    ; send next bit
    LOAD R1 L0
    SET R0 $FE
    OR R1 R0
    STORE R1 PORT3
    ; do delay
    SET R1 1
    SET R0 SERIALBITDELAY
SEND_DELAYLOOP2:
    SUB R0 R1
    BGE R0 R1 SEND_DELAYLOOP2:    
    ; shift bits to right, filling with 1-bits
    LOAD R1 L0
    SET R0 2
    DIV R1 R0
    SET R0 $80
    OR R1 R0
    STORE R1 L0
    ; decrement counter and loop
    LOAD R1 L1
    SET R0 1
    SUB R1 R0
    STORE R1 L1
    SET R0 1
    BGE R1 R0 SEND_WRITELOOP

    JMP R2 R3

; ------------------------- Various tools ----------------------------------

   ; - Delay for given number of milliseconds
    ; param L0 ... milliseconds
    AREA CODE 100

DELAY:
    ; keep return address
    STORE R2 R3 L2
DELAY_OUTER:
    ; simple loop to delay 1 millisecond
    SET R0 1
    SET R1 0
    SET R2 12
DELAY_INNER:
    SUB R1 R0
    BGE R1 R0 DELAY_INNER
    SUB R2 R0
    BGE R2 R0 DELAY_INNER    
    ; subtract 1 millisecond 
    LOAD R1 L0
    SET R0 1
    SUB R1 R0
    STORE R1 L0
    SET R0 1
    BGE R1 R0 DELAY_OUTER
    ; retrieve return address
    LOAD R2 R3 L2
    JMP R2 R3
    