; Collection of macros. For best interoperability, these macros 
; specify the temporary variables they use.
; Additionally all macros (except the branch macros themselves) are required to cause
; no side-effects besides setting operation or operands when only the first instruction is executed. 
; This is to allow for preceeding branch instructions that have a delayed branch.

; perform a branch if the A/M flag is set to 16 bit mode
MACRO BRACCU16 branchtarget
    X MFLAG
    BRE branchtarget
ENDMACRO

; perform a branch if the X flag is set to 16 bit mode
MACRO BRINDEX16 branchtarget
    X XFLAG
    BRE branchtarget
ENDMACRO


; provide the source value on the ALU output for setting
MACRO GET source
    OP ADD
    X source
    X V0
ENDMACRO  

; quick way to provide various constants on the ALU output
MACRO GET0
    OP ZERO
ENDMACRO
MACRO GET1
    GET V1
ENDMACRO
MACRO GET128
    GET V128
ENDMACRO
MACRO GET255
    OP FF
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


; add a 8-bit value to a 16-bit value
; temporary variable: TMP0
MACRO ADD16_8 targetlo targethi source
    OP OVF
    X targetlo
    X source
    SET TMP0
    OP ADD
    SET targetlo
    X targethi
    X TMP0
    SET targethi
ENDMACRO

; add two 16-bit values (no carry out or carry in)
; temporary registers: TMP0
MACRO ADD16 targetlo targethi sourcelo sourcehi
    OP OVF
    X targetlo
    X sourcelo
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

; add a 16-bit value to a 24-bit value (no carry out or carry in)
; temporary registers: TMP0,TMP1
MACRO ADD24_16 targetlo targethi targetxhi sourcelo sourcehi
    ; combine lower 8 bits
    OP OVF
    X targetlo
    X sourcelo
    SET TMP1
    OP ADD
    SET targetlo
    ADD16_8 targethi targetxhi TMP1
    ADD16_8 targethi targetxhi sourcehi
ENDMACRO


; Increment a 16-bit value and store in new location.
; (target may also be source)
MACRO CPINC16 targetlo targethi sourcelo sourcehi
    OP CRY
    X sourcehi
    X sourcelo
    SET targethi
    X V255
    SET targetlo
ENDMACRO

; Increment a 24-bit value and store in new location
; (target may also be source)
; temporary storage: TMP0
MACRO CPINC24 targetlo targethi targetbank sourcelo sourcehi sourcebank
    X sourcelo
    X sourcehi
    OP TOP
    SET TMP0
    X sourcebank
    X TMP0
    OP ADD
    SET targetbank
    CPINC16 targetlo targethi sourcelo sourcehi
ENDMACRO

; Increment a 16-bit value.
MACRO INC16 rlo rhi
    CPINC16 rlo rhi rlo rhi
ENDMACRO

; Increment a 24-bit value.
; temporary storage : TMP0
MACRO INC24 rlo rhi rbank
    CPINC24 rlo rhi rbank rlo rhi rbank
ENDMACRO

; Decrement a 16-bit value.
; Intermediate registers: TMP0
MACRO DEC16 rlo rhi
    ADD16 rlo rhi V255 V255
ENDMACRO

; increment a register if another register is 0
; Intermediate store TMP0
MACRO INC_IF_ZERO target test
    X test
    X test
    OP NAND
    SET TMP0
    X target
    X TMP0
    OP CRY
    SET target
ENDMACRO

; decrement a register if another register is 255
; Intermediate store TMP0
MACRO DEC_IF_255 target test
    X V255
    X test
    OP CRY
    SET TMP0
    X TMP0
    X TMP0
    OP NAND
    SET TMP0
    X target
    X TMP0
    OP ADD
    SET target
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
    OP NAND
    X operand
    X operand
    SET operand
ENDMACRO


