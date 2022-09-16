;----------------------------------------------------
; Kid Chameleon compression decompression routine
;----------------------------------------------------

UnknownDec:				; CODE XREF: MainLevelLoadBlock:loc_732Cp
		moveq	#0,d0
		move.w	#$7FF,d4
		moveq	#0,d5
		moveq	#0,d6
		move.w	a3,d7
		subq.w	#1,d2
		beq.w	loc_1DCC
		subq.w	#1,d2
		beq.w	loc_1D4E
		subq.w	#1,d2
		beq.w	loc_1CD0
		subq.w	#1,d2
		beq.w	loc_1C52
		subq.w	#1,d2
		beq.w	loc_1BD6
		subq.w	#1,d2
		beq.w	loc_1B58
		subq.w	#1,d2
		beq.w	loc_1ADE

loc_1A62:				; CODE XREF: UnknownDec+108j
					; UnknownDec+2C0j ...
		move.b	(a0)+,d1
		add.b	d1,d1
		bcs.s	loc_1ADC
		movea.l	a2,a6
		add.b	d1,d1
		bcs.s	loc_1A84
		move.b	(a1)+,d5
		suba.l	d5,a6
		add.b	d1,d1
		bcc.s	loc_1A78
		move.b	(a6)+,(a2)+

loc_1A78:				; CODE XREF: UnknownDec+48j
		move.b	(a6)+,(a2)+
		move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1ACC
		bra.w	loc_1BD6
; ---------------------------------------------------------------------------

loc_1A84:				; CODE XREF: UnknownDec+40j
		lsl.w	#3,d1
		move.w	d1,d6
		and.w	d4,d6
		move.b	(a1)+,d6
		suba.l	d6,a6
		add.b	d1,d1
		bcs.s	loc_1A98
		add.b	d1,d1
		bcs.s	loc_1AAC+2
		bra.s	loc_1AAC+4
; ---------------------------------------------------------------------------

loc_1A98:				; CODE XREF: UnknownDec+64j
		add.b	d1,d1
		bcc.s	loc_1AAC
		moveq	#0,d0
		move.b	(a1)+,d0
		beq.s	loc_1ABE
		subq.w	#6,d0
		bmi.s	loc_1AC4

loc_1AA6:				; CODE XREF: UnknownDec+7Cj
		move.b	(a6)+,(a2)+
		dbf	d0,loc_1AA6

loc_1AAC:				; CODE XREF: UnknownDec+6Ej
		move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1AD4
		bra.w	loc_1DCC
; ---------------------------------------------------------------------------

loc_1ABE:				; CODE XREF: UnknownDec+74j
		move.w	#0,d0
		rts
; ---------------------------------------------------------------------------

loc_1AC4:				; CODE XREF: UnknownDec+78j
		move.w	#-1,d0
		moveq	#1,d2
		rts
; ---------------------------------------------------------------------------

loc_1ACC:				; CODE XREF: UnknownDec+52j
		move.w	#1,d0
		moveq	#5,d2
		rts
; ---------------------------------------------------------------------------

loc_1AD4:				; CODE XREF: UnknownDec+8Cj
		move.w	#1,d0
		moveq	#1,d2
		rts
; ---------------------------------------------------------------------------

loc_1ADC:				; CODE XREF: UnknownDec+3Aj
		move.b	(a1)+,(a2)+

loc_1ADE:				; CODE XREF: UnknownDec+32j
					; UnknownDec+186j ...
		add.b	d1,d1
		bcs.s	loc_1B56
		movea.l	a2,a6
		add.b	d1,d1
		bcs.s	loc_1AFE
		move.b	(a1)+,d5
		suba.l	d5,a6
		add.b	d1,d1
		bcc.s	loc_1AF2
		move.b	(a6)+,(a2)+

loc_1AF2:				; CODE XREF: UnknownDec+C2j
		move.b	(a6)+,(a2)+
		move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1B46
		bra.w	loc_1C52
; ---------------------------------------------------------------------------

loc_1AFE:				; CODE XREF: UnknownDec+BAj
		lsl.w	#3,d1
		move.w	d1,d6
		and.w	d4,d6
		move.b	(a1)+,d6
		suba.l	d6,a6
		add.b	d1,d1
		bcs.s	loc_1B12
		add.b	d1,d1
		bcs.s	loc_1B26+2
		bra.s	loc_1B26+4
