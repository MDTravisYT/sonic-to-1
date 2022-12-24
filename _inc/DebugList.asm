DebugList:	dc.w Debug_GHZ-DebugList ; DATA	XREF: ROM:loc_1BB0Ao
					; ROM:loc_1BB44o ...
		dc.w Debug_LZ-DebugList
		dc.w Debug_MZ-DebugList
		dc.w Debug_SLZ-DebugList
		dc.w Debug_SYZ-DebugList
		dc.w Debug_SBZ-DebugList
		dc.w Debug_Null-DebugList
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
Debug_LZ:
Debug_MZ:
Debug_SLZ:
Debug_SYZ:
Debug_SBZ:
Debug_Null:
	dc.w 0