; fetch address consisting of two bytes and add the 3rd byte from DBR
MACRO FETCHADDRESS_a rlo rhi rbank
    FETCH rlo
    FETCH rhi
    GET DBR
    SET rbank
ENDMACRO

; fetch two bytes from program and combine with X to get 16-bit address (3rd is DBR)
; Intermediate storage: TMP0, TMP1
MACRO FETCHADDRESS_a_x rlo rhi rbank
    FETCH rlo
    FETCH rhi
    GET DBR
    SET rbank
    ADD24_16 rlo rhi rbank XLO XHI
ENDMACRO

; fetch two bytes from program and combine with Y to get 16-bit address (3rd is DBR)
; Intermediate storage: TMP0, TMP1
MACRO FETCHADDRESS_a_y rlo rhi rbank
    FETCH rlo
    FETCH rhi
    GET DBR
    SET rbank
    ADD24_16 rlo rhi rbank YLO YHI
ENDMACRO

; fetch address consisting of three bytes
MACRO FETCHADDRESS_al rlo rhi rbank
    FETCH rlo
    FETCH rhi
    FETCH rbank
ENDMACRO

; fetch three bytes from program and combine with X to get 24-bit address
; Intermediate storage: TMP0, TMP1
MACRO FETCHADDRESS_al_x rlo rhi rbank
    FETCH rlo
    FETCH rhi
    FETCH rbank
    ADD24_16 rlo rhi rbank XLO XHI
ENDMACRO

; fetch next byte from program and construct the 16-bit address with DHI/DLO (3rd byte is 0)
; Intermediate storage: -
MACRO FETCHADDRESS_d rlo rhi
    FETCH rlo
    X DLO
    X rlo
    OP OVF
    SET rhi
    OP ADD
    SET rlo
    X rhi
    X DHI
    SET rhi
ENDMACRO

; fetch next byte from program and construct the 16-bit address with SPHI/SPLO (3rd byte is 0)
; Intermediate storage: -
MACRO FETCHADDRESS_d_s rlo rhi
    FETCH rlo
    X SLO
    X rlo
    OP OVF
    SET rhi
    OP ADD
    SET rlo
    X rhi
    X SHI
    SET rhi
ENDMACRO

; fetch next byte from program and construct the 16-bit address with DHI/DLO + XHI/XLO (3rd byte is 0)
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_d_x rlo rhi
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
    ADD16 rlo rhi XLO XHI
ENDMACRO

; fetch next byte from program and construct the 16-bit address with DHI/DLO + YHI/YLO (3rd byte is 0)
; Intermediate storage: TMP0 
MACRO FETCHADDRESS_d_y rlo rhi
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
    ADD16 rlo rhi YLO YHI
ENDMACRO

; Fetch next byte from program and construct the 16-bit address with DHI/DLO 
; from this location (in bank 0) the 16-bit address is fetched. 
; High byte of the effective address is set from DBR
; Intermediate storage: TMP0,TMP1
MACRO FETCHADDRESS_(d) rlo rhi rbank
    FETCHADDRESS_d TMP0 TMP1
    LOAD TMP0 TMP1 V0 rlo
    INC16 TMP0 TMP1
    LOAD TMP0 TMP1 V0 rhi
    GET DBR
    SET rbank
ENDMACRO

; fetch address indirect long. For this, combine the
; next program byte with the DLO,DHI to get the address of the long pointer
; This pointer is fetched
; Intermediate storage: TMP0, TMP1
MACRO FETCHADDRESS_[d] rlo rhi rbank
    FETCHADDRESS_d TMP0 TMP1
    LOAD TMP0 TMP1 V0 rlo
    INC16 TMP0 TMP1
    LOAD TMP0 TMP1 V0 rhi
    INC16 TMP0 TMP1
    LOAD TMP0 TMP1 V0 rbank
ENDMACRO

