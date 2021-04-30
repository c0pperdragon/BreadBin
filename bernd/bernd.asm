; BERND - Emulator for the 65c816 CPU running on the Breadboard controller board
;
; emulated CPU registers
    PCLO = 0
    PCHI = 1
    PBR = 2
    ALO = 3
    AHI = 4
    DBR = 5
    DLO = 6
    DHI = 7
    XLO = 8
    XHI = 9
    YLO = 10
    YHI = 11
    SLO = 12
    SHI = 13
; emulated flags (individually addressable)
    CFLAG = 14   ; 1 if carry. 0 otherwise
    NFLAG = 15   ; result of previous alu operation concerning n
    ZFLAG = 16   ; result of previous alu operation converning z
    MFLAG = 17   ; 1 if using 8-bit memory and accu. 0 otherwise
    XFLAG = 18   ; 1 if using 8-bit x,y. 0 otherwise
                 ; as long as XFLAG is set, XHI and XLO must be kept at 0
; temporary storage 
    TMP0 = 22
    TMP1 = 23
    TMP2 = 24
    TMP3 = 25
    TMP4 = 26
; constant values
    V1 = 27
    V2 = 28
    V4 = 29
    V255 = 30
    V0 = 31   ; with register 31 holding 0, executing a 
              ; $FF instruction will jump to $0000, 
              ; instantly resetting the machine
  
  
; provide the source value on the ALU output for setting
MACRO GET source
    A source
    B source
    OP OR
ENDMACRO  
  
; Fetch the next operand byte of the program.
; After reading data into the position given as target, increase PC 
; Intermediate storage: TMP0
MACRO FETCH target    
    B PBR
    A PCLO
    B PCHI
    IN target
    B V1
    OP ADD
    SET PCLO
    OP OVL
    SET TMP0
    A PCHI
    B TMP0
    OP ADD
    SET PCHI
ENDMACRO
  
; Fetch the next command opcode from the program and
; Jump to the proper firmware segment. increase PC afterwards.
; Intermediate storage: TMP0, TMP1
MACRO NEXT
    B PBR
    A PCLO
    B PCHI
    IN TMP1
    B V1
    OP ADD
    SET PCLO
    OP OVL
    SET TMP0
    A PCHI
    B TMP0
    OP ADD
    JMP TMP1
    SET PCHI  ; make use of delay slot
ENDMACRO

; fetch next byte from program and construct the 16-bit address with DHI/DLO
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_d rlo rhi
    FETCH rlo
    A rlo
    B DLO
    OP ADD
    SET rlo
    OP OVL
    SET TMP0
    A DHI
    B TMP0
    OP ADD
    SET rhi
ENDMACRO

; fetch next byte from program and construct the 16-bit address with SPHI/SPLO
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_d_s rlo rhi
    FETCH rlo
    A rlo
    B SLO
    OP ADD
    SET rlo
    OP OVL
    SET TMP0
    A SHI
    B TMP0
    OP ADD
    SET rhi
ENDMACRO

; fetch two bytes from program and combine with X to get 16-bit address
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_a_x rlo rhi
    FETCH rlo
    FETCH rhi
    A rlo
    B XLO
    OP ADD
    SET rlo
    OP OVL
    SET TMP0
    A rhi
    B XHI
    OP ADD
    SET rhi
    A rhi
    B TMP0
    SET rhi
ENDMACRO

; fetch three bytes from program and combine with X to get 16-bit address
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_al_x rlo rhi rbank
    FETCHADDRESS_a_x rlo rhi
    FETCH rbank
ENDMACRO

; fetch address consisting of two bytes
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_a rlo rhi
    FETCH rlo
    FETCH rhi
ENDMACRO

; fetch address consisting of three bytes
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_al rlo rhi rbank
    FETCHADDRESS_a rlo rhi
    FETCH rbank
ENDMACRO

; fetch address indirect long. For this, combine the
; next program byte with the DLO,DHI to get the address of the long pointer
; Intermediate storage: TMP0, TMP1
MACRO FETCHADDRESS_[d] rlo rhi rbank
    FETCHADDRESS_d TMP1 rbank  ; use target register as temporary storage
    LOAD TMP1 rbank V0 rlo
    INC16 TMP1 rbank
    LOAD TMP1 rbank V0 rhi
    INC16 TMP1 rbank
    LOAD TMP1 rbank V0 rbank
ENDMACRO

