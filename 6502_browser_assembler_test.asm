JMP MAIN

;DATA STARTING FROM $0603
LETTER_ALPHABET:

;A
DCB $00,$0A,$0B,$0C
DCB $00,$0E,$10
DCB $00,$12,$13,$14
DCB $00,$16,$18,$00

DCB $00,$05,$06,$07,$08,$09
DCB $00,$09,$0A,$0C,$0D
DCB $00,$0D,$0E,$0F,$10
DCB $00,$11,$12,$14,$15
DCB $00,$15,$16,$17,$18,$19,$00

DCB $00,$05,$06,$07,$08,$09
DCB $00,$09,$0A,$0C,$0D
DCB $00,$0D,$0E
DCB $00,$11,$12,$14,$15
DCB $00,$15,$16,$17,$18,$19,$00

DCB $00,$05,$06,$07,$08,$09,$00
DCB $0A,$0C,$0D,$00,$0E,$10,$11,$00,$12
DCB $14,$15,$00,$15,$16,$17,$18,$19,$00


;D
DCB $00,$05,$06,$07,$08
DCB $00,$09,$0A
DCB $00,$0D,$0E,$0F,$10
DCB $00,$11,$12
DCB $00,$15,$16,$17,$18,$00
 
DCB $00,$05,$06,$07,$08
DCB $00,$09,$0A
DCB $00,$0D,$0E,$0F,$10
DCB $00,$11,$12
DCB $00,$15,$16,$00

DCB $00,$05,$06,$07,$08
DCB $00,$09
DCB $00,$0D,$0F,$10
DCB $00,$11,$14
DCB $00,$15,$16,$17,$18,$00 

;G
DCB $00,$05,$06,$08,$09
DCB $00,$09,$0A,$0C,$0D
DCB $00,$0D,$0E,$0F,$10,$11
DCB $00,$11,$12,$14,$15
DCB $00,$15,$16,$18,$19,$00 

DCB $00,$06,$07,$08
DCB $00,$0B
DCB $00,$0F
DCB $00,$13
DCB $00,$16,$17,$18,$00

DCB $00,$06,$07,$08,$09
DCB $00,$0C
DCB $00,$10
DCB $00,$11,$14
DCB $00,$15,$16,$17,$18,$00

;K
DCB $00,$06,$09
DCB $00,$0A,$0C
DCB $00,$0E,$0F
DCB $00,$12,$14
DCB $00,$16,$19,$00 

DCB $00,$05,$06
DCB $00,$09,$0A
DCB $00,$0D,$0E
DCB $00,$11,$12
DCB $00,$15,$16,$17,$18,$19,$00

DCB $00,$05,$06,$08,$09
DCB $00,$09,$0A,$0B,$0C,$0D
DCB $00,$0D,$0F,$11
DCB $00,$11,$15
DCB $00,$15,$19,$00

;N
DCB $00,$09
DCB $00,$09,$0A,$0D
DCB $00,$0D,$0F,$11
DCB $00,$11,$14,$15
DCB $00,$15,$19,$00

DCB $00,$06,$07,$08
DCB $00,$09,$0D
DCB $00,$0D,$11
DCB $00,$11,$15
DCB $00,$16,$17,$18,$00

DCB $00,$05,$06,$07,$08,$09
DCB $00,$09,$0A,$0C,$0D
DCB $00,$0D,$0E,$0F,$10,$11
DCB $00,$11,$12
DCB $00,$15,$16,$00

;Q
DCB $00,$06,$07,$08
DCB $00,$09,$0D
DCB $00,$0D,$0F,$11
DCB $00,$11,$14,$15
DCB $00,$16,$17,$18,$19,$00

DCB $00,$06,$07,$08
DCB $00,$0A,$0C
DCB $00,$0E,$0F
DCB $00,$12,$14
DCB $00,$16,$19,$00

DCB $00,$06,$07,$08,$09
DCB $00,$0A
DCB $00,$0E,$0F,$10,$11
DCB $00,$15
DCB $00,$16,$17,$18,$19,$00


