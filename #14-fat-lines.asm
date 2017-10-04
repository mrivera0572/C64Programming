; 10 SYS (49152)
*=$801
               BYTE $0E, $08, $0A, $00, $9E, $20, $28, $34, $39, $31, $35, $32, $29, $00, $00, $00
*=$c000
BAR1           = 55416
BAR2           = 55496
LIN1           = 1144
LIN2           = 1224
CLEAR          = $E544                       ; memory location of the clear screen function
               jsr            CLEAR
               ldx            #0
               ldy            #2
start          lda            #224
               sta            LIN1,x
               sta            LIN2,x
               tya
               STA            BAR1,x
               clc
               ADC            #5
               sta            BAR2,x
               inx
               cpx            #40
               bne            start
               rts