; ---------------------------------------------------------------------------

loc_1B12:				; CODE XREF: UnknownDec+DEj
		add.b	d1,d1
		bcc.s	loc_1B26
		moveq	#0,d0
		move.b	(a1)+,d0
		beq.s	loc_1B38
		subq.w	#6,d0
		bmi.s	loc_1B3E

loc_1B20:				; CODE XREF: UnknownDec+F6j
		move.b	(a6)+,(a2)+
		dbf	d0,loc_1B20

loc_1B26:				; CODE XREF: UnknownDec+E8j
		move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1B4E
		bra.w	loc_1A62
; ---------------------------------------------------------------------------

loc_1B38:				; CODE XREF: UnknownDec+EEj
		move.w	#0,d0
		rts
; ---------------------------------------------------------------------------

loc_1B3E:				; CODE XREF: UnknownDec+F2j
		move.w	#-1,d0
		moveq	#0,d2
		rts
; ---------------------------------------------------------------------------

loc_1B46:				; CODE XREF: UnknownDec+CCj
		move.w	#1,d0
		moveq	#4,d2
		rts
; ---------------------------------------------------------------------------

loc_1B4E:				; CODE XREF: UnknownDec+106j
		move.w	#1,d0
		moveq	#0,d2
		rts
; ---------------------------------------------------------------------------

loc_1B56:				; CODE XREF: UnknownDec+B4j
		move.b	(a1)+,(a2)+

loc_1B58:				; CODE XREF: UnknownDec+2Cj
					; UnknownDec+202j ...
		add.b	d1,d1
		bcs.s	loc_1BD4
		movea.l	a2,a6
		add.b	d1,d1
		bcs.s	loc_1B78
		move.b	(a1)+,d5
		suba.l	d5,a6
		add.b	d1,d1
		bcc.s	loc_1B6C
		move.b	(a6)+,(a2)+

loc_1B6C:				; CODE XREF: UnknownDec+13Cj
		move.b	(a6)+,(a2)+
		move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1BC4
		bra.w	loc_1CD0
; ---------------------------------------------------------------------------

loc_1B78:				; CODE XREF: UnknownDec+134j
		lsl.w	#3,d1
		move.w	d1,d6
		and.w	d4,d6
		move.b	(a1)+,d6
		suba.l	d6,a6
		add.b	d1,d1
		bcs.s	loc_1B8E
		move.b	(a0)+,d1
		add.b	d1,d1
		bcs.s	loc_1BA4+2
		bra.s	loc_1BA4+4
; ---------------------------------------------------------------------------

loc_1B8E:				; CODE XREF: UnknownDec+158j
		move.b	(a0)+,d1
		add.b	d1,d1
		bcc.s	loc_1BA4
		moveq	#0,d0
		move.b	(a1)+,d0
		beq.s	loc_1BB6
		subq.w	#6,d0
		bmi.s	loc_1BBC

loc_1B9E:				; CODE XREF: UnknownDec+174j
		move.b	(a6)+,(a2)+
		dbf	d0,loc_1B9E

loc_1BA4:				; CODE XREF: UnknownDec+166j
		move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1BCC
		bra.w	loc_1ADE
; ---------------------------------------------------------------------------

loc_1BB6:				; CODE XREF: UnknownDec+16Cj
		move.w	#0,d0
		rts
; ---------------------------------------------------------------------------

loc_1BBC:				; CODE XREF: UnknownDec+170j
		move.w	#-1,d0
		moveq	#7,d2
		rts
; ---------------------------------------------------------------------------

loc_1BC4:				; CODE XREF: UnknownDec+146j
		move.w	#1,d0
		moveq	#3,d2
		rts
; ---------------------------------------------------------------------------

loc_1BCC:				; CODE XREF: UnknownDec+184j
		move.w	#1,d0
		moveq	#7,d2
		rts
; ---------------------------------------------------------------------------

loc_1BD4:				; CODE XREF: UnknownDec+12Ej
		move.b	(a1)+,(a2)+