;T
DCB $00,$05,$06,$07,$08,$09
DCB $00,$0B
DCB $00,$0F
DCB $00,$13
DCB $00,$17,$00

DCB $00,$05,$09
DCB $00,$09,$0D
DCB $00,$0D,$11
DCB $00,$11,$15
DCB $00,$16,$17,$18,$00

DCB $00,$05,$09
DCB $00,$09,$0D
DCB $00,$0D,$11
DCB $00,$12,$14
DCB $00,$17,$00

;W
DCB $00,$05,$09
DCB $00,$09,$0D
DCB $00,$0D,$0F,$11
DCB $00,$12,$14
DCB $00,$15,$19,$00

DCB $00,$05,$09
DCB $00,$0A,$0C
DCB $00,$0F
DCB $00,$12,$14
DCB $00,$15,$19,$00

;Y
DCB $00,$05,$09
DCB $00,$0A,$0C
DCB $00,$0F
DCB $00,$13
DCB $00,$17,$00

DCB $00,$05,$06,$07,$08
DCB $00,$0C
DCB $00,$0F
DCB $00,$12
DCB $00,$15,$16,$17,$18,$00



;DEFINE USERA_H $0010
;DEFINE USERA_L $0011
;DEFINE USERB_H $0012
;DEFINE USERB_L $0013
;DEFINE USERC_H $0014
;DEFINE USERC_L $0015
;DEFINE USERD_H $0016
;DEFINE USERD_L $0017
;DEFINE USERE_H $0018
;DEFINE USERE_L $0019
;DEFINE USERF_H $001A
;DEFINE USERF_L $001B
;DEFINE USERG_H $001C
;DEFINE USERG_L $001D
;DEFINE USERH_H $001E
;DEFINE USERH_L $001F
;DEFINE USERI_H $0020
;DEFINE USERI_L $0021
;DEFINE USERJ_H $0022
;DEFINE USERJ_L $0023
;DEFINE USERK_H $0024
;DEFINE USERK_L $0025
;DEFINE USERL_H $0026
;DEFINE USERL_L $0027
;DEFINE USERM_H $0028
;DEFINE USERM_L $0029
;DEFINE USERN_H $002A
;DEFINE USERN_L $002B
;DEFINE USERO_H $002C
;DEFINE USERO_L $002D
;DEFINE USERP_H $002E
;DEFINE USERP_L $002F

;MAIN PROGRAM
MAIN:

LDA #$1B
STA $000A
LDA #$1B
STA $000B
LDA #$04
STA $000D
LDA #$05
STA $0008
STA $0009
LDA #$01
STA $000C
JSR WHEREISLETTER 
JSR SPRITE_PRINT 
LDA #$10
STA $000A
LDA #$1B
STA $000B
LDA #$03
STA $000D
LDA #$02
STA $000C
JSR WHEREISLETTER 
JSR SPRITE_PRINT 
BRK

; INFORMATION ABOUT FUNCTIONS