; combine second byte of instruction with the stack pointer and fetch
; a 16-bit pointer from there. use the DBR as 3rd byte. 
; then add the Y to this to get the effective address
; Intermediate storage: TMP0, TMP1
MACRO FETCHADDRESS_(d_s)_y rlo rhi rbank
    FETCHADDRESS_d_s TMP0 TMP1
    LOAD TMP0 TMP1 V0 rlo
    INC16 TMP0 TMP1
    LOAD TMP0 TMP1 V0 rhi
    GET DBR
    SET rbank
    ADD24_16 rlo rhi rbank YLO YHI
ENDMACRO

; combine second byte of instruction with the direct register and the X register
; take the 16-bit target address from there. Highest byte of the effective address is
; always DBR 
; temporary storage: TMP0 TMP1
MACRO FETCHADDRESS_(d_x) rlo rhi rbank
    FETCHADDRESS_d_x TMP1 rhi  ; use as temporary storage
    LOAD TMP1 rhi V0 rlo
    INC16 TMP1 rhi
    LOAD TMP1 rhi V0 rhi
    GET DBR
    SET rbank
ENDMACRO

; fetch address indirect long. For this, combine the
; next program byte with the DLO,DHI to get the address of the 16-bit pointer
; Then this pointer if fetched and exteded with DBR. Then Y is added to give the effective address.
; Intermediate storage: TMP0, TMP1
MACRO FETCHADDRESS_(d)_y rlo rhi rbank
    FETCHADDRESS_d TMP1 rbank  ; use target register as temporary storage
    LOAD TMP1 rbank V0 rlo
    INC16 TMP1 rbank
    LOAD TMP1 rbank V0 rhi
    GET DBR
    SET rbank
    ADD24_16 rlo rhi rbank YLO YHI
ENDMACRO

; fetch address indirect long. For this, combine the
; next program byte with the DLO,DHI to get the address of the long pointer
; Then this pointer if fetched and Y is added to give the effective address.
; Intermediate storage: TMP0, TMP1
MACRO FETCHADDRESS_[d]_y rlo rhi rbank
    FETCHADDRESS_d TMP1 rbank  ; use target register as temporary storage
    LOAD TMP1 rbank V0 rlo
    INC16 TMP1 rbank
    LOAD TMP1 rbank V0 rhi
    INC16 TMP1 rbank
    LOAD TMP1 rbank V0 rbank
    ADD24_16 rlo rhi rbank YLO YHI
ENDMACRO

; store a value into the specified memory location and bank 
MACRO STORE rlo rhi bank value
    X bank
    X rhi
    X rlo
    OUT value
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


; decrement an 8-bit value and set ZFLAG and NFLAG accordingly
MACRO DEC8ANDSETNZ r
    OP ADD
    X r
    X V255
    SET r
    SET NFLAG
    SET ZFLAG
ENDMACRO

; increment an 8-bit value and set ZFLAG and NFLAG accordingly
MACRO INC8ANDSETNZ r
    OP ADD
    X r
    X V1
    SET r
    SET NFLAG
    SET ZFLAG
ENDMACRO

; compute N and Z flags from a 16-bit value.
; do not store N yet, but prepare for subsequent SET
; temporary: TMP0, TMP1
MACRO NZ16_PREPARE_N lo hi
    OP NAND
    X lo
    X V255
    SET TMP0  ; inverted lo
    X hi
    SET TMP1  ; inverted hi
    X TMP0
    X TMP1
    SET ZFLAG
    X V255
ENDMACRO 

; compute N and Z flags from a 16-bit value.
; temporary: TMP0, TMP1
MACRO NZ16 lo hi
    NZ16_PREPARE_N lo hi
    SET NFLAG
ENDMACRO

; compute N and Z flags from an 8-bit value
; do not store N yet, but prepare for subsequent SET
MACRO NZ8_PREPARE_N r
    GET r
    SET ZFLAG
ENDMACRO

; compute N and Z flags from an 8-bit value
MACRO NZ8 r
    NZ8_PREPARE_N r
    SET NFLAG
ENDMACRO

