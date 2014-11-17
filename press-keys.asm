; 10 SYS (49152)

*=$801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

*=$C000                            ; start address sys 49152
CLEAR     = $E544                  ; CLEAR SCREEN
SCNKEY    = $FF9F                  ; SCAN KEY
GETIN     = $FFE4                  ; READ CHAR
CHROUT    = $FFD2                  ; PRINT TO SCREE
          JSR            CLEAR
SCAN      JSR            SCNKEY
          JSR            GETIN     ; Put key value in accumulator
          BEQ            SCAN      ; Compare with zero. IF A KEY IS PRESSED THEN THE ZERO FLAG
                                   ; IS NON-ZERO AND EXIT THE LOOP
          JSR            CHROUT
          RTS