;FROM $0000 TO $OOOF ARE ALL SYSTEM
; VARIABLE AND NAMED AFTER
;1) ADD  TAKES TWO 2-BYTE NUMBER IN 
;$0002 ,$0003 AND $0004 $0005 IN HUMAN 
; READING ORDER THEN PERFORMS 
; REQUIRED STUFFS SND RETURNS OUTPUT
;IN $0000 $0001
;2) SUBTRACT IS THE SAME AS ADD
;3) COMPARE TAKES TWO 2-BYTE  
; VARIABLES
;IN $0002 $0003 AND $0004 $0005 AND STORES
;#$00 IF EQUAL #$01 IF LESSER #$02 IF
;GREATER ,IN $0000 AND $0001 
; RESPECTIVELY FOR BOTH HIGH AND LOW
;BYTE 
;4) BOOLGREATER TAKES TWO 2-BYTE
;VARIABLES IN $0002 $0003 AND $0004 $0005 THEN
;EXECUTES COMPARE  AND THEN IF FIRST 
;NUMBER IS GREATER THAN THE SECOND
;THEN IT RETURNS $01 $01 IN $0000 
;AND $0001 ELSE RETURNS $0 $0 IN 
;BOTH $0000 AND $0001
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
;IN $0002 $0003 AND $0004 $0005
;AND THE RESULTS OF BOOL FUNCTIONS
;FROM $0000 AND $0001
;AND RETURNS $01 IN BOTH $0000
;AND $0001 IF BOTH BOOL AND 
; CURRENTLY PASSED CONDITIONS ARE
;TRUE ELSE FALSE IN BOTH $0000 
;AND $0001
;8)PIXEL TAKES (X,Y) IN $0002 $0003 AND COL-
;OR IN $0007 AND THEN PRINTS PIXEL IN GIV-
;EN POSITION [NOTE MAXX=$1F MAXY=$1F]
;PIXEL STARTS FROM (1,1)
;9) FORCOMPAREL, FORLOOPG AND 
; FORLOOPE ARE LOOP FUNCTIONS THAT
;EXPECTS TWO 2-BYTE NUMBERS IN $0002 
;$0003 $0004 $0005  TO BE COMPARED EITHER
;LESSER , GREATER OR EQUAL AND RETUR-
;NS $00 IN $0000 AND $0001 IF
;COMPARISION IS FALSE ELSE $01
; AND FORINC FUNCTIONS EXPECTS A
;TWO BYTE VARIABLE IN $0002 $0003 AND A
;TWO BYTE INCREMENT VALUE IN $0004 $0005
; 10) MULTIPLY FUNCTIONS EXPECTS 
;TWO 2-BYTE VARIABLES IN $0002 $0003 AND
;$0004 $0005 AND MULTIPLYS
;THEM AND GIVE RESULT IN $0000
;AND $0001
;11) DIVIDE IS SAME AS MULTIPLY BUT IT 
;RETURNS QUOTIENT IN $0000 
;$0001 AND REMAINDER IN $0002 $0003
;12) SPRITE_PRINT FUNCTION TAKES TWO
;  SPRITE SIZE IN $0008 $0009 AS WIDTH HEIGHT
;AND (X,Y) AS POSITION TO START IN $000A 
;$000B COLOR IN $000D , STARTING MEMORY
; LOCATION IN $0032 $0033
;
;#####
;#####
;#####       CONSIDER 5*5 GRID SPRITE
;#####       FROM 0-25 OR $00-$19
;#####       (A,B)-> A+B*4 GIVES GRID
;                    COUNT POSITION IN 0-25
;THE COUNTING GOES ROW WISE I.E. 1ST 
;ROW THEN 2ND ROW ..........
;AFTER EVERY ROW CHANGE KEEP $00 AS
;A SEPARATER TO SPECIFY ENTERING 
;ANOTHER ROW AND EVEN AT START 
;13) WHEREISLETTER  FUNCTION EXPECTS
;CODE OF SYMBOL IN $000C AND RETURNS
;POSITION OF SYMBOL IN MEMORY IN $0032
; $0033



; FUNCTION IMPLEMENTED BELOW

ADD:
PHA
CLC
LDA $0003
ADC $0005
STA $0001
LDA $0002
ADC $0004
STA $0000
PLA
RTS

SBT:
PHA
JSR BOOLEQUAL 
LDA $0000
CMP #$01
BEQ ENDSBT
CLC
LDA $0003
SBC $0005
STA $0001
LDA $0002
SBC $0004
STA $0000
PLA
RTS
ENDSBT:
LDA #$00
STA $0000
STA $0001
PLA
RTS

