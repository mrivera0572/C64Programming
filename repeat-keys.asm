*=$C000                             ; start address sys 49152
          jsr            $e544     ; clears the screen. Internal subroutine
          lda            #$80     
          sta            $028A      
          rts
