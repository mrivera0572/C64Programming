*= $C000
; variable definition
CLEAR  = $E544                      ; clear screen
SCNKEY = $FF9F                       ; scan the keyboar
GETIN  = $FFE4                       ; read the input key
CHROUT = $FFD2                       ; output char
               jsr            CLEAR
SCAN           jsr            SCNKEY
               jsr            GETIN          
              ; beq            scan
               cmp            #$0D           ; compare with ascii for return
               beq            END            

               jsr            CHROUT
               jmp            SCAN
END            rts