MULTIPLY:
LDA $0004
STA $0006
LDA $0005
STA $0007
LDA $0002
STA $0008
LDA $0003
STA $0009
LDX #$0F
LDA #$00
STA $0002
STA $0003
LOOPMUL1:
CLC
ROR $0006
ROR $0007
BCC NEXTCHECKMUL
LDA $0008
STA $0004
LDA $0009
STA $0005
CLC
ROL $0005
ROL $0004
PHA
TXA 
PHA
JSR ADD
PLA
TAX 
PLA 
LDA $0000
STA $0002
LDA $0001
STA $0003
CPX #$00
BEQ ENDMUL
DEX
JMP LOOPMUL1 
NEXTCHECKMUL:
CPX #$0F
BEQ EHMUL
CLC
ROL $0009
ROL $0008
CPX #$00
BEQ ENDMUL
DEX
JMP LOOPMUL1 
ENDMUL:
LDA $0002
STA $0000
LDA $0003
STA $0001
RTS
EHMUL:
DEX
JMP LOOPMUL1 

DIVIDE:
LDA $0002
STA $0006
LDA $0003
STA $0007
LDA $0004
STA $0008
LDA $0005
STA $0009
LDA #$00
STA $0002
STA $0003
STA $0004
STA $0005
LDX #$10
LOOPDIVIDE1:
CPX #$00
BEQ ENDDIVIDE
CLC
ROL $0007
ROL $0006
ROL $0003
ROL $0002
LDA $0008
STA $0004
LDA $0009
STA $0005
TXA
PHA
JSR BOOLLESSER 
PLA
TAX
LDA $0000
CMP #$01
BEQ LOOPDIVIDE2
TXA 
PHA
JSR SBT
PLA
TAX
LDA $0000
STA $0002
LDA $0001
STA $0003
SEC
ROL $000B
ROL $000A
DEX
JMP LOOPDIVIDE1 
LOOPDIVIDE2:
CLC
ROL $000B
ROL $000A
DEX
JMP LOOPDIVIDE1 
ENDDIVIDE:
LDA $000A
STA $0000
LDA $000B
STA $0001
RTS





COMPARE:
LDA #$00
LDX #$00
LDY #$00
LDA $0003
CMP $0005
BCC LESSERL
BCS GREATERL
HIGHCOMP:
LDA $0002
CMP $0004
BCC LESSERH
BCS GREATERH
LESSERL:
LDA #$01
STA $0001
JMP HIGHCOMP
GREATERL:
BEQ EQUALL
LDA #$02
STA $0001
JMP HIGHCOMP
EQUALL:
LDA #$00
STA $0001
JMP HIGHCOMP
LESSERH:
LDA #$01
STA $0000
RTS
GREATERH:
BEQ EQUALH
LDA #$02
STA $0000
RTS
EQUALH:
LDA #$00
STA $0000
RTS

BOOLGREATER:
JSR COMPARE 
LDA $0000
CMP #$02
BEQ YESGRA
LDA #$00
STA $0000
LDA $0001
CMP #$02
BEQ YESGRB
LDA #$00
STA $0001
RTS
YESGRA:
LDA #$01
STA $0000
LDA #$01
STA $0001
RTS
YESGRB:
LDA #$01
STA $0001
LDA #$01
STA $0000
RTS


BOOLLESSER:
JSR COMPARE 
LDA $0000
CMP #$01
BEQ YESLEA
CMP #$02
BEQ GREATLESS
LDA #$00
STA $0000
LDA $0001
CMP #$01
BEQ YESLEB
CMP #$02
BEQ GREATLESS
LDA #$00
STA $0001
RTS
YESLEA:
LDA #$01
STA $0000
LDA #$01
STA $0001
RTS
YESLEB:
LDA #$01
STA $0001
LDA #$01
STA $0000
RTS
GREATLESS:
LDA #$00
STA $0000
STA $0001
RTS


