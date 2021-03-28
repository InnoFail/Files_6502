DEFINE OUTPUTA $0000
DEFINE OUTPUTB $0001
DEFINE A_H $0002
DEFINE A_L $0003
DEFINE B_H $0004
DEFINE B_L $0005
DEFINE C_H $0006
DEFINE C_L $0007
DEFINE D_H $0008
DEFINE D_L $0009
DEFINE E_H $000A
DEFINE E_L $000B
DEFINE F_H $000C
DEFINE F_L $000D
DEFINE OUTPUTC $000E
DEFINE OUTPUTD $000F

DEFINE USERA_H $0010
DEFINE USERA_L $0011
DEFINE USERB_H $0012
DEFINE USERB_L $0013
DEFINE USERC_H $0014
DEFINE USERC_L $0015
DEFINE USERD_H $0016
DEFINE USERD_L $0017
DEFINE USERE_H $0018
DEFINE USERE_L $0019
DEFINE USERF_H $001A
DEFINE USERF_L $001B
DEFINE USERG_H $001C
DEFINE USERG_L $001D
DEFINE USERH_H $001E
DEFINE USERH_L $001F

DEFINE INPUT $00FF


LDA #$00
STA A_H
LDA #$01
STA A_L
LDA #$00
STA B_H
LDA #$06
STA B_L
LDA #$00
STA C_H
LDA #$01
STA C_L
JSR TOLOOP
BRK



TOLOOP:
JSR FORLOOPL 
LDA #$00
CMP $00
BEQ EXITLOOP
LDX E_H
INX
PHA
LDA #$01
STA $0200,X
PLA
STX E_H
JMP TOLOOP
EXITLOOP:
RTS
RETURN:
BRK


;FROM $0000 TO $OOOF ARE ALL SYSTEM
; VARIABLE AND NAMED AFTER
;1) ADD  TAKES TWO 2-BYTE NUMBER IN 
;A_H ,A_L AND B_H B_L IN HUMAN 
; READING ORDER THEN PERFORMS 
; REQUIRED STUFFS SND RETURNS OUTPUT
;IN OUTPUTA OUTPUTB
;2) SUBTRACT IS THE SAME AS ADD
;3) COMPARE TAKES TWO 2-BYTE  
; VARIABLES
;IN A_H A_L AND B_H B_L AND STORES
;#$00 IF EQUAL #$01 IF LESSER #$02 IF
;GREATER ,IN OUTPUTA AND OUTPUTB 
; RESPECTIVELY FOR BOTH HIGH AND LOW
;BYTE 
;4) BOOLGREATER TAKES TWO 2-BYTE
;VARIABLES IN A_H A_L AND B_H B_L THEN
;EXECUTES COMPARE  AND THEN IF FIRST 
;NUMBER IS GREATER THAN THE SECOND
;THEN IT RETURNS $01 $01 IN OUTPUTA 
;AND OUTPUTB ELSE RETURNS $0 $0 IN 
;BOTH OUTPUTA AND OUTPUTB
;5) BOOLLESSER AND BOOLEQUAL WORKS 
;AS BOOLGREATER EXCEPT THEY CHECK
;FOR RESPECTIVE RESULTS
;6) AFTER WE USE BOOLGREATER ,
;BOOLLESSER OR BOOLEQUAL THE RESULT
;CAN BE USED WITH ANDG,ANDL,ANDE,ORG,
;ORL,ORE TO COMPARE MORE RESULTS 
;WITH OUTPUT OF BOOL FUNCTIONS
;7) G-GREATER ,L-LESSER,E-EQUAL
;ANDG TAKES TWO 2-BYTE VARIABLES
;IN A_H A_L AND B_H B_L
;AND THE RESULTS OF BOOL FUNCTIONS
;FROM OUTPUTA AND OUTPUTB
;AND RETURNS $01 IN BOTH OUTPUTA
;AND OUTPUTB IF BOTH BOOL AND 
; CURRENTLY PASSED CONDITIONS ARE
;TRUE ELSE FALSE IN BOTH OUTPUTA 
;AND OUTPUTB
;8)PIXEL TAKES (X,Y) IN A_H A_L AND COL-
;OR IN C_L AND THEN PRINTS PIXEL IN GIV-
;EN POSITION [NOTE MAXX=$1F MAXY=$1F]
;9)FORLOOPG FORLOOPL FORLOOPE EXPE-
;CTS TWO 2-BYTE IN A_H A_L B_H B_L AND 
; INCREMENT IN C_H C_L ,WHILE, 
; WHLE EXPECTS ONLY BOOL IN OUTPUTA
;OUTPUTB AND ALL FOUR CALLS TOLOOP
;AND EXITLOOP SUBROUTINES WHERE
;BODY RESIDES



