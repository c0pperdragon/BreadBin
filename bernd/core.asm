; ------ Memory layout and hardware registers   -----------------------------

DATA      = $0200
CODE      = $0800
XDATAPAGE = $0100
XDATABANK = $0101
PORT2     = $0102
PORT3     = $0103

; -------- universally usable variables and call parameters -----------------
    AREA DATA 8
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
   
    ; This subsystem implements a bit-banged UART communication.
    ; Communication is done with 115200 baud using flow control with RTS/CTS.
    ; With a 10Mhz CPU clock, transmission of one serial bit takes 86.8 cycles
    ; (using 87 cycles is also OK)    
    ; The serial port is wired up like this:
    ;   TX  out port 3, bit 0
    ;   RX  in port 3, bit 0
    ;   RTS out port 3, bit 1
    ;   CTS in port 3, bit 1

    ; - Write one byte to the serial port. May block execution if hardware flow
    ;   control blocks transmission.
    ; param L0 ... value to write
    ; local L1 ... counter)
    AREA CODE 100
    
TRANSMIT:
    ; wait until partner can accept data (CTS is low)
    LOAD R1 PORT3
    SET R0 $02
    AND R1 R0
    BGE R1 R0 TRANSMIT

    ; counter for bits, including stop bit
    SET R1 9
    STORE R1 L1
    
    ; start bit
    SET R1 $FE 
    SET R0 .PORT3
    DP ^PORT3
    ST R1 R0
    ; do delay
    SET R1 1
    SET R0 10
TRANSMIT_DELAYLOOP1:
    SUB R0 R1
    BGE R0 R1 TRANSMIT_DELAYLOOP1

TRANSMIT_WRITELOOP:
    ; send next bit
    SET R0 .L0
    DP ^L0
    LD R1 R0
    SET R0 $FE
    OR R1 R0
    SET R0 .PORT3
    DP ^PORT3
    ST R1 R0
    ; do delay
    SET R1 1
    SET R0 10
TRANSMIT_DELAYLOOP2:
    SUB R0 R1
    BGE R0 R1 TRANSMIT_DELAYLOOP2
    ; shift bits to right, filling with 1-bits
    SET R0 .L0
    DP ^L0
    LD R1 R0
    SET R0 2
    DIV R1 R0
    SET R0 $80
    OR R1 R0
    SET R0 .L0
    DP ^L0
    ST R1 R0
    ; decrement counter and loop
    SET R0 .L1
    DP ^L1
    LD R1 R0
    SET R0 1
    SUB R1 R0
    SET R0 .L1
    DP ^L1
    ST R1 R0
    SET R0 1
    BGE R1 R0 TRANSMIT_WRITELOOP

    JMP R2 R3

    
    ; - Read one byte of data from the serial port. This procedure blocks until
    ; one byte is available. It will use the hardware flow control signals to make
    ; the partner only send data if the program is actively listening.
    ; return R1 .. the byte received 
    ; local L0,L1 return address
    AREA CODE 100
    
RECEIVE:
    ; keep return address
    STORE R2 R3 L0

    ; prepeare for quick access 
    SET R3 $01  ; mask for bit 0
    ; signal to partner that data can be accepted (RTS low)
    DP ^PORT3
    SET R1 .PORT3
    SET R0 $FD
    ST  R0 R1
    ; wait until detecting the start bit (low signal on RX)
RECEIVE_WAITFORSTART:
    LD R0 R1
    AND R0 R3
    BGE R0 R3 RECEIVE_WAITFORSTART
    ; immediately turn off the RTS line, so partner will not send another byte
    SET R0 $FF
    ST R0 R1
    
    ; do delay to get into the middle of the first data bit
    SET R1 1
    SET R0 10
RECEIVE_DELAYLOOP1:
    SUB R0 R1
    BGE R0 R1 RECEIVE_DELAYLOOP1:    

    ZERO R2  ; accumulated bits
    SET R3 8 ; bit counter
RECEIVE_BITLOOP:
    ; read input bit and move to bit 7 of R1
    SET R0 .PORT3
    DP ^PORT3
    LD R1 R0
    SET R0 1
    AND R1 R0
    SET R0 128
    MUL R1 R0
    ; shift R2 and insert new bit
    SET R0 2
    DIV R2 R0
    OR R2 R1
    ; do delay to get to the next bit (data or stop bit)
    SET R1 1
    SET R0 10
RECEIVE_DELAYLOOP2:
    SUB R0 R1
    BGE R0 R1 RECEIVE_DELAYLOOP2:    
    ; continue for necessary amount of bits
    SET R0 1
    SUB R3 R0
    BGE R3 R0 RECEIVE_BITLOOP
    
    ; transfer R2 to R1 as return value
    AND R1 R2
    OR R1 R2
    ; retrieve return address and finish
    LOAD R2 R3 L0
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
    