BOOLEQUAL:
JSR COMPARE 
LDA $0000
CMP #$00
BEQ YESEQA
LDA #$00
STA $0000
LOWEQ:
LDA $0001
CMP #$00
BEQ YESEQB
LDA #$00
STA $0001
JMP OUTPUTEQ
YESEQA:
LDA #$01
STA $0000
JMP LOWEQ
RTS
YESEQB:
LDA #$01
STA $0001
OUTPUTEQ:
LDA $0000
AND $0001
CMP #$01
BEQ YESFINEQ
LDA #$00
STA $0000
STA $0001
RTS
YESFINEQ:
LDA #$01
STA $0000
STA $0001
RTS


ANDG:
LDA $0000
STA $0006
LDA $0001
STA $0007
JSR BOOLGREATER 
LDA $0000
AND $0006
STA $0002
LDA $0001
AND $0007
STA $0003
LDA #$01
STA $0004
STA $0005
JSR BOOLEQUAL
RTS


ANDL:
LDA $0000
STA $0006
LDA $0001
STA $0007
JSR BOOLLESSER
LDA $0000
AND $0006
STA $0002
LDA $0001
AND $0007
STA $0003
LDA #$01
STA $0004
STA $0005
JSR BOOLEQUAL
RTS


ANDE:
LDA $0000
STA $0006
LDA $0001
STA $0007
JSR BOOLEQUAL
LDA $0000
AND $0006
STA $0002
LDA $0001
AND $0007
STA $0003
LDA #$01
STA $0004
STA $0005
JSR BOOLEQUAL
RTS


ORG:
LDA $0000
STA $0006
LDA $0001
STA $0007
JSR BOOLGREATER 
LDA $0000
ORA $0006
STA $0002
LDA $0001
ORA $0007
STA $0003
LDA #$01
STA $0004
STA $0005
JSR BOOLEQUAL
RTS


ORL:
LDA $0000
STA $0006
LDA $0001
STA $0007
JSR BOOLLESSER
LDA $0000
ORA $0006
STA $0002
LDA $0001
ORA $0007
STA $0003
LDA #$01
STA $0004
STA $0005
JSR BOOLEQUAL
RTS

ORE:
LDA $0000
STA $0006
LDA $0001
STA $0007
JSR BOOLEQUAL
LDA $0000
ORA $0006
STA $0002
LDA $0001
ORA $0007
STA $0003
LDA #$01
STA $0004
STA $0005
JSR BOOLEQUAL
RTS


PIXEL:
DEC $0002
LDX #$01
LDY $0003
LDA #$00
STA $0004
STA $0005
LDA $0002
STA $0005
LDA #$20
STA $0003
LDA #$00
STA $0002
LOOPPIXEL:
TYA
STX $0006
CMP $0006
BEQ ENDLOOPPIXEL
JSR ADD
LDA $0000
STA $0004
LDA $0001
STA $0005
INX
JMP LOOPPIXEL 
ENDLOOPPIXEL:
LDA #$02
STA $0002
LDA #$00
STA $0003
JSR ADD
LDX $0000
LDY $0001
STX $0003
STY $0002
LDX #$00
LDA $0007
STA ($02,X)
RTS


;WHILE:
;LDA $00
;CMP $01
;BEQ EXITLOOP
;JSR TOLOOP
;JMP WHILE


FORCOMPAREL: 
JSR BOOLLESSER
RTS


FORCOMPAREG: 
JSR BOOLGREATER 
RTS

FORCOMPAREE: 
JSR BOOLEQUAL 
RTS

FORINC:
JSR ADD
RTS


SPRITE_PRINT: ;$000A $000B (X,Y) ,$0008 $0009 GRID
             ;SIZE, COLOR IN $000D ,STARTING
              ;POINT IN $0032 $0033 , $0030 IS ALSO
               ; USED
LDX #$01
LDY #$01
LDA #$00
STA $0000
STA $0001

LDA #$00
STA $0030

LOOPPRINT1:

TYA
STA $0005
TAY
CLC
LDA $0005
ADC $0005
ADC $0005
ADC $0005
STA $0005
TXA 
STA $0003
TAX
LDA #$00
STA $0004
STA $0002
TXA
PHA
TYA
PHA
JSR ADD
PLA
TAY
PLA
TAX
TYA
PHA
LDY $0030
LDA ($32),Y
CMP $0001
BNE NOTPRINT
PLA
TAY 
INC $0030

