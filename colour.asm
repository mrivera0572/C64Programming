*=$C000                             ; start address sys 49152
           jsr            $e544     ; clears the screen. Internal subroutine
loadcolor  lda            #97       ; load the acummulator with 97
           jsr            $e716     ; print the A accumulator to the screen. The character printed is the ASCII correposnde to 97
           lda            #5        ; load the accumulator
storecolor sta            646       ; store the accumulator in the cursor color memory area. The cursor will change color
           rts
