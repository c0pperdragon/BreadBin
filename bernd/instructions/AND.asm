
; combine two 8-bit value with AND. also update ZFLAG and NFLAG.
MACRO AND8 destination operand
    A destination
    B operand
    OP AND
    SET destination
    SET NFLAG
    SET ZFLAG
ENDMACRO

; ---- AND #
    ORG $2900
    FETCH TMP4
    AND8 ALO TMP4
    BRACCU16 AND_#_16bit
    NEXT
AND_#_16bit:    
    FETCH TMP4
    AND8 AHI TMP4
    COMPUTEZFLAG ALO AHI
    NEXT
    
; ---- AND d
    ORG $2500
    FETCHADDRESS_d
    LOAD V0 TMP4
    AND8 ALO TMP4
    BRACCU16 AND_d_16bit
    NEXT
AND_d_16bit:
    INCREMENTADDRESS
    LOAD V0 TMP4
    ADC8 AHI TMP4
    COMPUTEZFLAG ALO AHI
    NEXT

; ---- AND al
    ORG $2F00
    FETCH ADDRLO
    FETCH ADDRHI
    FETCH TMP3
    LOAD TMP3 TMP4
    AND8 ALO TMP4
    BRACCU16 AND_al_16bit
    NEXT
AND_al_16bit:
    INCREMENTADDRESS
    LOAD TMP3 TMP4
    ADC8 AHI TMP4
    COMPUTEZFLAG ALO AHI
    NEXT    
