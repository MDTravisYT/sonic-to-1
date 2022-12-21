DebugList:	dc.w Debug_GHZ-DebugList ; DATA	XREF: ROM:loc_1BB0Ao
					; ROM:loc_1BB44o ...
		dc.w Debug_CPZ-DebugList
		dc.w Debug_CPZ-DebugList
		dc.w Debug_EHZ-DebugList
		dc.w Debug_HPZ-DebugList
		dc.w Debug_HTZ-DebugList
		dc.w Debug_HPZ-DebugList
Debug_GHZ:	dc.w $E			; DATA XREF: ROM:DebugListo
		dc.l Map_Obj25+$25000000
		dc.b   0,  0,$26,$BC	; subtype, frame, VRAM setting (2 bytes)
		dc.l Map_Obj26+$26000000
		dc.b   0,  0,  6,$80	; 0
		dc.l Map_Obj1F+$1F000000
		dc.b   0,  0,  4,  0	; 0
		dc.l Map_Obj22+$22000000
		dc.b   0,  0,  4,$44	; 0
		dc.l Map_Obj2B+$2B000000
		dc.b   0,  0,  4,$70	; 0
		dc.l Map_Obj36+$36000000
		dc.b   0,  0,  4,$A0	; 0
		dc.l Map_Obj18+$18000000
		dc.b   0,  0,$40,  0	; 0
		dc.l Map_Obj3B+$3B000000
		dc.b   0,  0,$66,$C0	; 0
		dc.l Map_Obj40+$40000000
		dc.b   0,  0,  4,$E0	; 0
		dc.l Map_Obj41_GHZ+$41000000
		dc.b   0,  0,  4,$A8	; 0
		dc.l Map_Obj32+$42000000
		dc.b   0,  0,$24,$9B	; 0
		dc.l Map_Obj44+$44000000
		dc.b   0,  0,$43,$4C	; 0
		dc.l Map_Obj79+$79000000
		dc.b   1,  0,$26,$BC	; 0
		dc.l Map_Obj03+$03000000
		dc.b   0,  0,$26,$BC	; 0
Debug_CPZ:	dc.w $10		; DATA XREF: ROM:0001BCEEo
					; ROM:0001BCF0o
		dc.l Map_Obj25+$25000000
		dc.b   0,  0,$26,$BC	; 0
		dc.l Map_Obj26+$26000000
		dc.b   0,  0,  6,$80	; 0
		dc.l Map_Obj41_GHZ+$41000000
		dc.b   0,  0,  4,$A8	; 0
		dc.l Map_Obj03+$03000000
		dc.b   0,  0,  7,$BC	; 0
		dc.l Map_Obj0B+$0B000000
		dc.b   0,  0,$E0,  0	; 0
		dc.l Map_Obj0C+$0C000000
		dc.b   0,  0,$E4,$18	; 0
		dc.l Map_Obj15_CPZ+$15000000
		dc.b   8,  0,$24,$18	; 0
		dc.l Map_Obj03+$03000000
		dc.b   9,  1,$26,$BC	; 0
		dc.l Map_Obj03+$03000000
		dc.b  $D,  5,$26,$BC	; 0
		dc.l Map_Obj19+$19000000
		dc.b   1,  0,$64,  0	; 0
		dc.l Map_Obj36+$36000000
		dc.b   0,  0,$24,$34	; 0
		dc.l Map_Obj41+$41000000
		dc.b $81,  0,  4,$5C	; 0
		dc.l Map_Obj41+$41000000
		dc.b $90,  3,  4,$70	; 0
		dc.l Map_Obj41+$41000000
		dc.b $A0,  6,  4,$5C	; 0
		dc.l Map_Obj41+$41000000
		dc.b $30,  7,  4,$3C	; 0
		dc.l Map_Obj41+$41000000
		dc.b $40, $A,  4,$3C	; 0
