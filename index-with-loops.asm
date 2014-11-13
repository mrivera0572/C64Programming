; 10 SYS (49152)

*=$801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

*=$C000
        JSR       $E544 ; clears the screen
        LDX       #0
        LDY       #1
START   TYA
        STA       55296,X
        TXA
        STA       1024,X
        INX
        CPX       #255
        BNE       START
        RTS
