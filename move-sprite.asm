
* = $C000 

;helpful labels 

CLEAR           = $E544 
GETIN           = $FFE4 
SCNKEY          = $FF9F 
ENTER           = $C202 
MOVE            = $C203 

;sprite 0 setup 

SPRITE0         = $07F8 
COLOR0          = $D027 
SP0X            = $D000 
SP0Y            = $D001 
MSBX            = $D010 
SP0VAL          = $0340 
ENABLE          = $D015 
YEXPAND         = $D017 
XEXPAND         = $D01D 

;*=$1000 

                JSR CLEAR 
                LDA #13 
                STA ENTER 
                LDA #$0D  ;using block 13 for sprite0 
                STA SPRITE0 
                LDA #01   ;enable sprite0 
                STA ENABLE 
                LDA #02   ;use red for sprite0 
                STA COLOR0 
                LDX #0 
                LDA #0 
;reset the spriteval data 
CLEANUP          STA SP0VAL,X 
                INX 
                CPX #63 
                BNE CLEANUP 
;build the sprite 
                LDX #0 
BUILD           LDA DATA,X 
                STA SP0VAL,X 
                INX 
                CPX #63 
                BNE BUILD 
;position 
                LDA #0    ;stick with x0-255 
                STA MSBX 
;starting sprite location 
                LDX #100 
                LDY #70 
                STX SP0X 
                STY SP0Y 
SCAN            JSR SCNKEY;get key 
                JSR GETIN ;put key in A 
START           CMP #87   ;W - up 
                BEQ UP 
                CMP #83   ;S - down 
                BEQ DOWN 
                CMP #65   ;A - left 
                BEQ LEFT 
                CMP #68   ;D - right 
                BEQ RIGHT 
                CMP ENTER ;end if enter clicked 
                BEQ END 
                JMP SCAN 
UP              LDY SP0Y 
                DEY 
                STY SP0Y 
                JMP SCAN 
DOWN            LDY SP0Y 
                INY 
                STY SP0Y 
                JMP SCAN 
LEFT            LDX SP0X 
                DEX 
                STX SP0X 
                CPX #255 
                BNE SCAN 
                LDA #0 
                STA MSBX 
                JMP SCAN 
RIGHT           LDX SP0X 
                INX 
                STX SP0X 
                CPX #255 
                BNE SCAN 
                LDA #1 
                STA MSBX 
                JMP SCAN 
;clean up at the end 
END             JSR CLEAR 
                LDA #0 
                STA ENABLE 
                RTS 
;define the sprite 
 


; 

DATA

; 
 BYTE 0,0,0
 BYTE 0,0,0
 BYTE 0,0,0
 BYTE 0,0,0
 BYTE 0,0,0
 BYTE 0,60,0
 BYTE 0,36,0
 BYTE 0,60,0
 BYTE 31,255,248
 BYTE 31,255,248
 BYTE 0,255,0
 BYTE 0,255,0
 BYTE 0,255,0
 BYTE 0,255,0
 BYTE 0,255,0
 BYTE 0,255,0
 BYTE 0,195,0
 BYTE 0,195,0
 BYTE 0,195,0
 BYTE 0,195,0
 BYTE 1,195,128





