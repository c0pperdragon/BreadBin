
; provide the source value on the ALU output for setting
MACRO GET source
    A source
    B source
    OP OR
ENDMACRO  
  
; provide a value 0 on the ALU output for setting
MACRO GET0
    A V255
    OP INC
ENDMACRO

; provide a value 0 on the ALU output for setting
MACRO GET1 
    A V0
    OP INC
ENDMACRO
  
; Fetch the next operand byte of the program.
; After reading data into the position given as target, increase PC 
MACRO FETCH target    
    B PBR
    A PCLO
    B PCHI
    IN target
    OP INC
    SET PCLO
    OP CRY
    SET PCHI
ENDMACRO
  
; Fetch the next command opcode from the program and
; Jump to the proper firmware segment. increase PC afterwards.
; Intermediate storage: TMP0
MACRO NEXT
    B PBR
    A PCLO
    B PCHI
    IN TMP0
    OP INC
    SET PCLO
    OP CRY
    JMP TMP0
    SET PCHI  ; make use of delay slot
ENDMACRO

; Fetch next byte from program and treat this as a relative address
; Set program counter to target and fetch next command from there
; Intermediate storage: TMP0 TMP1
MACRO NEXT_RELATIVE freelabel
    FETCH TMP1
    A TMP1    ; determine if high bit is set -> backward branch
    B TMP1
    OP OVL
    SET TMP0
    B TMP0
    BBZ freelabel  
    ; branching backward
    ADD16 PCLO PCHI TMP1 V255
    NEXT
freelabel:    
    ; branching forward
    ADD16 PCLO PCHI TMP1 V0    
    NEXT
ENDMACRO


; add two 16-bit values (no carry out or carry in)
; temporary registers: TMP0
MACRO ADD16 targetlo targethi sourcelo sourcehi
    A targetlo
    B sourcelo
    OP OVL
    SET TMP0
    OP ADD
    SET targetlo
    A targethi
    B sourcehi
    SET targethi
    A targethi
    B TMP0
    SET targethi
ENDMACRO


; Increment a 16-bit value.
MACRO INC16 rlo rhi
    A rlo
    B rhi
    OP INC
    SET rlo
    OP CRY
    SET rhi
ENDMACRO


; Decrement a 16-bit value.
; Intermediate registers: TMP0
MACRO DEC16 rlo rhi
    ADD16 rlo rhi V255 V255
ENDMACRO

; set 2 registers to the values of 2 other registers
MACRO COPY16 targetlo targethi sourcelo sourcehi
    OP CRY
    A V0
    B sourcelo
    SET targetlo
    B sourcehi
    SET targethi
ENDMACRO

; bit-invert the value of the operand
MACRO INV8 operand
    OP EOR
    A V255
    B operand
    SET operand
ENDMACRO



; fetch next byte from program and construct the 16-bit address with DHI/DLO
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_d rlo rhi
    FETCH rlo
    A rlo
    B DLO
    OP OVL
    SET TMP0
    OP ADD
    SET rlo
    A DHI
    B TMP0
    SET rhi
ENDMACRO

; fetch next byte from program and construct the 16-bit address with SPHI/SPLO
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_d_s rlo rhi
    FETCH rlo
    A rlo
    B SLO
    OP OVL
    SET TMP0
    OP ADD
    SET rlo
    A SHI
    B TMP0
    SET rhi
ENDMACRO

; fetch two bytes from program and combine with X to get 16-bit address
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_a_x rlo rhi
    FETCH rlo
    FETCH rhi
    ADD16 rlo rhi XLO XHI
ENDMACRO

; fetch three bytes from program and combine with X to get 16-bit address
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_al_x rlo rhi rbank
    FETCHADDRESS_a_x rlo rhi
    FETCH rbank
ENDMACRO

; fetch address consisting of two bytes
MACRO FETCHADDRESS_a rlo rhi
    FETCH rlo
    FETCH rhi
ENDMACRO

; fetch address consisting of three bytes
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
    B V255
    OP ADD
    SET r
    SET NFLAG
    SET ZFLAG
ENDMACRO

; increment an 8-bit value and set ZFLAG and NFLAG accordingly
MACRO INC8ANDSETNZ r
    A r
    OP INC
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
    A hi
    B hi
    OP OR
    SET NFLAG
    A lo
    SET ZFLAG    
ENDMACRO

