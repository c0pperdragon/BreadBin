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
    
    ; Very small bootstrap to be executed from ROM
    ORG $0000
    ; copy the second copy routine to RAM
    SET R1 $80 ; source address in page 0
    ZERO R2    ; target address in code page
    SET R3 ^CODE ; target page 
BOOTSTRAPLOOP:
    DP 0
    LD R0 R1
    DP R3
    ST R0 R2
    SET R0 1
    ADD R1 R0
    ADD R2 R0
    BGE R1 R0 BOOTSTRAPLOOP    
    GOTO COPYROUTINE2   
    
    ; second copy loop: this code is already executed from RAM so it can 
    ; switch ROM banks. It will initialize everything including its own program code,
    ; but this does no harm as it is already in place
    ORG CODE 

COPYROUTINE2:
    ; before doing more copying init the output port registers
    SET R1 $FF
    STORE R1 PORT2
    STORE R1 PORT3
    
    SET R3 $02 ; loop counter: high byte of target address  
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

    ; start user program
    GOTO MAIN
        
; ------------------------------ Serial communication -----------------------
   
    ; This subsystem implements a bit-banged UART communication.
    ; Communication is done with 115200 baud using flow control with RTS/CTS.
    ; With a 10MHz CPU clock, transmission of one serial bit takes 86.8 cycles
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
    ST R1 R0                                 ;       0
    ; do delay
    SET R1 1                                 ; 2     2
    SET R0 23                                ; 2     4
TRANSMIT_DELAYLOOP1:                        
    SUB R0 R1                            ; 1 
    BGE R0 R1 TRANSMIT_DELAYLOOP1        ; 2 
                                             ; 23*3 73 = -14
TRANSMIT_WRITELOOP:
    ; send next bit
    SET R0 .L0                               ; 2   -12
    DP ^L0                                   ; 1   -11
    LD R1 R0                                 ; 2    -9
    SET R0 $FE                               ; 2    -7
    OR R1 R0                                 ; 1    -6
    SET R0 .PORT3                            ; 2    -4
    DP ^PORT3                                ; 1    -3
    ST R1 R0                                 ; 3     0
    ; do delay
    SET R1 1                                 ; 2     2
    SET R0 12                                ; 2     4
TRANSMIT_DELAYLOOP2:
    SUB R0 R1                            ; 1        
    BGE R0 R1 TRANSMIT_DELAYLOOP2        ; 2
                                             ; 12*3 44 = -43
    ; shift bits to right, filling with 1s
    SET R0 .L0                               ; 2   -43
    DP ^L0                                   ; 1   -42
    LD R1 R0                                 ; 2   -40
    SET R0 2                                 ; 2   -38
    DIV R1 R0                                ; 1   -37
    SET R0 $80                               ; 2   -35
    OR R1 R0                                 ; 1   -34
    SET R0 .L0                               ; 2   -32
    DP ^L0                                   ; 1   -31
    ST R1 R0                                 ; 2   -29
    ; decrement counter and loop
    SET R0 .L1                               ; 2   -27
    DP ^L1                                   ; 1   -26
    LD R1 R0                                 ; 2   -25
    SET R0 1                                 ; 2   -23
    SUB R1 R0                                ; 1   -22
    SET R0 .L1                               ; 2   -21 
    DP ^L1                                   ; 1   -20
    ST R1 R0                                 ; 2   -18
    SET R0 1                                 ; 2   -16
    BGE R1 R0 TRANSMIT_WRITELOOP             ; 2   -14

    JMP R2 R3

    
    ; - Read one byte of data from the serial port. This procedure blocks until
    ; one byte is available. It will use the hardware flow control signals to make
    ; the partner only send data if the program is actively listening.
    ; Because the partner may continue sending a few more bytes even after
    ; RTS is de-asserted, a small buffer (8 bytes) is kept .
    ; return R1 .. the byte received 
    ; local L0,L1 return address
    
    AREA DATA 10
RECEIVE_BUFFERFILL:
    BYTE 0              ; number of bytes still available from previous receives
RECEIVE_BUFFERUSED:
    BYTE 0              ; how many bytes of the buffer area alread consumed
RECEIVE_BUFFER:
    BYTE 0 0 0 0 0 0 0 0  ; the buffer itself
    
    AREA CODE 150
RECEIVE:
    ; keep return address
    STORE R2 R3 L0
    
    ; check if there is still some data in the buffer
    LOAD R2 RECEIVE_BUFFERFILL
    LOAD R3 RECEIVE_BUFFERUSED
    BGE R3 R2 RECEIVE_FETCHMORE

    ; fetch one byte from the buffer and return to caller
