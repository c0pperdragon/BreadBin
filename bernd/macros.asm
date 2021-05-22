
; provide the source value on the ALU output for setting
MACRO GET source
    X source
    X V0
    OP ADD
ENDMACRO  
   
; Fetch the next operand byte of the program.
; After reading data into the position given as target, increase PC 
MACRO FETCH target    
    X PBR
    X PCHI
    X PCLO
    IN target
    OP CRY
    SET PCHI
    X V255
    SET PCLO
ENDMACRO

; increment program counter without fetching data
MACRO SKIP
    INC16 PCLO PCHI
ENDMACRO

; Fetch the next command opcode from the program and
; Jump to the proper firmware segment. increase PC afterwards.
; Intermediate storage: TMP0
MACRO NEXT
    X PBR
    X PCHI
    X PCLO
    IN TMP0
    OP CRY
    SET PCHI
    X V255
    JMP TMP0
    SET PCLO  ; make use of delay slot
ENDMACRO

; Fetch next byte from program and treat this as a relative address
; Set program counter to target and fetch next command from there
; Intermediate storage: all temporaries
MACRO NEXT_RELATIVE
    FETCH TMP3    ; this is a signed 8-bit offset
    ; tricky operation to sign-extend to a 16-bit value
    X TMP3
    X TMP3
    OP OVF
    SET TMP4  ; 0 if positive, 1 if negative
    X TMP4
    X TMP4
    OP NAND
    SET TMP4  ; 255 if positive, 254 if negative
    X TMP4
    X V1
    OP ADD    
    SET TMP4  ; 0 if positive, 255 if negative
    ; do the relative jump
    ADD16 PCLO PCHI TMP3 TMP4
    NEXT
ENDMACRO


; add two 16-bit values (no carry out or carry in)
; temporary registers: TMP0
MACRO ADD16 targetlo targethi sourcelo sourcehi
    X targetlo
    X sourcelo
    OP OVF
    SET TMP0
    OP ADD
    SET targetlo
    X targethi
    X sourcehi
    SET targethi
    X targethi
    X TMP0
    SET targethi
ENDMACRO


; Increment a 16-bit value.
MACRO INC16 rlo rhi
    X rhi
    X rlo
    OP CRY
    SET rhi
    X V255
    SET rlo
ENDMACRO

; Decrement a 16-bit value.
; Intermediate registers: TMP0
MACRO DEC16 rlo rhi
    ADD16 rlo rhi V255 V255
ENDMACRO


; set 2 registers to the values of 2 other registers
MACRO COPY16 targetlo targethi sourcelo sourcehi
    OP ADD
    X sourcelo
    X V0
    SET targetlo
    X sourcehi
    SET targethi
ENDMACRO

; bit-invert the value of the operand
MACRO INV8 operand
    X operand
    X operand
    OP NAND
    SET operand
ENDMACRO


; fetch next byte from program and construct the 16-bit address with DHI/DLO
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_d rlo rhi
    FETCH rlo
    X DLO
    X rlo
    OP OVF
    SET TMP0
    OP ADD
    SET rlo
    X TMP0
    X DHI
    SET rhi
ENDMACRO

; fetch next byte from program and construct the 16-bit address with SPHI/SPLO
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_d_s rlo rhi
    FETCH rlo
    X SLO
    X rlo
    OP OVF
    SET TMP0
    OP ADD
    SET rlo
    X TMP0
    X SHI
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

; fetch address indirect long. For this, combine the
; next program byte with the DLO,DHI to get the address of the long pointer
; Intermediate storage: TMP0, TMP1
MACRO FETCHADDRESS_[d]_y rlo rhi rbank
    FETCHADDRESS_d TMP1 rbank  ; use target register as temporary storage
    LOAD TMP1 rbank V0 rlo
    INC16 TMP1 rbank
    LOAD TMP1 rbank V0 rhi
    INC16 TMP1 rbank
    LOAD TMP1 rbank V0 rbank
    ADD16 rlo rhi YLO YHI
ENDMACRO

; store a value into the specified memory location and bank 
MACRO STORE rlo rhi bank value
    X bank
    X rhi
    X rlo
    OUT value
ENDMACRO