TYA
STA $0003
TAY
;INC $0002
LDA $000D
STA $0007
TXA
STA $0002
TAX 
LDA $000A
STA $0004
LDA $000B
STA $0005
TXA
PHA
TYA
PHA
JSR ADD
PLA
TAY
PLA
TAX
LDA $0000
STA $0002
LDA $0001
STA $0003
;INC $0003
TXA
PHA
TYA
PHA
JSR PIXEL
PLA
TAY
PLA
TAX

CPX $0008
BEQ LOOPPRINT2 
INX
JMP LOOPPRINT1 
NOTPRINT:
PLA
TAY
CPX $0008
BEQ LOOPPRINT2 
INX
JMP LOOPPRINT1 
LOOPPRINT2:
LDX #$01
CPY $0009
BEQ ENDLOOPPRINT
INY

INC $0030

JMP LOOPPRINT1 
ENDLOOPPRINT:
RTS


WHEREISLETTER:;EXPECTS CODE IN $000C
LDA $000C
CMP #$01
BEQ LETTER_A
CMP #$02
BEQ LETTER_B
CMP #$03
BEQ LETTER_C
CMP #$04
BEQ LETTER_D

RTS

LETTER_A:
LDA #$03
STA $0032
LDA #$06
STA $0033
RTS

LETTER_B:
LDA #$13
STA $0032
LDA #$06
STA $0033
RTS


LETTER_C:
LDA #$2F
STA $0032
LDA #$06
STA $0033
RTS


LETTER_D:
LDA #$49
STA $0032
LDA #$06
STA $0033
RTS

LETTER_E:
LDA #$62
STA $0032
LDA #$06
STA $0033
RTS

LETTER_F:
LDA #$78
STA $0032
LDA #$06
STA $0033
RTS


LETTER_G:
LDA #$8C
STA $0032
LDA #$06
STA $0033
RTS

LETTER_H:
LDA #$A0
STA $0032
LDA #$06
STA $0033
RTS


LETTER_I:
LDA #$BB
STA $0032
LDA #$06
STA $0033
RTS


LETTER_J:
LDA #$CA
STA $0032
LDA #$06
STA $0033
RTS


LETTER_K:
LDA #$DC
STA $0032
LDA #$06
STA $0033
RTS

LETTER_L:
LDA #$EC
STA $0032
LDA #$06
STA $0033
RTS


LETTER_M:
LDA #$FF
STA $0032
LDA #$06
STA $0033
RTS


LETTER_N:
LDA #$16
STA $0032
LDA #$07
STA $0033
RTS

LETTER_O:
LDA #$27
STA $0032
LDA #$07
STA $0033
RTS

LETTER_P:
LDA #$39
STA $0032
LDA #$07
STA $0033
RTS


LETTER_Q:
LDA #$51
STA $0032
LDA #$07
STA $0033
RTS

LETTER_R:
LDA #$66
STA $0032
LDA #$07
STA $0033
RTS


LETTER_S:
LDA #$77
STA $0032
LDA #$07
STA $0033
RTS


LETTER_T:
LDA #$8B
STA $0032
LDA #$07
STA $0033
RTS

LETTER_U:
LDA #$9A
STA $0032
LDA #$07
STA $0033
RTS

LETTER_V:
LDA #$AB
STA $0032
LDA #$07
STA $0033
RTS


LETTER_W:
LDA #$BA
STA $0032
LDA #$07
STA $0033
RTS

LETTER_X:
LDA #$CB
STA $0032
LDA #$07
STA $0033
RTS


LETTER_Y:
LDA #$DA
STA $0032
LDA #$07
STA $0033
RTS


LETTER_Z:
LDA #$E7
STA $0032
LDA #$07
STA $0033
RTS