loc_1BD6:				; CODE XREF: UnknownDec+26j
					; UnknownDec+54j ...
		add.b	d1,d1
		bcs.s	loc_1C50
		movea.l	a2,a6
		add.b	d1,d1
		bcs.s	loc_1BF6
		move.b	(a1)+,d5
		suba.l	d5,a6
		add.b	d1,d1
		bcc.s	loc_1BEA
		move.b	(a6)+,(a2)+

loc_1BEA:				; CODE XREF: UnknownDec+1BAj
		move.b	(a6)+,(a2)+
		move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1C40
		bra.w	loc_1D4E
; ---------------------------------------------------------------------------

loc_1BF6:				; CODE XREF: UnknownDec+1B2j
		lsl.w	#3,d1
		move.b	(a0)+,d1
		move.w	d1,d6
		and.w	d4,d6
		move.b	(a1)+,d6
		suba.l	d6,a6
		add.b	d1,d1
		bcs.s	loc_1C0C
		add.b	d1,d1
		bcs.s	loc_1C20+2
		bra.s	loc_1C20+4
; ---------------------------------------------------------------------------

loc_1C0C:				; CODE XREF: UnknownDec+1D8j
		add.b	d1,d1
		bcc.s	loc_1C20
		moveq	#0,d0
		move.b	(a1)+,d0
		beq.s	loc_1C32
		subq.w	#6,d0
		bmi.s	loc_1C38

loc_1C1A:				; CODE XREF: UnknownDec+1F0j
		move.b	(a6)+,(a2)+
		dbf	d0,loc_1C1A

loc_1C20:				; CODE XREF: UnknownDec+1E2j
		move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1C48
		bra.w	loc_1B58
; ---------------------------------------------------------------------------

loc_1C32:				; CODE XREF: UnknownDec+1E8j
		move.w	#0,d0
		rts
; ---------------------------------------------------------------------------

loc_1C38:				; CODE XREF: UnknownDec+1ECj
		move.w	#-1,d0
		moveq	#6,d2
		rts
; ---------------------------------------------------------------------------

loc_1C40:				; CODE XREF: UnknownDec+1C4j
		move.w	#1,d0
		moveq	#2,d2
		rts
; ---------------------------------------------------------------------------

loc_1C48:				; CODE XREF: UnknownDec+200j
		move.w	#1,d0
		moveq	#6,d2
		rts
; ---------------------------------------------------------------------------

loc_1C50:				; CODE XREF: UnknownDec+1ACj
		move.b	(a1)+,(a2)+

loc_1C52:				; CODE XREF: UnknownDec+20j
					; UnknownDec+CEj ...
		add.b	d1,d1
		bcs.s	loc_1CCE
		movea.l	a2,a6
		add.b	d1,d1
		bcs.s	loc_1C72
		move.b	(a1)+,d5
		suba.l	d5,a6
		add.b	d1,d1
		bcc.s	loc_1C66
		move.b	(a6)+,(a2)+

loc_1C66:				; CODE XREF: UnknownDec+236j
		move.b	(a6)+,(a2)+
		move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1CBE
		bra.w	loc_1DCC
; ---------------------------------------------------------------------------

loc_1C72:				; CODE XREF: UnknownDec+22Ej
		lsl.w	#2,d1
		move.b	(a0)+,d1
		add.w	d1,d1
		move.w	d1,d6
		and.w	d4,d6
		move.b	(a1)+,d6
		suba.l	d6,a6
		add.b	d1,d1
		bcs.s	loc_1C8A
		add.b	d1,d1
		bcs.s	loc_1C9E+2
		bra.s	loc_1C9E+4
; ---------------------------------------------------------------------------

loc_1C8A:				; CODE XREF: UnknownDec+256j
		add.b	d1,d1
		bcc.s	loc_1C9E
		moveq	#0,d0
		move.b	(a1)+,d0
		beq.s	loc_1CB0
		subq.w	#6,d0
		bmi.s	loc_1CB6

loc_1C98:				; CODE XREF: UnknownDec+26Ej
		move.b	(a6)+,(a2)+
		dbf	d0,loc_1C98

loc_1C9E:				; CODE XREF: UnknownDec+260j
		move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1CC6
		bra.w	loc_1BD6
; ---------------------------------------------------------------------------

loc_1CB0:				; CODE XREF: UnknownDec+266j
		move.w	#0,d0
		rts