Debug_EHZ:	dc.w $13		; DATA XREF: ROM:0001BCF2o
		dc.l Map_Obj25+$25000000
		dc.b   0,  0,$26,$BC	; 0
		dc.l Map_Obj26+$26000000
		dc.b   0,  0,  6,$80	; 0
		dc.l Map_Obj79+$79000000
		dc.b   1,  0,  4,$7C	; 0
		dc.l Map_Obj03+$03000000
		dc.b   0,  0,$26,$BC	; 0
	;	dc.l Map_Obj49+$49000000
	;	dc.b   0,  0,$23,$AE	; 0
	;	dc.l Map_Obj49+$49000000
	;	dc.b   2,  3,$23,$AE	; 0
	;	dc.l Map_Obj49+$49000000
	;	dc.b   4,  5,$23,$AE	; 0
		dc.l Map_Obj18_EHZ+$18000000
		dc.b   1,  0,$40,  0	; 0
		dc.l Map_Obj18_EHZ+$18000000
		dc.b  $A,  1,$40,  0	; 0
		dc.l Map_Obj36+$36000000
		dc.b   0,  0,$24,$34	; 0
		dc.l Map_Obj14+$14000000
		dc.b   0,  0,  3,$CE	; 0
		dc.l Map_Obj41+$41000000
		dc.b $81,  0,  4,$5C	; 0
		dc.l Map_Obj41+$41000000
		dc.b $90,  3,  4,$70	; 0
		dc.l Map_Obj41+$41000000
		dc.b $A0,  6,  4,$5C	; 0
		dc.l Map_Obj41+$41000000
		dc.b $30,  7,  4,$3C	; 0
		dc.l Map_Obj41+$41000000
		dc.b $40, $A,  4,$3C	; 0
		dc.l Map_Obj4B+$4B000000
		dc.b   0,  0,  3,$E6	; 0
		dc.l Map_Obj54+$54000000
		dc.b   0,  0,  4,  2	; 0
		dc.l Map_Obj53+$53000000
		dc.b   0,  0,  4,$1C	; 0
		dc.l Map_Obj4F+$4F000000
		dc.b   0,  0,  5,  0	; 0
		dc.l Map_Obj52+$52000000
		dc.b   0,  0,$25,$30	; 0
		dc.l Map_Obj50+$50000000
		dc.b   0,  0,$25,$70	; 0
		dc.l Map_Obj50+$51000000
		dc.b   0,  0,$25,$70	; 0
		dc.l Map_Obj4D+$4D000000
		dc.b   0,  0,$23,$C4	; 0
		dc.l Map_Obj4B+$4B000000
		dc.b   0,  0,  3,$2C	; 0
		dc.l Map_Obj4E+$4E000000
		dc.b   0,  0,$23,  0	; 0
		dc.l Map_Obj4C+$4C000000
		dc.b   0,  0,$23,$50	; 0
		dc.l Map_Obj4A+$4A000000
		dc.b   0,  0,$23,$8A	; 0
Debug_HTZ:	dc.w $13		; DATA XREF: ROM:0001BCF6o
		dc.l Map_Obj25+$25000000
		dc.b   0,  0,$26,$BC	; 0
		dc.l Map_Obj26+$26000000
		dc.b   0,  0,  6,$80	; 0
		dc.l Map_Obj79+$79000000
		dc.b   1,  0,  4,$7C	; 0
		dc.l Map_Obj03+$03000000
		dc.b   0,  0,$26,$BC	; 0
		dc.l Map_Obj18_EHZ+$18000000
		dc.b   1,  0,$40,  0	; 0
		dc.l Map_Obj18_EHZ+$18000000
		dc.b  $A,  1,$40,  0	; 0
		dc.l Map_Obj36+$36000000
		dc.b   0,  0,$24,$34	; 0
		dc.l Map_Obj14+$14000000
		dc.b   0,  0,  3,$CE	; 0
		dc.l Map_Obj41+$41000000
		dc.b $81,  0,  4,$5C	; 0
		dc.l Map_Obj41+$41000000
		dc.b $90,  3,  4,$70	; 0
		dc.l Map_Obj41+$41000000
		dc.b $A0,  6,  4,$5C	; 0
		dc.l Map_Obj41+$41000000
		dc.b $30,  7,  4,$3C	; 0
		dc.l Map_Obj41+$41000000
		dc.b $40, $A,  4,$3C	; 0
		dc.l Map_Obj16+$16000000
		dc.b   0,  0,$43,$E6	; 0
		dc.l Map_Obj16+$1C000000
		dc.b   4,  1,$43,$E6	; 0
		dc.l Map_Obj16+$1C000000
		dc.b   5,  2,$43,$E6	; 0
		dc.l Map_Obj4B+$4B000000
		dc.b   0,  0,  3,$E6	; 0
		dc.l Map_Obj54+$54000000
		dc.b   0,  0,  4,  2	; 0
		dc.l Map_Obj53+$53000000
		dc.b   0,  0,  4,$1C	; 0
Debug_HPZ:	dc.w $F			; DATA XREF: ROM:0001BCF4o
					; ROM:0001BCF8o
		dc.l Map_Obj25+$25000000
		dc.b   0,  0,$26,$BC	; 0
		dc.l Map_Obj26+$26000000
		dc.b   0,  0,  6,$80	; 0
		dc.l Map_Obj1C_01+$1C000000
		dc.b $21,  3,$E4,$85	; 0
		dc.l Map_Obj13+$13000000
		dc.b   4,  4,$E4,$15	; 0
		dc.l Map_Obj1A_HPZ+$1A000000
		dc.b   0,  0,$44,$75	; 0
		dc.l Map_Obj03+$03000000
		dc.b   0,  0,$26,$BC	; 0
		dc.l Map_Obj4F+$4F000000
		dc.b   0,  0,  5,  0	; 0
		dc.l Map_Obj52+$52000000
		dc.b   0,  0,$25,$30	; 0
		dc.l Map_Obj50+$50000000
		dc.b   0,  0,$25,$70	; 0
		dc.l Map_Obj50+$51000000
		dc.b   0,  0,$25,$70	; 0
		dc.l Map_Obj4D+$4D000000
		dc.b   0,  0,$23,$C4	; 0
		dc.l Map_Obj4B+$4B000000
		dc.b   0,  0,  3,$2C	; 0
		dc.l Map_Obj4E+$4E000000
		dc.b   0,  0,$23,  0	; 0
		dc.l Map_Obj4C+$4C000000
		dc.b   0,  0,$23,$50	; 0
		dc.l Map_Obj4A+$4A000000
		dc.b   0,  0,$23,$8A	; 0