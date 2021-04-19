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
; temporary address registers
    ADDRLO = 19
    ADDRHI = 20
; temporary storage 
    TMP0 = 22
    TMP1 = 23
    TMP2 = 24
    TMP3 = 25
    TMP4 = 26
; mem holding constant values
    V1 = 27
    V2 = 28
    V128 = 29
    V255 = 30
    V0 = 31   ; with mem 31 holding 0, executing a 
              ; $FF instruction will jump to $0000, 
              ; instantly resetting the machine
  
  
; provide the value on the ALU output for setting
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
    OUT2
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
    OUT2
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
    SET PCHI
ENDMACRO

; fetch next byte from program and construct the 16-bit address with DHI/DLO
; store result in ADDRLO/ADDRHI
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_d
    FETCH ADDRLO
    A ADDRLO
    B DLO
    OP ADD
    SET ADDRLO
    OP OVL
    SET TMP0
    A DHI
    B TMP0
    OP ADD
    SET ADDRHI
ENDMACRO

; fetch two bytes from program and combine with X to get 16-bit address
; store result in ADDRLO/ADDRHI
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_a_x
    FETCH ADDRLO
    FETCH ADDRHI
    A ADDRLO
    B XLO
    OP ADD
    SET ADDRLO
    OP OVL
    SET TMP0
    A ADDRHI
    B XHI
    OP ADD
    SET ADDRHI
    A ADDRHI
    B TMP0
    SET ADDRHI
ENDMACRO

; fetch two bytes and use as address
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_a
    FETCH ADDRLO
    FETCH ADDRHI
ENDMACRO

; fetch address indirect long. For this, combine the
; next program byte with the DLO,DHI to get the address of the long pointer
; store resulting address in ADDRLO/ADDRHI and the bank number
; in the provided register
; Intermediate storage: TMP0, TMP1, TMP2
MACRO FETCHADDRESS_[d] bank
    FETCHADDRESS_d
    LOAD V0 TMP1
    INCREMENTADDRESS
    LOAD V0 TMP2
    INCREMENTADDRESS
    LOAD V0 bank
    GET TMP1
    SET ADDRLO
    GET TMP2
    SET ADDRHI
ENDMACRO

; increment value of program counter
; Intermediate storage: TMP0 
MACRO INCREMENTPC
    A PCLO
    B V1
    OP ADD
    SET PCLO
    OP OVL
    SET TMP0
    A TMP0
    B PCHI
    OP ADD
    SET PCHI
ENDMACRO

; perform relative (16-bit) jump
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

; increment the 16-bit value ADDRLO/ADDRHI
; Intermediate storage: TMP0 
MACRO INCREMENTADDRESS
    A ADDRLO
    B V1
    OP ADD
    SET ADDRLO
    OP OVL
    SET TMP0
    A TMP0
    B ADDRHI
    SET ADDRHI
ENDMACRO

; store a value into the specified memory bank at address ADDRLO/ADDRHI 
MACRO STORE bank value
    B bank
    OUT2
    A ADDRLO
    B ADDRHI
    OUT value
ENDMACRO 

; load a value from the specified memory bank at address ADDRLO/ADDRHI 
MACRO LOAD bank value
    B bank
    OUT2
    A ADDRLO
    B ADDRHI
    IN value
ENDMACRO 

; perform a branch if the A/M flag is set to 16 bit mode
MACRO BRACCU16 branchtarget
    A V0
    B MFLAG
    BEQ branchtarget
ENDMACRO

; perform a branch if the X flag is set to 16 bit mode
MACRO BRINDEX16 branchtarget
    A V0
    B XFLAG
    BEQ branchtarget
ENDMACRO

; join low and high byte of a 16-bit value to reflect the 
; zero-ness state of the value (basically doing an OR)
MACRO COMPUTEZFLAG lo hi
    A lo
    B hi
    OP OR
    SET ZFLAG
ENDMACRO
  
    
include startup.asm
include instructions/ADC.asm
include instructions/AND.asm
include instructions/BNE.asm
include instructions/CLC.asm
include instructions/INX.asm
include instructions/INY.asm
include instructions/JMP.asm
include instructions/LDA.asm
include instructions/LDX.asm
include instructions/LDY.asm
include instructions/SBC.asm
include instructions/SEC.asm
include instructions/STA.asm
include instructions/TAX.asm
include instructions/XCE.asm