; ---------------------------------------------------------------------------

loc_1CB6:				; CODE XREF: UnknownDec+26Aj
		move.w	#-1,d0
		moveq	#5,d2
		rts
; ---------------------------------------------------------------------------

loc_1CBE:				; CODE XREF: UnknownDec+240j
		move.w	#1,d0
		moveq	#1,d2
		rts
; ---------------------------------------------------------------------------

loc_1CC6:				; CODE XREF: UnknownDec+27Ej
		move.w	#1,d0
		moveq	#5,d2
		rts
; ---------------------------------------------------------------------------

loc_1CCE:				; CODE XREF: UnknownDec+228j
		move.b	(a1)+,(a2)+

loc_1CD0:				; CODE XREF: UnknownDec+1Aj
					; UnknownDec+148j ...
		add.b	d1,d1
		bcs.s	loc_1D4C
		movea.l	a2,a6
		add.b	d1,d1
		bcs.s	loc_1CF0
		move.b	(a1)+,d5
		suba.l	d5,a6
		add.b	d1,d1
		bcc.s	loc_1CE4
		move.b	(a6)+,(a2)+

loc_1CE4:				; CODE XREF: UnknownDec+2B4j
		move.b	(a6)+,(a2)+
		move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1D3C
		bra.w	loc_1A62
; ---------------------------------------------------------------------------

loc_1CF0:				; CODE XREF: UnknownDec+2ACj
		add.w	d1,d1
		move.b	(a0)+,d1
		lsl.w	#2,d1
		move.w	d1,d6
		and.w	d4,d6
		move.b	(a1)+,d6
		suba.l	d6,a6
		add.b	d1,d1
		bcs.s	loc_1D08
		add.b	d1,d1
		bcs.s	loc_1D1C+2
		bra.s	loc_1D1C+4
; ---------------------------------------------------------------------------

loc_1D08:				; CODE XREF: UnknownDec+2D4j
		add.b	d1,d1
		bcc.s	loc_1D1C
		moveq	#0,d0
		move.b	(a1)+,d0
		beq.s	loc_1D2E
		subq.w	#6,d0
		bmi.s	loc_1D34

loc_1D16:				; CODE XREF: UnknownDec+2ECj
		move.b	(a6)+,(a2)+
		dbf	d0,loc_1D16

loc_1D1C:				; CODE XREF: UnknownDec+2DEj
		move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1D44
		bra.w	loc_1C52
; ---------------------------------------------------------------------------

loc_1D2E:				; CODE XREF: UnknownDec+2E4j
		move.w	#0,d0
		rts
; ---------------------------------------------------------------------------

loc_1D34:				; CODE XREF: UnknownDec+2E8j
		move.w	#-1,d0
		moveq	#4,d2
		rts
; ---------------------------------------------------------------------------

loc_1D3C:				; CODE XREF: UnknownDec+2BEj
		move.w	#1,d0
		moveq	#8,d2
		rts
; ---------------------------------------------------------------------------

loc_1D44:				; CODE XREF: UnknownDec+2FCj
		move.w	#1,d0
		moveq	#4,d2
		rts
; ---------------------------------------------------------------------------

loc_1D4C:				; CODE XREF: UnknownDec+2A6j
		move.b	(a1)+,(a2)+

loc_1D4E:				; CODE XREF: UnknownDec+14j
					; UnknownDec+1C6j ...
		add.b	d1,d1
		bcs.s	loc_1DCA
		movea.l	a2,a6
		add.b	d1,d1
		bcs.s	loc_1D70
		move.b	(a0)+,d1
		move.b	(a1)+,d5
		suba.l	d5,a6
		add.b	d1,d1
		bcc.s	loc_1D64
		move.b	(a6)+,(a2)+

loc_1D64:				; CODE XREF: UnknownDec+334j
		move.b	(a6)+,(a2)+
		move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1DBA
		bra.w	loc_1ADE
; ---------------------------------------------------------------------------

loc_1D70:				; CODE XREF: UnknownDec+32Aj
		move.b	(a0)+,d1
		lsl.w	#3,d1
		move.w	d1,d6
		and.w	d4,d6
		move.b	(a1)+,d6
		suba.l	d6,a6
		add.b	d1,d1
		bcs.s	loc_1D86
		add.b	d1,d1
		bcs.s	loc_1D9A+2
		bra.s	loc_1D9A+4