; combine two 8-bit values with AND and set the Z flag accordingly
; nothing but the Z is modified
MACRO TEST8 a b
    OP NAND
    X a
    X b
    SET ZFLAG
    X ZFLAG
    X ZFLAG
    SET ZFLAG
ENDMACRO

; combine two 16-bit values with AND and set the Z flag accordingly
; nothing but the Z is modified
; temporary TMP0
MACRO TEST16 alo ahi blo bhi
    OP NAND
    X alo
    X blo
    SET TMP0
    X ahi
    X bhi
    SET ZFLAG
    X TMP0
    X ZFLAG
    SET ZFLAG
    X ZFLAG
    X ZFLAG
    SET ZFLAG
ENDMACRO


; Perform left shift. Outgoing bit goes to CFLAG
MACRO LSL8 r
    OP ADD
    X r
    X r
    SET r
    OP OVF
    SET CFLAG
ENDMACRO

; Perform left shift. Incomming bit from CFLAG, outgoing bit goes to CFLAG
; temporary: TMP0
MACRO ROL8 r
    OP ADD
    X CFLAG
    X V0
    SET TMP0
    X r
    X r
    OP ADD
    SET r
    OP OVF
    SET CFLAG
    X r
    X TMP0
    OP ADD
    SET r
ENDMACRO


; perform 8-bit logic shift right. outgoing bit goes to CFLAG
MACRO LSR8 r
    OP NAND
    X r
    X V1
    SET CFLAG
    X CFLAG
    X CFLAG
    SET CFLAG
    X V0
    X r
    OP AVG
    SET r
ENDMACRO

; perform 8-bit logic shift right with incomming CFLAG and outgoing CFLAG
; temporary memory: TMP0
MACRO ROR8 r
    ; expand CFLAG to 8 bits 
    X CFLAG
    X V255
    OP ADD
    SET TMP0
    X TMP0
    X TMP0
    OP NAND
    SET TMP0   ; 255 if CFLAG was 1, else 0
    ; outgoing CFLAG
    OP NAND
    X r
    X V1
    SET CFLAG
    X CFLAG
    X CFLAG
    SET CFLAG
    ; do the rotation
    X r
    X TMP0
    OP ROR
    SET r
ENDMACRO

; add source to destination, using the provided carry input 
; and also set the output carry in CFLAG
; uses storage: TMP0, TMP1
MACRO ADC8 destination source carryin
    OP ADD
    X destination
    X source
    SET destination
    OP OVF
    SET TMP0  ; first carry possibility
    X carryin
    X destination
    SET TMP1  ; second carry possibility
    OP ADD
    SET destination
    X TMP1
    X TMP0
    SET CFLAG ; compose carry (only one input can be 1)
ENDMACRO

; perform a 8-bit AND combining destination and source
MACRO AND8 destination source
    OP NAND
    X destination
    X source
    SET destination
    X destination
    X destination
    SET destination
ENDMACRO

; perform a 8-bit OR combining destination and source
; temporary: TMP0
MACRO OR8 destination source
    OP NAND
    X destination
    X destination
    SET destination
    X source
    X source
    SET TMP0
    X destination
    X TMP0
    SET destination
ENDMACRO

; perform a 8-bit X-OR combining destination and source
; temporary: TMP0,TMP1
MACRO EOR8 destination source
    OP NAND
    X destination
    X destination
    SET TMP0
    X TMP0
    X source
    SET TMP0
    X source
    X source
    SET TMP1
    X TMP1
    X destination
    SET TMP1
    X TMP0
    X TMP1
    SET destination
ENDMACRO

; perform a 8-bit AND combining destination and inverted source
; (without changing source itself)
; temporary TMP0
MACRO ANDINV8 destination source
    OP NAND
    X source
    X source
    SET TMP0
    X destination
    X TMP0
    SET TMP0
    X TMP0
    X TMP0
    SET destination
ENDMACRO