ADD:
PHA
CLC
LDA A_L
ADC B_L
STA OUTPUTB
LDA A_H
ADC B_H
STA OUTPUTA
PLA
RTS

SBT:
PHA
CLC
LDA A_L
SBC B_L
STA OUTPUTB
LDA A_H
SBC B_H
STA OUTPUTA
PLA
RTS

COMPARE:
LDA #$00
LDX #$00
LDY #$00
LDA A_L
CMP B_L
BCC LESSERL
BCS GREATERL
HIGHCOMP:
LDA A_H
CMP B_H
BCC LESSERH
BCS GREATERH
LESSERL:
LDA #$01
STA OUTPUTB
JMP HIGHCOMP
GREATERL:
BEQ EQUALL
LDA #$02
STA OUTPUTB
JMP HIGHCOMP
EQUALL:
LDA #$00
STA OUTPUTB
JMP HIGHCOMP
LESSERH:
LDA #$01
STA OUTPUTA
RTS
GREATERH:
BEQ EQUALH
LDA #$02
STA OUTPUTA
RTS
EQUALH:
LDA #$00
STA OUTPUTA
RTS

BOOLGREATER:
JSR COMPARE 
LDA OUTPUTA
CMP #$02
BEQ YESGRA
LDA #$00
STA OUTPUTA
LDA OUTPUTB
CMP #$02
BEQ YESGRB
LDA #$00
STA OUTPUTB
RTS
YESGRA:
LDA #$01
STA OUTPUTA
LDA #$01
STA OUTPUTB
RTS
YESGRB:
LDA #$01
STA OUTPUTB
LDA #$01
STA OUTPUTA
RTS


BOOLLESSER:
JSR COMPARE 
LDA OUTPUTA
CMP #$01
BEQ YESLEA
CMP #$02
BEQ GREATLESS
LDA #$00
STA OUTPUTA
LDA OUTPUTB
CMP #$01
BEQ YESLEB
CMP #$02
BEQ GREATLESS
LDA #$00
STA OUTPUTB
RTS
YESLEA:
LDA #$01
STA OUTPUTA
LDA #$01
STA OUTPUTB
RTS
YESLEB:
LDA #$01
STA OUTPUTB
LDA #$01
STA OUTPUTA
RTS
GREATLESS:
LDA #$00
STA OUTPUTA
STA OUTPUTB
RTS


BOOLEQUAL:
JSR COMPARE 
LDA OUTPUTA
CMP #$00
BEQ YESEQA
LDA #$00
STA OUTPUTA
LOWEQ:
LDA OUTPUTB
CMP #$00
BEQ YESEQB
LDA #$00
STA OUTPUTB
JMP OUTPUTEQ
YESEQA:
LDA #$01
STA OUTPUTA
JMP LOWEQ
RTS
YESEQB:
LDA #$01
STA OUTPUTB
OUTPUTEQ:
LDA OUTPUTA
AND OUTPUTB
CMP #$01
BEQ YESFINEQ
LDA #$00
STA OUTPUTA
STA OUTPUTB
RTS
YESFINEQ:
LDA #$01
STA OUTPUTA
STA OUTPUTB
RTS


ANDG:
LDA OUTPUTA
STA C_H
LDA OUTPUTB
STA C_L
JSR BOOLGREATER 
LDA OUTPUTA
AND C_H
STA A_H
LDA OUTPUTB
AND C_L
STA A_L
LDA #$01
STA B_H
STA B_L
JSR BOOLEQUAL
RTS