; ---------------------------------------------------------------------------

loc_1D86:				; CODE XREF: UnknownDec+352j
		add.b	d1,d1
		bcc.s	loc_1D9A
		moveq	#0,d0
		move.b	(a1)+,d0
		beq.s	loc_1DAC
		subq.w	#6,d0
		bmi.s	loc_1DB2

loc_1D94:				; CODE XREF: UnknownDec+36Aj
		move.b	(a6)+,(a2)+
		dbf	d0,loc_1D94

loc_1D9A:				; CODE XREF: UnknownDec+35Cj
		move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1DC2
		bra.w	loc_1CD0
; ---------------------------------------------------------------------------

loc_1DAC:				; CODE XREF: UnknownDec+362j
		move.w	#0,d0
		rts
; ---------------------------------------------------------------------------

loc_1DB2:				; CODE XREF: UnknownDec+366j
		move.w	#-1,d0
		moveq	#3,d2
		rts
; ---------------------------------------------------------------------------

loc_1DBA:				; CODE XREF: UnknownDec+33Ej
		move.w	#1,d0
		moveq	#7,d2
		rts
; ---------------------------------------------------------------------------

loc_1DC2:				; CODE XREF: UnknownDec+37Aj
		move.w	#1,d0
		moveq	#3,d2
		rts
; ---------------------------------------------------------------------------

loc_1DCA:				; CODE XREF: UnknownDec+324j
		move.b	(a1)+,(a2)+

loc_1DCC:				; CODE XREF: UnknownDec+Ej
					; UnknownDec+8Ej ...
		add.b	d1,d1
		bcs.s	loc_1E46
		move.b	(a0)+,d1
		movea.l	a2,a6
		add.b	d1,d1
		bcs.s	loc_1DEE
		move.b	(a1)+,d5
		suba.l	d5,a6
		add.b	d1,d1
		bcc.s	loc_1DE2
		move.b	(a6)+,(a2)+

loc_1DE2:				; CODE XREF: UnknownDec+3B2j
		move.b	(a6)+,(a2)+
		move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1E36
		bra.w	loc_1B58
; ---------------------------------------------------------------------------

loc_1DEE:				; CODE XREF: UnknownDec+3AAj
		lsl.w	#3,d1
		move.w	d1,d6
		and.w	d4,d6
		move.b	(a1)+,d6
		suba.l	d6,a6
		add.b	d1,d1
		bcs.s	loc_1E02
		add.b	d1,d1
		bcs.s	loc_1E16+2
		bra.s	loc_1E16+4
; ---------------------------------------------------------------------------

loc_1E02:				; CODE XREF: UnknownDec+3CEj
		add.b	d1,d1
		bcc.s	loc_1E16
		moveq	#0,d0
		move.b	(a1)+,d0
		beq.s	loc_1E28
		subq.w	#6,d0
		bmi.s	loc_1E2E

loc_1E10:				; CODE XREF: UnknownDec+3E6j
		move.b	(a6)+,(a2)+
		dbf	d0,loc_1E10

loc_1E16:				; CODE XREF: UnknownDec+3D8j
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
                move.b	(a6)+,(a2)+
		cmp.w	a2,d7
		bls.s	loc_1E3E
		bra.w	loc_1D4E
; ---------------------------------------------------------------------------

loc_1E28:				; CODE XREF: UnknownDec+3DEj
		move.w	#0,d0
		rts
; ---------------------------------------------------------------------------

loc_1E2E:				; CODE XREF: UnknownDec+3E2j
		move.w	#-1,d0
		moveq	#2,d2
		rts
; ---------------------------------------------------------------------------

loc_1E36:				; CODE XREF: UnknownDec+3BCj
		move.w	#1,d0
		moveq	#6,d2
		rts
; ---------------------------------------------------------------------------

loc_1E3E:				; CODE XREF: UnknownDec+3F6j
		move.w	#1,d0
		moveq	#2,d2
		rts
; ---------------------------------------------------------------------------

loc_1E46:				; CODE XREF: UnknownDec+3A2j
		move.b	(a1)+,(a2)+
		bra.w	loc_1A62
; End of function UnknownDec