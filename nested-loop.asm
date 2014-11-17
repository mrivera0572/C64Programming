; 10 SYS (49152)

*=$801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

*=$c000
          jsr            $e544
          ldy            #0
LOOP1     ldx            #33
LOOP2     txa
          jsr            $e716
          inx
          cpx            #127
          bne            LOOP2
          INY
          CPY            #10
          bne            LOOP1
          rts
