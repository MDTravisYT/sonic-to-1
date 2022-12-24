; ---------------------------------------------------------------------------
; Level Headers
; ---------------------------------------------------------------------------

MainLoadBlocks:

lhead:	macro plc1,lvlgfx,plc2,sixteen,twofivesix,music,pal
	dc.l (plc1<<24)+lvlgfx
	dc.l (plc2<<24)+sixteen
	dc.l twofivesix
	dc.b 0, music, pal, pal
	endm

; 1st PLC, level gfx (unused), 2nd PLC, 16x16 data, 256x256 data,
; music (unused), palette (unused), palette

;		1st PLC				2nd PLC				128x128 data			palette
;				level gfx*			16x16 data			music*

         	dc.l Nem_GHZ+$4000000, Map16_GHZ+$5000000, Map128_GHZ
		dc.b   0,$81,  4,  4	; 0

                dc.l Nem_LZ+$6000000, Map16_LZ+$7000000, Map128_LZ
		dc.b   0,$82,  5,  5	; 0

		dc.l Nem_MZ+$8000000, Map16_MZ+$9000000, Map128_MZ
		dc.b   0,$83,  6,  6	; 0

		dc.l Nem_SLZ+$A000000, Map16_SLZ+$B000000, Map128_SLZ
		dc.b   0,$84,  7,  7	; 0

		dc.l Nem_SYZ+$C000000, Map16_SYZ+$D000000, Map128_SYZ
		dc.b   0,$85,  8,  8	; 0

		dc.l Nem_SBZ+$E000000, Map16_SBZ+$F000000, Map128_SBZ
		dc.b   0,$86,  9,  9	; 0

		dc.l Nem_GHZ, Map16_GHZ, Map128_GHZ
		dc.b   0,$86,$13,$13	; 0