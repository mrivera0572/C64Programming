; 10 SYS (49152)
*=$801
          BYTE $0E, $08, $0A, $00, $9E, $20, $28, $34, $39, $31, $35, $32, $29, $00, $00, $00
*         = $C000
          ldx            #0
LOOP      inx
          LDA            #64
          STA            $C100
START     INC            $C100
          LDA            $C100
          JSR            $E716
          CMP            #90
          BNE            START     
          cpx            #255
          bne            LOOP
          RTS
