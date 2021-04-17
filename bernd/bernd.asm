; BERND - Emulator for the 65c816 CPU running on the Breadboard controller board
;
; emulated CPU registers
    ALO = 0
    AHI = 1
    DBR = 2
    DLO = 3
    DHI = 4
    XLO = 5
    XHI = 6
    YLO = 7
    YHI = 8
    PBR = 9
    PCLO = 10
    PCHI = 11
    SLO = 12
    SHI = 13
; emulated flags
    CFLAG = 14   ; 1 if carry. 0 otherwise
    NFLAG = 15   ; result of previous alu operation concerning n
    ZFLAG = 16   ; result of previous alu operation converning z
    MFLAG = 17   ; 1 if using 8-bit memory and accu. 0 otherwise
    XFLAG = 18   ; 1 if using 8-bit x,y flags. 0 otherwise
; mem holding constant values
    V0 = 20
    V1 = 21
    V2 = 22
    V128 = 23
    V255 = 24
; temporary storage 
    TMP0 = 25
    TMP1 = 26
    TMP2 = 27
    TMP3 = 28
    TMP4 = 29
; temporary address registers
    ADDRLO = 30
    ADDRHI = 31
  
  
  
; provide the value on the ALU output for setting
MACRO GET source
    A source
    B source
    OP OR
ENDMACRO  
  
; Fetch the next operand byte from the program.
; After reading data into the position given as target, increase PC 
; Intermediate storage: TMP0
MACRO FETCH target    
    A PCLO
    B PCHI
    OUT2 PBR
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
    A PCLO
    B PCHI
    OUT2 PBR
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
MACRO FETCHADDRESS_a
    FETCH ADDRLO
    FETCH ADDRHI
ENDMACRO

; increment value of program counter
MACRO INCREMENTPC
    A PCLO
    B V1
    OP ADD
    SET PCLO
    OP OVL
    SET TMP0
    A TMP0
    B PCHI
    SET PCHI
ENDMACRO

; perform relative (16-bit) jump
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
    A ADDRLO
    B ADDRHI
    OUT2 bank
    OUT value
ENDMACRO 

; load a value from the specified memory bank at address ADDRLO/ADDRHI 
MACRO LOAD bank value
    A ADDRLO
    B ADDRHI
    OUT2 bank
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

