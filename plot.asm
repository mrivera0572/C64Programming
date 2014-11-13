*=$C000
          jsr            $e544
          ldx            #12
          ldy            #70
          clc
          jsr            $fff0
          lda            #88
          jsr            $e716
          rts