; load a 16-bit value from the specified memory location and bank 
; used temporary storage: TMP0, TMP1
MACRO LOAD16 rlo rhi bank valuelo valuehi
    X bank
    X rhi
    X rlo
    IN valuelo
    OP CRY
    SET TMP1
    X V255
    SET TMP0
    X bank
    X TMP1
    X TMP0
    IN valuehi
ENDMACRO 

; store a 16-bit value into the specified memory location and bank 
; used temporary storage: TMP0, TMP1
MACRO STORE16 rlo rhi bank valuelo valuehi
    X bank
    X rhi
    X rlo
    OUT valuelo
    OP CRY
    SET TMP1
    X V255
    SET TMP0
    X bank
    X TMP1
    X TMP0
    OUT valuehi
ENDMACRO 

; load a value from the specified memory location and bank 
MACRO LOAD rlo rhi bank value
    X bank
    X rhi
    X rlo
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
    X MFLAG
    BEV branchtarget
ENDMACRO

; perform a branch if the X flag is set to 16 bit mode
MACRO BRINDEX16 branchtarget
    X XFLAG
    BEV branchtarget
ENDMACRO

; decrement an 8-bit value and set ZFLAG and NFLAG accordingly
MACRO DEC8ANDSETNZ r
    X r
    X V255
    OP ADD
    SET r
    SET NFLAG
    SET ZFLAG
ENDMACRO

; increment an 8-bit value and set ZFLAG and NFLAG accordingly
MACRO INC8ANDSETNZ r
    X r
    X V1
    OP ADD
    SET r
    SET NFLAG
    SET ZFLAG
ENDMACRO

; join low and high byte of a 16-bit value to reflect the 
; zero-ness state of the value (basically doing an OR)
; temporary: TMP0, TMP1
MACRO COMPUTEZFLAG lo hi
    OP NAND
    X lo
    X V255
    SET TMP0
    X hi
    SET TMP1
    X TMP0
    X TMP1
    SET ZFLAG
ENDMACRO

; compute N and Z flags from a 16-bit value
; temporary: TMP0, TMP1
MACRO COMPUTENZFLAGS lo hi
    COMPUTEZFLAG lo hi
    GET hi
    SET NFLAG    
ENDMACRO

; perform 8-bit logic shift right and set N,Z,C flags
MACRO LSR8 r
    ; extract bit 0 to get carry flag
    X r
    X V1
    OP NAND
    SET CFLAG
    X CFLAG
    X CFLAG
    SET CFLAG
    ; divide by 2 to perform right shift
    X r
    X V0
    OP AVG  
    SET r    
    SET NFLAG
    SET ZFLAG
ENDMACRO

; perform 8-bit logic shift right with incomming carry and set N,Z,C flags
; temporary memory: TMP0
MACRO ROR8 r
    ; take previous carry flag and construct 128 or 0
    X CFLAG
    X V255
    OP AVG
    SET TMP0   ; 128 if carry was set, 127 otherwise
    X TMP0
    X V128
    OP NAND    
    SET TMP0   ; 127 if carry was set, 255 otherwise 
    X TMP0
    X TMP0
    SET TMP0   ; 128 if carry was set, 0 otherwise
    ; extract bit 0 to get new carry flag
    X V1
    X r
    OP NAND
    SET CFLAG
    X CFLAG
    X CFLAG
    SET CFLAG
    ; divide by 2 to perform right shift
    X r
    X V0
    OP AVG  
    SET r    
    ; insert the incomming carry flag
    X r
    X TMP0
    OP ADD
    SET r
    SET NFLAG
    SET ZFLAG
ENDMACRO

; add source to destination, using the provided carry input 
; and also set the output carry in CFLAG
; set NFLAG and ZFLAG according to the result
; uses storage: TMP0, TMP1
MACRO ADC8 destination source carryin
    X destination
    X source
    OP ADD
    SET destination
    OP OVF
    SET TMP0  ; first carry possibility
    X carryin
    X destination
    SET TMP1  ; second carry possibility
    OP ADD
    SET destination
    SET NFLAG
    SET ZFLAG
    X TMP1
    X TMP0
    SET CFLAG ; compose carry (only one input can be 1)
ENDMACRO

; combine two 8-bit value with AND. also update ZFLAG and NFLAG.
MACRO AND8 destination operand
    OP NAND
    X operand
    X destination
    SET destination
    X destination
    X destination
    SET destination
    SET NFLAG
    SET ZFLAG
ENDMACRO

