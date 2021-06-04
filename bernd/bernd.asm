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
    TMP0 = 19
    TMP1 = 20
    TMP2 = 21
    TMP3 = 22
    TMP4 = 23
    TMP5 = 24
; useful constant values
    V255 = 29
    V1 = 30
    V0 = 31   ; with register 31 holding 0, executing a 
              ; $FF instruction will jump to $0000, 
              ; instantly resetting the machine
  
  

include macros.asm
include startup.asm
include unsupported.asm
include instructions/ADC.asm
include instructions/AND.asm
include instructions/ASL.asm
include instructions/BCC.asm
include instructions/BCS.asm
include instructions/BEQ.asm
include instructions/BMI.asm
include instructions/BNE.asm
include instructions/BRA.asm
include instructions/BRL.asm
include instructions/CLC.asm
include instructions/CMP.asm
include instructions/DEC.asm
include instructions/DEX.asm
include instructions/INC.asm
include instructions/INX.asm
include instructions/INY.asm
include instructions/JMP.asm
include instructions/JSL.asm
include instructions/JSR.asm
include instructions/LDA.asm
include instructions/LDX.asm
include instructions/LDY.asm
include instructions/LSR.asm
include instructions/MVN.asm
include instructions/PEA.asm
include instructions/PEI.asm
include instructions/PHA.asm
include instructions/PHD.asm
include instructions/PLA.asm
include instructions/PLD.asm
include instructions/REP.asm
include instructions/ROR.asm
include instructions/RTL.asm
include instructions/RTS.asm
include instructions/SBC.asm
include instructions/SEC.asm
include instructions/SEP.asm
include instructions/STA.asm
include instructions/STY.asm
include instructions/STZ.asm
include instructions/TAX.asm
include instructions/TAY.asm
include instructions/TCD.asm
include instructions/TCS.asm
include instructions/TDC.asm
include instructions/TSC.asm
include instructions/TXA.asm
include instructions/TXY.asm
include instructions/TYA.asm
include instructions/TYX.asm
include instructions/XCE.asm