RECEIVE_USEFROMBUFFER:    
    LOAD R3 RECEIVE_BUFFERUSED
    SET R0 .RECEIVE_BUFFER
    ADD R0 R3
    DP ^RECEIVE_BUFFER
    LD R1 R0
    SET R0 1
    ADD R3 R0
    STORE R3 RECEIVE_BUFFERUSED
    LOAD R2 R3 L0
    JMP R2 R3
    
RECEIVE_FETCHMORE:
    ; reset buffer
    ZERO R1
    STORE R1 RECEIVE_BUFFERFILL
    STORE R1 RECEIVE_BUFFERUSED
    ; prepeare for quick access 
    SET R3 $01  ; mask for bit 0
    ; signal to partner that data can be accepted (RTS low)
    DP ^PORT3
    SET R1 .PORT3
    SET R0 $FD
    ST  R0 R1
    
    ; wait until detecting the start bit (low signal on RX)
RECEIVE_WAITFORSTART:
    LD R0 R1                                    ;     -43
    AND R0 R3                                   ; 1   -42
    BGE R0 R3 RECEIVE_WAITFORSTART              ; 2   -40
    ; immediately turn off the RTS line, 
    ; so partner will not send another byte
    SET R0 $FF                                  ; 2   -38
    ST R0 R1                                    ; 3   -35
    
    ; do delay to get into the middle 
    ; of the first data bit
    SET R1 1                                    ; 2   -33
    SET R0 36                                   ; 2   -31
RECEIVE_DELAYLOOP1:
    SUB R0 R1                               ; 1
    BGE R0 R1 RECEIVE_DELAYLOOP1:           ; 2 
                                                ; 36*3 77
    NOP                                         ; 1    78
RECEIVE_READBITS:                                                
    ZERO R2  ; accumulated bits                 ; 1    79
    SET R3 8 ; bit counter                      ; 2    81
RECEIVE_BITLOOP:
    ; read input bit and move to bit 7 of R1
    SET R0 .PORT3                               ; 2    83
    DP ^PORT3                                   ; 1    84

    LD R1 R0                                    ; 3    87 = 0
    SET R0 1                                    ; 2     2
    AND R1 R0                                   ; 1     3
    SET R0 128                                  ; 2     5
    MUL R1 R0                                   ; 1     6
    ; shift R2 and insert new bit
    SET R0 2                                    ; 2     8
    DIV R2 R0                                   ; 1     9
    OR R2 R1                                    ; 1    10
    ; do delay to get to the next bit
    ; (data or stop bit)
    SET R1 1                                    ; 2    12 
    SET R0 21                                   ; 2    14
RECEIVE_DELAYLOOP2:
    SUB R0 R1                               ; 1
    BGE R0 R1 RECEIVE_DELAYLOOP2:           ; 2
                                                ; 21*3 77
    ; continue for necessary amount of bits       
    SET R0 1                                    ; 2    79
    SUB R3 R0                                   ; 1    80
    BGE R3 R0 RECEIVE_BITLOOP                   ; 2    82
    
    ; add received data to buffer
    LOAD R3 RECEIVE_BUFFERFILL                  ; 5    
    SET R0 .RECEIVE_BUFFER                      ; 2
    ADD R0 R3                                   ; 1
    DP ^RECEIVE_BUFFER                          ; 1
    ST R2 R0                                    ; 2
    SET R0 1                                    ; 2
    ADD R3 R0                                   ; 1
    STORE R3 RECEIVE_BUFFERFILL                 ; 5

    ; prevent buffer from overflow
    SET R0 8                                    ; 2
    BGE R3 R0 RECEIVE_USEFROMBUFFER             ; 2 
    
    ; wait some additional time to see if the partner 
    ; sends more data. synchronize to start bit
    SET R3 $01 ; mask for bit 0, (just a 1)     ; 2
    SET R2 50  ; maximum time to wait           ; 2
    DP ^PORT3                                   ; 1
    SET R1 .PORT3                               ; 2
RECEIVE_WAITFORRESTART:
    SUB R2 R3                                   ; 1 
    BLE R2 R3 RECEIVE_USEFROMBUFFER ; stop      ; 2
    LD R0 R1                                    ; 3   
    AND R0 R3                                   ; 1   -44
    BGE R0 R3 RECEIVE_WAITFORRESTART            ; 2   -42

    ; new start bit found. 
    ; wait until reaching middle of data 
    SET R1 1                                    ; 2   -40
    SET R0 38                                   ; 2   -38
RECEIVE_DELAYLOOP3:
    SUB R0 R1                               ; 1
    BGE R0 R1 RECEIVE_DELAYLOOP3:           ; 2   3*38 76

    BRA RECEIVE_READBITS                        ; 2    78     
    
    
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
    

; ------------ Bootstrapping --------------------------------------------------------- 
    ; store a duplicate of the very low portion of the code to PAGE 0 also,
    ; so it can be accessed by the first copy loop
    ORG $0080
    DUPLICATE CODE 128