ANDL:
LDA OUTPUTA
STA C_H
LDA OUTPUTB
STA C_L
JSR BOOLLESSER
LDA OUTPUTA
AND C_H
STA A_H
LDA OUTPUTB
AND C_L
STA A_L
LDA #$01
STA B_H
STA B_L
JSR BOOLEQUAL
RTS


ANDE:
LDA OUTPUTA
STA C_H
LDA OUTPUTB
STA C_L
JSR BOOLEQUAL
LDA OUTPUTA
AND C_H
STA A_H
LDA OUTPUTB
AND C_L
STA A_L
LDA #$01
STA B_H
STA B_L
JSR BOOLEQUAL
RTS


ORG:
LDA OUTPUTA
STA C_H
LDA OUTPUTB
STA C_L
JSR BOOLGREATER 
LDA OUTPUTA
ORA C_H
STA A_H
LDA OUTPUTB
ORA C_L
STA A_L
LDA #$01
STA B_H
STA B_L
JSR BOOLEQUAL
RTS


ORL:
LDA OUTPUTA
STA C_H
LDA OUTPUTB
STA C_L
JSR BOOLLESSER
LDA OUTPUTA
ORA C_H
STA A_H
LDA OUTPUTB
ORA C_L
STA A_L
LDA #$01
STA B_H
STA B_L
JSR BOOLEQUAL
RTS

ORE:
LDA OUTPUTA
STA C_H
LDA OUTPUTB
STA C_L
JSR BOOLEQUAL
LDA OUTPUTA
ORA C_H
STA A_H
LDA OUTPUTB
ORA C_L
STA A_L
LDA #$01
STA B_H
STA B_L
JSR BOOLEQUAL
RTS


PIXEL:
LDX #$01
LDY A_L
LDA #$00
STA B_H
STA B_L
LDA A_H
STA B_L
LDA #$20
STA A_L
LDA #$00
STA A_H
LOOPPIXEL:
TYA
STX C_H
CMP C_H
BEQ ENDLOOPPIXEL
JSR ADD
LDA OUTPUTA
STA B_H
LDA OUTPUTB
STA B_L
INX
JMP LOOPPIXEL 
ENDLOOPPIXEL:
LDA #$02
STA A_H
LDA #$00
STA A_L
JSR ADD
LDX OUTPUTA
LDY OUTPUTB
STX A_L
STY A_H
LDX #$00
LDA C_L
STA (A_H,X)
RTS


WHILE:
LDA $00
CMP $01
BEQ EXITLOOP
JSR TOLOOP
JMP WHILE


FORLOOPL: 
LDA B_H
STA D_H
LDA B_L
STA D_L
LDA C_H
STA B_H
LDA C_L
STA B_L
JSR ADD
LDA OUTPUTA
STA A_H
LDA OUTPUTB
STA A_L
LDA B_H
STA C_H
LDA B_L
STA C_L
LDA D_H
STA B_H
LDA D_L
STA B_L
JSR BOOLLESSER
RTS

SAVEALL:
PHA
TXA
PHA
TYA
PHA
LDA OUTPUTA
PHA
LDA OUTPUTB
PHA
LDA A_H
PHA
LDA A_L
PHA
LDA B_H
PHA
LDA B_L
PHA
LDA C_H
PHA
LDA C_L
PHA
LDA D_H
PHA
LDA D_L
PHA
LDA E_H
PHA
LDA E_L
PHA
LDA F_H
PHA
LDA F_L
PHA
LDA OUTPUTC
PHA
LDA OUTPUTD
PHA
RTS

RETRIVEALL:
PLA
STA OUTPUTD
PLA
STA OUTPUTC
PLA
STA F_L
PLA
STA F_H
PLA
STA E_L
PLA
STA E_H
PLA
STA D_L
PLA
STA D_H
PLA
STA C_L
PLA
STA C_H
PLA
STA B_L
PLA
STA B_H
PLA
STA A_L
PLA
STA A_H
PLA
STA OUTPUTB
PLA
STA OUTPUTA
PLA
TAY
PLA
TAX
PLA
RTS














