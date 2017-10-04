; 10 SYS (49152)
*=$801
                    BYTE $0E, $08, $0A, $00, $9E, $20, $28, $34, $39, $31, $35, $32, $29, $00, $00, $00
*= $C000
; variable definition
CLEAR               = $E544                       ; clear screen
SCNKEY              = $FF9F                       ; scan the keyboar
GETIN               = $FFE4                       ; read the input key
CHROUT              = $FFD2                       ; output char
BKGND               = $D021
                    jsr            CLEAR
                    ldx            #0
loop                lda            message,x
                    inx
                    jsr            CHROUT
                    cpx            #6
                    bne            loop
readkeys            jsr            SCNKEY
                    jsr            GETIN
return              cmp            #$0D           ; compare for return
                    beq            end
                    cmp            #82
                    beq            red
                    cmp            #71
                    beq            green
                    jmp            readkeys
red                 lda            #2
                    sta            BKGND
                    jmp            readkeys
green               lda            #5
                    sta            BKGND
                    jmp            readkeys
end                 rts
message        text           "COLOR?"