; Increment a 16-bit value.
; Intermediate registers: TMP0
MACRO INC16 rlo rhi
    A rlo
    B V1
    OP ADD
    SET rlo
    OP OVL
    SET TMP0
    A TMP0
    B rhi
    OP ADD
    SET rhi
ENDMACRO

; Decrement a 16-bit value.
; Intermediate registers: TMP0
MACRO DEC16 rlo rhi
    A rlo
    B V1
    OP SUB
    SET rlo
    A rlo
    B V255
    OP DIV
    SET TMP0
    A rhi
    B TMP0
    OP SUB
    SET rhi
ENDMACRO



; perform relative jump with 16-bit offset
; Intermediate storage: TMP0 
MACRO JUMPRELATIVELONG offsetlo offsethi
    A PCLO
    B offsetlo
    OP ADD
    SET PCLO
    OP OVL
    SET TMP0
    A PCHI
    B offsethi
    OP ADD
    SET PCHI
    A PCHI
    B TMP0
    SET PCHI
ENDMACRO

; perform a relative jump with an 8-bit offset
; Intermediate storage: TMP0, TMP1
MACRO JUMPRELATIVE offset
    A offset   ; create a sign-extension byte in TMP1
    B offset
    OP OVL
    SET TMP1 ; only the sign bit remains
    A TMP1
    B V255
    OP MUL
    SET TMP1
    JUMPRELATIVELONG offset TMP1
ENDMACRO

; store a value into the specified memory location and bank 
MACRO STORE rlo rhi bank value
    B bank
    A rlo
    B rhi
    OUT value
ENDMACRO 

; load a value from the specified memory location and bank 
MACRO LOAD rlo rhi bank value
    B bank
    A rlo
    B rhi
    IN value
ENDMACRO 

; store an 8-bit value on the stack
; Intermediate storage: TMP0 
MACRO PUSH value
    STORE SLO SHI V0 value
    DEC16 SLO SHI
ENDMACRO

; fetch an 8-bit value from the stack
; Intermediate storage: TMP0 
MACRO PULL value
    INC16 SLO SHI
    LOAD SLO SHI V0 value
ENDMACRO

; perform a branch if the A/M flag is set to 16 bit mode
MACRO BRACCU16 branchtarget
    B MFLAG
    BBZ branchtarget
ENDMACRO

; perform a branch if the X flag is set to 16 bit mode
MACRO BRINDEX16 branchtarget
    B XFLAG
    BBZ branchtarget
ENDMACRO

; decrement an 8-bit value and set ZFLAG and NFLAG accordingly
MACRO DEC8ANDSETNZ r
    A r
    B V1
    OP SUB
    SET r
    SET NFLAG
    SET ZFLAG
ENDMACRO

; increment an 8-bit value and set ZFLAG and NFLAG accordingly
MACRO INC8ANDSETNZ r
    A r
    B V1
    OP ADD
    SET r
    SET NFLAG
    SET ZFLAG
ENDMACRO

; join low and high byte of a 16-bit value to reflect the 
; zero-ness state of the value (basically doing an OR)
MACRO COMPUTEZFLAG lo hi
    A lo
    B hi
    OP OR
    SET ZFLAG
ENDMACRO

; compute N and Z flags from a 16-bit value
MACRO COMPUTENZFLAGS lo hi
    A lo
    B hi
    OP OR
    SET ZFLAG
    B hi
    SET NFLAG    
ENDMACRO

  
    
include startup.asm
include unsupported.asm
include instructions/ADC.asm
include instructions/AND.asm
include instructions/BCC.asm
include instructions/BEQ.asm
include instructions/BNE.asm
include instructions/BRA.asm
include instructions/CLC.asm
include instructions/DEC.asm
include instructions/DEX.asm
include instructions/INC.asm
include instructions/INX.asm
include instructions/INY.asm
include instructions/JMP.asm
include instructions/JSL.asm
include instructions/LDA.asm
include instructions/LDX.asm
include instructions/LDY.asm
include instructions/MVN.asm
include instructions/PEA.asm
include instructions/PEI.asm
include instructions/PHA.asm
include instructions/PHD.asm
include instructions/PLA.asm
include instructions/REP.asm
include instructions/RTL.asm
include instructions/SBC.asm
include instructions/SEC.asm
include instructions/SEP.asm
include instructions/STA.asm
include instructions/TAX.asm
include instructions/TCD.asm
include instructions/TCS.asm
include instructions/TSC.asm
include instructions/TXY.asm
include instructions/TYX.asm
include instructions/XCE.asm

