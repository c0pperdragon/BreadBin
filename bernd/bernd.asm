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
    ZFLAG = 15   ; result of previous alu operation converning z
    XFLAG = 16   ; 1 if using 8-bit x,y. 0 otherwise
                 ; as long as XFLAG is set, XHI and YHI must be kept at 0
    MFLAG = 17   ; 1 if using 8-bit memory and accu. 0 otherwise
    VFLAG = 18   ; 1 if overflow, 0 otherwise
    NFLAG = 19   ; result of previous alu operation concerning n
; temporary storage 
    TMP0 = 20
    TMP1 = 21
    TMP2 = 22
    TMP3 = 23
    TMP4 = 24
    TMP5 = 25
    TMP6 = 26
    TMP7 = 27
    TMP8 = 28
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
include instructions/BIT.asm
include instructions/BMI.asm
include instructions/BNE.asm
include instructions/BPL.asm
include instructions/BRA.asm
include instructions/BRL.asm
include instructions/BVC.asm
include instructions/BVS.asm
include instructions/CLC.asm
include instructions/CLV.asm
include instructions/CMP.asm
include instructions/CPX.asm
include instructions/CPY.asm
include instructions/DEC.asm
include instructions/DEX.asm
include instructions/DEY.asm
include instructions/EOR.asm
include instructions/INC.asm
include instructions/INX.asm
include instructions/INY.asm
include instructions/JML.asm
include instructions/JMP.asm
include instructions/JSL.asm
include instructions/JSR.asm
include instructions/LDA.asm
include instructions/LDX.asm
include instructions/LDY.asm
include instructions/LSR.asm
include instructions/NOP.asm
include instructions/MVN.asm
include instructions/MVP.asm
include instructions/ORA.asm
include instructions/PEA.asm
include instructions/PEI.asm
include instructions/PER.asm
include instructions/PHA.asm
include instructions/PHB.asm
include instructions/PHD.asm
include instructions/PHK.asm
include instructions/PHP.asm
include instructions/PHX.asm
include instructions/PHY.asm
include instructions/PLA.asm
include instructions/PLB.asm
include instructions/PLD.asm
include instructions/PLP.asm
include instructions/PLX.asm
include instructions/PLY.asm
include instructions/REP.asm
include instructions/ROL.asm
include instructions/ROR.asm
include instructions/RTL.asm
include instructions/RTS.asm
include instructions/SBC.asm
include instructions/SEC.asm
include instructions/SEP.asm
include instructions/STA.asm
include instructions/STP.asm
include instructions/STX.asm
include instructions/STY.asm
include instructions/STZ.asm
include instructions/TAX.asm
include instructions/TAY.asm
include instructions/TCD.asm
include instructions/TCS.asm
include instructions/TDC.asm
include instructions/TRB.asm
include instructions/TSB.asm
include instructions/TSC.asm
include instructions/TSX.asm
include instructions/TXA.asm
include instructions/TXS.asm
include instructions/TXY.asm
include instructions/TYA.asm
include instructions/TYX.asm
include instructions/WDM.asm
include instructions/XBA.asm
include instructions/XCE.asm
