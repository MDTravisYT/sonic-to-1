DeformBGLayer:
		tst.b	($FFFFEEDC).w
		beq.s	loc_5AA4
		rts
; ---------------------------------------------------------------------------

loc_5AA4:				; CODE XREF: DeformBGLayer+4j
		clr.w	($FFFFEE50).w
		clr.w	($FFFFEE52).w
		clr.w	($FFFFEE54).w
		clr.w	($FFFFEE56).w
		clr.w	($FFFFEE58).w
		clr.w	($FFFFEE5A).w
		clr.w	($FFFFEE5C).w
		clr.w	($FFFFEE5E).w
		lea	($FFFFB000).w,a0
		lea	(v_screenposx).w,a1
		lea	(v_fg_horiz_rd_flags).w,a2
		lea	($FFFFEE50).w,a3
		lea	($FFFFEEB0).w,a4
		lea	($FFFFEED0).w,a5
		lea	($FFFFE500).w,a6
		bsr.w	ScrollHorizontal
		lea	(v_screenposy).w,a1
		lea	(v_fg_verti_rd_flags).w,a2
		lea	($FFFFEEB2).w,a4
		bsr.w	ScrollVertical
		tst.w	($FFFFFFE8).w
		beq.s	loc_5B2A
		lea	($FFFFB040).w,a0
		lea	(v_screenposx_2p).w,a1
		lea	($FFFFEE48).w,a2
		lea	($FFFFEE58).w,a3
		lea	($FFFFEEB6).w,a4
		lea	($FFFFEED4).w,a5
		lea	($FFFFE700).w,a6
		bsr.w	ScrollHorizontal
		lea	(v_screenposy_2p).w,a1
		lea	($FFFFEE49).w,a2
		lea	($FFFFEEB8).w,a4
		bsr.w	ScrollVertical

loc_5B2A:				; CODE XREF: DeformBGLayer+5Cj
		bsr.w	DynScreenResizeLoad
		move.w	(v_screenposy).w,($FFFFF616).w
		move.w	(v_bgscreenposy).w,($FFFFF618).w
		moveq	#0,d0
		move.b	($FFFFFE10).w,d0
		add.w	d0,d0
		move.w	Deform_Index(pc,d0.w),d0
		jmp	Deform_Index(pc,d0.w)
; End of function DeformBGLayer

; ---------------------------------------------------------------------------
Deform_Index:	dc.w Deform_GHZ-Deform_Index; 0	; DATA XREF: ROM:Deform_Indexo
					; ROM:Deform_Index+2o ...
		dc.w Deform_LZ-Deform_Index; 1
		dc.w Deform_MZ-Deform_Index; 2
		dc.w Deform_EHZ-Deform_Index; 3
		dc.w Deform_HPZ-Deform_Index; 4
		dc.w Deform_HTZ-Deform_Index; 5
		dc.w Deform_GHZ-Deform_Index; 6
; ---------------------------------------------------------------------------

Deform_GHZ:				; DATA XREF: ROM:Deform_Indexo
		tst.w	($FFFFFFE8).w
		bne.w	loc_5C5A
		move.w	($FFFFEEB0).w,d4
		ext.l	d4
		asl.l	#5,d4
		move.l	d4,d1
		asl.l	#1,d4
		add.l	d1,d4
		moveq	#0,d6
		bsr.w	ScrollBlock6
		move.w	($FFFFEEB0).w,d4
		ext.l	d4
		asl.l	#7,d4
		moveq	#0,d6
		bsr.w	ScrollBlock5
		lea	(v_hscrolltablebuffer).w,a1
		move.w	(v_screenposy).w,d0
		andi.w	#$7FF,d0
		lsr.w	#5,d0
		neg.w	d0
		addi.w	#$20,d0	; " "
		bpl.s	loc_5B9A
		moveq	#0,d0

loc_5B9A:				; CODE XREF: ROM:00005B96j
		move.w	d0,d4
		move.w	d0,($FFFFF618).w
		move.w	(v_screenposx).w,d0
		cmpi.b	#4,($FFFFF600).w
		bne.s	loc_5BAE
		moveq	#0,d0

loc_5BAE:				; CODE XREF: ROM:00005BAAj
		neg.w	d0
		swap	d0
		lea	(v_bgscroll_buffer).w,a2
		addi.l	#$10000,(a2)+
		addi.l	#$C000,(a2)+
		addi.l	#$8000,(a2)+
		move.w	(v_bgscroll_buffer).w,d0
		add.w	($FFFFEE18).w,d0
		neg.w	d0
		move.w	#$1F,d1
		sub.w	d4,d1
		bcs.s	loc_5BE0

loc_5BDA:				; CODE XREF: ROM:00005BDCj
		move.l	d0,(a1)+
		dbf	d1,loc_5BDA

loc_5BE0:				; CODE XREF: ROM:00005BD8j
		move.w	(v_bgscroll_buffer+4).w,d0
		add.w	($FFFFEE18).w,d0
		neg.w	d0
		move.w	#$F,d1

loc_5BEE:				; CODE XREF: ROM:00005BF0j
		move.l	d0,(a1)+
		dbf	d1,loc_5BEE
		move.w	(v_bgscroll_buffer+8).w,d0
		add.w	($FFFFEE18).w,d0
		neg.w	d0
		move.w	#$F,d1

loc_5C02:				; CODE XREF: ROM:00005C04j
		move.l	d0,(a1)+
		dbf	d1,loc_5C02
		move.w	#$2F,d1	; "/"
		move.w	($FFFFEE18).w,d0
		neg.w	d0

loc_5C12:				; CODE XREF: ROM:00005C14j
		move.l	d0,(a1)+
		dbf	d1,loc_5C12
		move.w	#$27,d1	; """
		move.w	(v_bg2screenposx).w,d0
		neg.w	d0

loc_5C22:				; CODE XREF: ROM:00005C24j
		move.l	d0,(a1)+
		dbf	d1,loc_5C22
		move.w	(v_bg2screenposx).w,d0
		move.w	(v_screenposx).w,d2
		sub.w	d0,d2
		ext.l	d2
		asl.l	#8,d2
		divs.w	#$68,d2	; "h"
		ext.l	d2
		asl.l	#8,d2
		moveq	#0,d3
		move.w	d0,d3
		move.w	#$47,d1	; "G"
		add.w	d4,d1

loc_5C48:				; CODE XREF: ROM:00005C54j
		move.w	d3,d0
		neg.w	d0
		move.l	d0,(a1)+
		swap	d3
		add.l	d2,d3
		swap	d3
		dbf	d1,loc_5C48
		rts
; ---------------------------------------------------------------------------

loc_5C5A:				; CODE XREF: ROM:00005B5Cj
		move.w	($FFFFEEB0).w,d4
		ext.l	d4
		asl.l	#5,d4
		move.l	d4,d1
		asl.l	#1,d4
		add.l	d1,d4
		moveq	#0,d6
		bsr.w	ScrollBlock6
		move.w	($FFFFEEB0).w,d4
		ext.l	d4
		asl.l	#7,d4
		moveq	#0,d6
		bsr.w	ScrollBlock5
		lea	(v_hscrolltablebuffer).w,a1
		move.w	(v_screenposy).w,d0
		andi.w	#$7FF,d0
		lsr.w	#5,d0
		neg.w	d0
		addi.w	#$20,d0	; " "
		bpl.s	loc_5C94
		moveq	#0,d0

loc_5C94:				; CODE XREF: ROM:00005C90j
		andi.w	#$FFFE,d0
		move.w	d0,d4
		lsr.w	#1,d4
		move.w	d0,($FFFFF618).w
		andi.l	#$FFFEFFFE,($FFFFF616).w
		move.w	(v_screenposx).w,d0
		cmpi.b	#4,($FFFFF600).w
		bne.s	loc_5CB6
		moveq	#0,d0

loc_5CB6:				; CODE XREF: ROM:00005CB2j
		neg.w	d0
		swap	d0
		lea	(v_bgscroll_buffer).w,a2
		addi.l	#$10000,(a2)+
		addi.l	#$C000,(a2)+
		addi.l	#$8000,(a2)+
		move.w	(v_bgscroll_buffer).w,d0
		add.w	($FFFFEE18).w,d0
		neg.w	d0
		move.w	#$F,d1
		sub.w	d4,d1
		bcs.s	loc_5CE8

loc_5CE2:				; CODE XREF: ROM:00005CE4j
		move.l	d0,(a1)+
		dbf	d1,loc_5CE2

loc_5CE8:				; CODE XREF: ROM:00005CE0j
		move.w	(v_bgscroll_buffer+4).w,d0
		add.w	($FFFFEE18).w,d0
		neg.w	d0
		move.w	#7,d1

loc_5CF6:				; CODE XREF: ROM:00005CF8j
		move.l	d0,(a1)+
		dbf	d1,loc_5CF6
		move.w	(v_bgscroll_buffer+8).w,d0
		add.w	($FFFFEE18).w,d0
		neg.w	d0
		move.w	#7,d1

loc_5D0A:				; CODE XREF: ROM:00005D0Cj
		move.l	d0,(a1)+
		dbf	d1,loc_5D0A
		move.w	#$17,d1
		move.w	($FFFFEE18).w,d0
		neg.w	d0

loc_5D1A:				; CODE XREF: ROM:00005D1Cj
		move.l	d0,(a1)+
		dbf	d1,loc_5D1A
		move.w	#$17,d1
		move.w	(v_bg2screenposx).w,d0
		neg.w	d0

loc_5D2A:				; CODE XREF: ROM:00005D2Cj
		move.l	d0,(a1)+
		dbf	d1,loc_5D2A
		move.w	(v_bg2screenposx).w,d0
		move.w	(v_screenposx).w,d2
		sub.w	d0,d2
		ext.l	d2
		asl.l	#8,d2
		divs.w	#$68,d2	; "h"
		ext.l	d2
		asl.l	#8,d2
		add.l	d2,d2
		moveq	#0,d3
		move.w	d0,d3
		move.w	#$23,d1	; "#"
		add.w	d4,d1

loc_5D52:				; CODE XREF: ROM:00005D5Ej
		move.w	d3,d0
		neg.w	d0
		move.l	d0,(a1)+
		swap	d3
		add.l	d2,d3
		swap	d3
		dbf	d1,loc_5D52
		move.w	($FFFFEEB6).w,d4
		ext.l	d4
		asl.l	#5,d4
		move.l	d4,d1
		asl.l	#1,d4
		add.l	d1,d4
		add.l	d4,($FFFFEE38).w
		move.w	($FFFFEEB6).w,d4
		ext.l	d4
		asl.l	#7,d4
		add.l	d4,($FFFFEE30).w
		lea	($FFFFE1C0).w,a1
		move.w	($FFFFEE24).w,d0
		andi.w	#$7FF,d0
		lsr.w	#5,d0
		neg.w	d0
		addi.w	#$20,d0	; " "
		bpl.s	loc_5D98
		moveq	#0,d0

loc_5D98:				; CODE XREF: ROM:00005D94j
		andi.w	#$FFFE,d0
		move.w	d0,d4
		lsr.w	#1,d4
		move.w	d0,($FFFFF620).w
		subi.w	#$E0,($FFFFF620).w ; "а"
		move.w	($FFFFEE24).w,($FFFFF61E).w
		subi.w	#$E0,($FFFFF61E).w ; "а"
		andi.l	#$FFFEFFFE,($FFFFF61E).w
		move.w	($FFFFEE20).w,d0
		cmpi.b	#4,($FFFFF600).w
		bne.s	loc_5DCC
		moveq	#0,d0

loc_5DCC:				; CODE XREF: ROM:00005DC8j
		neg.w	d0
		swap	d0
		move.w	(v_bgscroll_buffer).w,d0
		add.w	($FFFFEE38).w,d0
		neg.w	d0
		move.w	#$F,d1
		sub.w	d4,d1
		bcs.s	loc_5DE8

loc_5DE2:				; CODE XREF: ROM:00005DE4j
		move.l	d0,(a1)+
		dbf	d1,loc_5DE2

loc_5DE8:				; CODE XREF: ROM:00005DE0j
		move.w	(v_bgscroll_buffer+4).w,d0
		add.w	($FFFFEE38).w,d0
		neg.w	d0
		move.w	#7,d1

loc_5DF6:				; CODE XREF: ROM:00005DF8j
		move.l	d0,(a1)+
		dbf	d1,loc_5DF6
		move.w	(v_bgscroll_buffer+8).w,d0
		add.w	($FFFFEE38).w,d0
		neg.w	d0
		move.w	#7,d1

loc_5E0A:				; CODE XREF: ROM:00005E0Cj
		move.l	d0,(a1)+
		dbf	d1,loc_5E0A
		move.w	#$17,d1
		move.w	($FFFFEE38).w,d0
		neg.w	d0

loc_5E1A:				; CODE XREF: ROM:00005E1Cj
		move.l	d0,(a1)+
		dbf	d1,loc_5E1A
		move.w	#$17,d1
		move.w	($FFFFEE30).w,d0
		neg.w	d0

loc_5E2A:				; CODE XREF: ROM:00005E2Cj
		move.l	d0,(a1)+
		dbf	d1,loc_5E2A
		move.w	($FFFFEE30).w,d0
		move.w	($FFFFEE20).w,d2
		sub.w	d0,d2
		ext.l	d2
		asl.l	#8,d2
		divs.w	#$68,d2	; "h"
		ext.l	d2
		asl.l	#8,d2
		add.l	d2,d2
		moveq	#0,d3
		move.w	d0,d3
		move.w	#$23,d1	; "#"
		add.w	d4,d1

loc_5E52:				; CODE XREF: ROM:00005E5Ej
		move.w	d3,d0
		neg.w	d0
		move.l	d0,(a1)+
		swap	d3
		add.l	d2,d3
		swap	d3
		dbf	d1,loc_5E52
		rts
; ---------------------------------------------------------------------------

Deform_LZ:				; DATA XREF: ROM:Deform_Indexo
		move.w	($FFFFEEB0).w,d4
		ext.l	d4
		asl.l	#7,d4
		move.w	($FFFFEEB2).w,d5
		ext.l	d5
		asl.l	#7,d5
		bsr.w	ScrollBlock1
		move.w	(v_bgscreenposy).w,($FFFFF618).w
		lea	(Deform_LZ_Data1).l,a3
		lea	(Obj0A_WobbleData).l,a2
		move.b	($FFFFF7D8).w,d2
		move.b	d2,d3
		addi.w	#$80,($FFFFF7D8).w ; "Ђ"
		add.w	(v_bgscreenposy).w,d2
		andi.w	#$FF,d2
		add.w	(v_screenposy).w,d3
		andi.w	#$FF,d3
		lea	(v_hscrolltablebuffer).w,a1
		move.w	#$DF,d1	; "Я"
		move.w	(v_screenposx).w,d0
		neg.w	d0
		move.w	d0,d6
		swap	d0
		move.w	(v_bgscreenposx).w,d0
		neg.w	d0
		move.w	($FFFFF646).w,d4
		move.w	(v_screenposy).w,d5

loc_5EC6:				; CODE XREF: ROM:00005ED2j
		cmp.w	d4,d5
		bge.s	loc_5ED8
		move.l	d0,(a1)+
		addq.w	#1,d5
		addq.b	#1,d2
		addq.b	#1,d3
		dbf	d1,loc_5EC6
		rts
; ---------------------------------------------------------------------------

loc_5ED8:				; CODE XREF: ROM:00005EC8j
					; ROM:00005EF0j
		move.b	(a3,d3.w),d4
		ext.w	d4
		add.w	d6,d4
		move.w	d4,(a1)+
		move.b	(a2,d2.w),d4
		ext.w	d4
		add.w	d0,d4
		move.w	d4,(a1)+
		addq.b	#1,d2
		addq.b	#1,d3
		dbf	d1,loc_5ED8
		rts
; ---------------------------------------------------------------------------
Deform_LZ_Data1:dc.b   1,  1,  2,  2,  3,  3,  3,  3,  2,  2,  1,  1,  0,  0,  0,  0; 0
					; DATA XREF: ROM:00005E7Eo
		dc.b   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0; 16
		dc.b   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0; 32
		dc.b   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0; 48
		dc.b   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0; 64
		dc.b   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0; 80
		dc.b   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0; 96
		dc.b   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0; 112
		dc.b $FF,$FF,$FE,$FE,$FD,$FD,$FD,$FD,$FE,$FE,$FF,$FF,  0,  0,  0,  0; 128
		dc.b   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0; 144
		dc.b   1,  1,  2,  2,  3,  3,  3,  3,  2,  2,  1,  1,  0,  0,  0,  0; 160
		dc.b   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0; 176
		dc.b   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0; 192
		dc.b   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0; 208
		dc.b   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0; 224
		dc.b   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0; 240
; ---------------------------------------------------------------------------

Deform_MZ:				; DATA XREF: ROM:Deform_Indexo
		move.w	($FFFFEEB0).w,d4
		ext.l	d4
		asl.l	#6,d4
		move.l	d4,d1
		asl.l	#1,d4
		add.l	d1,d4
		moveq	#2,d6
		bsr.w	ScrollBlock4
		move.w	($FFFFEEB0).w,d4
		ext.l	d4
		asl.l	#6,d4
		moveq	#6,d6
		bsr.w	ScrollBlock6
		move.w	($FFFFEEB0).w,d4
		ext.l	d4
		asl.l	#7,d4
		moveq	#4,d6
		bsr.w	ScrollBlock5
		move.w	#$200,d0
		move.w	(v_screenposy).w,d1
		subi.w	#$1C8,d1
		bcs.s	loc_6590
		move.w	d1,d2
		add.w	d1,d1
		add.w	d2,d1
		asr.w	#2,d1
		add.w	d1,d0
loc_6590:
		move.w	d0,(v_bg2screenposy).w
		move.w	d0,(v_bg3screenposy).w
		bsr.w	ScrollBlock3
		move.w	(v_bgscreenposy).w,($FFFFF618).w
		move.b	($FFFFEE52).w,d0
		or.b	($FFFFEE54).w,d0
		or.b	d0,($FFFFEE56).w
		clr.b	($FFFFEE52).w
		clr.b	($FFFFEE54).w
		lea	(v_bgscroll_buffer).w,a1
		move.w	(v_screenposx).w,d2
		neg.w	d2
		move.w	d2,d0
		asr.w	#2,d0
		sub.w	d2,d0
		ext.l	d0
		asl.l	#3,d0
		divs.w	#5,d0
		ext.l	d0
		asl.l	#4,d0
		asl.l	#8,d0
		moveq	#0,d3
		move.w	d2,d3
		asr.w	#1,d3
		move.w	#4,d1
loc_65DE:		
		move.w	d3,(a1)+
		swap	d3
		add.l	d0,d3
		swap	d3
		dbf	d1,loc_65DE
		move.w	(v_bg3screenposx).w,d0
		neg.w	d0
		move.w	#1,d1
loc_65F4:		
		move.w	d0,(a1)+
		dbf	d1,loc_65F4
		move.w	(v_bg2screenposx).w,d0
		neg.w	d0
		move.w	#8,d1
loc_6604:		
		move.w	d0,(a1)+
		dbf	d1,loc_6604
		move.w	(v_bgscreenposx).w,d0
		neg.w	d0
		move.w	#$F,d1
locS1_6614:		
		move.w	d0,(a1)+
		dbf	d1,locS1_6614
		lea	(v_bgscroll_buffer).w,a2
		move.w	(v_bgscreenposy).w,d0
		subi.w	#$200,d0
		move.w	d0,d2
		cmpi.w	#$100,d0
		bcs.s	loc_6632
		move.w	#$100,d0
loc_6632:
		andi.w	#$1F0,d0
		lsr.w	#3,d0
		lea	(a2,d0),a2
		bra.w	Bg_Scroll_X
; ---------------------------------------------------------------------------

Deform_EHZ:				; DATA XREF: ROM:Deform_Indexo
	; vertical scrolling
		move.w	($FFFFEEB2).w,d5
		ext.l	d5
		asl.l	#7,d5
		bsr.w	ScrollBlock2
		move.w	(v_bgscreenposy).w,($FFFFF618).w
	; calculate background scroll buffer
		lea	(v_bgscroll_buffer).w,a1
		move.w	(v_screenposx).w,d2
		neg.w	d2
		move.w	d2,d0
		asr.w	#3,d0
		sub.w	d2,d0
		ext.l	d0
		asl.l	#4,d0
		divs.w	#$1C,d0
		ext.l	d0
		asl.l	#4,d0
		asl.l	#8,d0
		moveq	#0,d3
		move.w	d2,d3
		move.w	#$1B,d1
	@starLoop:		
		move.w	d3,(a1)+
		swap	d3
		add.l	d0,d3
		swap	d3
		dbf	d1,@starLoop

		move.w	d2,d0
		asr.w	#3,d0
		move.w	d0,d1
		asr.w	#1,d1
		add.w	d1,d0
		move.w	#4,d1
	@buildingLoop1:		; distant black buildings
		move.w	d0,(a1)+
		dbf	d1,@buildingLoop1

		move.w	d2,d0
		asr.w	#2,d0
		move.w	#4,d1
	@buildingLoop2:		; closer buildings
		move.w	d0,(a1)+
		dbf	d1,@buildingLoop2

		move.w	d2,d0
		asr.w	#1,d0
		move.w	#$1D,d1
	@bottomLoop:		; bottom part of background
		move.w	d0,(a1)+
		dbf	d1,@bottomLoop

		lea	(v_bgscroll_buffer).w,a2
		move.w	(v_bgscreenposy).w,d0
		move.w	d0,d2
		subi.w	#$C0,d0
		andi.w	#$3F0,d0
		lsr.w	#3,d0
		lea	(a2,d0.w),a2
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
Bg_Scroll_X:
		lea	(v_hscrolltablebuffer).w,a1
		move.w	#$E,d1
		move.w	(v_screenposx).w,d0
		neg.w	d0
		swap	d0
		andi.w	#$F,d2
		add.w	d2,d2
		move.w	(a2)+,d0
		jmp	@pixelJump(pc,d2.w)		; skip pixels for first row
	@blockLoop:
		move.w	(a2)+,d0
	@pixelJump:		
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		dbf	d1,@blockLoop
		rts
; End of function Deform_EHZ

; ---------------------------------------------------------------------------
Deform_EHZ_Data:dc.b   1,  2,  1,  3,  1,  2,  2,  1,  2,  3,  1,  2,  1,  2,  0,  0; 0
					; DATA XREF: Deform_TitleScreen+74o
					; sub_6264+28t
		dc.b   2,  0,  3,  2,  2,  3,  2,  2,  1,  3,  0,  0,  1,  0,  1,  3; 16
		dc.b   1,  2,  1,  3,  1,  2,  2,  1,  2,  3,  1,  2,  1,  2,  0,  0; 32
		dc.b   2,  0,  3,  2,  2,  3,  2,  2,  1,  3,  0,  0,  1,  0,  1,  3; 48
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR Deform_TitleScreen

loc_620E:				; CODE XREF: Deform_TitleScreen+28j
		move.b	($FFFFFE0F).w,d1
		andi.w	#7,d1
		bne.s	loc_621C
		subq.w	#1,(v_bgscroll_buffer).w

loc_621C:				; CODE XREF: Deform_TitleScreen+172j
		move.w	(v_bgscreenposy).w,($FFFFF618).w
		andi.l	#$FFFEFFFE,($FFFFF616).w
		lea	(v_hscrolltablebuffer).w,a1
		move.w	(v_screenposx).w,d0
		move.w	#$A,d1
		bsr.s	sub_6264
		moveq	#0,d0
		move.w	d0,($FFFFF620).w
		subi.w	#$E0,($FFFFF620).w ; "а"
		move.w	($FFFFEE24).w,($FFFFF61E).w

loc_624A:
		subi.w	#$E0,($FFFFF61E).w ; "а"
		andi.l	#$FFFEFFFE,($FFFFF61E).w
		lea	($FFFFE1B0).w,a1
		move.w	($FFFFEE20).w,d0
		move.w	#$E,d1
; END OF FUNCTION CHUNK	FOR Deform_TitleScreen

; ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ S U B	R O U T	I N E ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ


sub_6264:				; CODE XREF: Deform_TitleScreen+192p
		neg.w	d0
		move.w	d0,d2
		swap	d0
		move.w	#0,d0

loc_626E:				; CODE XREF: sub_6264+Cj
		move.l	d0,(a1)+
		dbf	d1,loc_626E
		move.w	d2,d0
		asr.w	#6,d0
		move.w	#$1C,d1

loc_627C:				; CODE XREF: sub_6264+1Aj
		move.l	d0,(a1)+
		dbf	d1,loc_627C
		move.w	d0,d3
		move.w	(v_bgscroll_buffer).w,d1
		andi.w	#$1F,d1
		lea	Deform_EHZ_Data(pc),a2
		lea	(a2,d1.w),a2
		move.w	#$A,d1

loc_6298:				; CODE XREF: sub_6264+3Cj
		move.b	(a2)+,d0
		ext.w	d0
		add.w	d3,d0
		move.l	d0,(a1)+
		dbf	d1,loc_6298
		move.w	#0,d0
		move.w	#4,d1

loc_62AC:				; CODE XREF: sub_6264+4Aj
		move.l	d0,(a1)+
		dbf	d1,loc_62AC
		move.w	d2,d0
		asr.w	#4,d0
		move.w	#7,d1

loc_62BA:				; CODE XREF: sub_6264+58j
		move.l	d0,(a1)+
		dbf	d1,loc_62BA
		move.w	d2,d0
		asr.w	#4,d0
		move.w	d0,d1
		asr.w	#1,d1
		add.w	d1,d0
		move.w	#7,d1

loc_62CE:				; CODE XREF: sub_6264+6Cj
		move.l	d0,(a1)+
		dbf	d1,loc_62CE
		move.w	d2,d0
		asr.w	#1,d0
		move.w	d2,d1
		asr.w	#3,d1
		sub.w	d1,d0
		ext.l	d0
		asl.l	#4,d0
		divs.w	#$30,d0	; "0"
		ext.l	d0
		asl.l	#4,d0
		asl.l	#8,d0
		moveq	#0,d3
		move.w	d2,d3
		asr.w	#3,d3
		move.w	#$27,d1	; """

loc_62F6:				; CODE XREF: sub_6264+9Cj
		move.w	d2,(a1)+
		move.w	d3,(a1)+
		swap	d3
		add.l	d0,d3
		swap	d3
		dbf	d1,loc_62F6
		rts
; End of function sub_6264

; ---------------------------------------------------------------------------

loc_6306:				; CODE XREF: ROM:000060A0j
					; ROM:0000640Cj
		lea	(v_hscrolltablebuffer).w,a1
		move.w	#$E,d1
		move.w	(v_screenposx).w,d0
		neg.w	d0
		swap	d0
		andi.w	#$F,d2
		add.w	d2,d2
		move.w	(a2)+,d0
		jmp	loc_6324(pc,d2.w)
; ---------------------------------------------------------------------------

loc_6322:				; CODE XREF: ROM:00006344j
		move.w	(a2)+,d0

loc_6324:
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		dbf	d1,loc_6322
		rts
; ---------------------------------------------------------------------------

Deform_HPZ:				; DATA XREF: ROM:Deform_Indexo
		move.w	($FFFFEEB0).w,d4
		ext.l	d4
		asl.l	#6,d4
		moveq	#2,d6
		bsr.w	ScrollBlock4
		move.w	($FFFFEEB2).w,d5
		ext.l	d5
		asl.l	#7,d5
		moveq	#6,d6
		bsr.w	ScrollBlock2
		move.w	(v_bgscreenposy).w,($FFFFF618).w
		lea	(v_bgscroll_buffer).w,a1
		move.w	(v_screenposx).w,d2
		neg.w	d2
		move.w	d2,d0
		asr.w	#1,d0
		move.w	#7,d1

loc_637E:				; CODE XREF: ROM:00006380j
		move.w	d0,(a1)+
		dbf	d1,loc_637E
		move.w	d2,d0
		asr.w	#3,d0
		sub.w	d2,d0
		ext.l	d0
		asl.l	#3,d0
		divs.w	#8,d0
		ext.l	d0
		asl.l	#4,d0
		asl.l	#8,d0
		moveq	#0,d3
		move.w	d2,d3
		asr.w	#1,d3
		lea	(v_bgscroll_buffer+$60).w,a2
		swap	d3
		add.l	d0,d3
		swap	d3
		move.w	d3,(a1)+
		move.w	d3,(a1)+
		move.w	d3,(a1)+
		move.w	d3,-(a2)
		move.w	d3,-(a2)
		move.w	d3,-(a2)
		swap	d3
		add.l	d0,d3
		swap	d3
		move.w	d3,(a1)+
		move.w	d3,(a1)+
		move.w	d3,-(a2)
		move.w	d3,-(a2)
		swap	d3
		add.l	d0,d3
		swap	d3
		move.w	d3,(a1)+
		move.w	d3,-(a2)
		swap	d3
		add.l	d0,d3
		swap	d3
		move.w	d3,(a1)+
		move.w	d3,-(a2)
		move.w	(v_bgscreenposx).w,d0
		neg.w	d0
		move.w	#$19,d1

loc_63E0:				; CODE XREF: ROM:000063E2j
		move.w	d0,(a1)+
		dbf	d1,loc_63E0
		adda.w	#$E,a1
		move.w	d2,d0
		asr.w	#1,d0
		move.w	#$17,d1

loc_63F2:				; CODE XREF: ROM:000063F4j
		move.w	d0,(a1)+
		dbf	d1,loc_63F2
		lea	(v_bgscroll_buffer).w,a2
		move.w	(v_bgscreenposy).w,d0
		move.w	d0,d2
		andi.w	#$3F0,d0
		lsr.w	#3,d0
		lea	(a2,d0.w),a2
		bra.w	loc_6306
; ---------------------------------------------------------------------------

Deform_HTZ:				; DATA XREF: ROM:Deform_Indexo
Deform_SBZ:
		tst.b	(v_act).w
		bne.w	Bg_Scroll_SBz_2
		move.w	($FFFFEEB0).w,d4
		ext.l	d4
		asl.l	#7,d4
		moveq	#2,d6
		bsr.w	ScrollBlock4
		move.w	($FFFFEEB0).w,d4
		ext.l	d4
		asl.l	#6,d4
		moveq	#6,d6
		bsr.w	ScrollBlock6
		move.w	($FFFFEEB0).w,d4
		ext.l	d4
		asl.l	#5,d4
		move.l	d4,d1
		asl.l	#1,d4
		add.l	d1,d4
		moveq	#4,d6
		bsr.w	ScrollBlock5
		moveq	#0,d4
		move.w	($FFFFF73C).w,d5
		ext.l	d5
		asl.l	#5,d5
		bsr.w	loc_66EA
		move.w	(v_bgscreenposy).w,d0
		move.w	d0,(v_bg2screenposy).w
		move.w	d0,(v_bg3screenposy).w
		move.w	d0,($FFFFF618).w
		move.b	($FFFFEE52).w,d0
		or.b	($FFFFEE56).w,d0
		or.b	d0,($FFFFEE54).w
		clr.b	($FFFFEE52).w
		clr.b	($FFFFEE56).w
		lea	($FFFFA800).w,a1
		move.w	(v_screenposx).w,d2
		neg.w	d2
		asr.w	#2,d2
		move.w	d2,d0
		asr.w	#1,d0
		sub.w	d2,d0
		ext.l	d0
		asl.l	#3,d0
		divs.w	#4,d0
		ext.l	d0
		asl.l	#4,d0
		asl.l	#8,d0
		moveq	#0,d3
		move.w	d2,d3
		move.w	#3,d1
loc_684E:		
		move.w	d3,(a1)+
		swap	d3
		add.l	d0,d3
		swap	d3
		dbf	d1,loc_684E
		move.w	(v_bg3screenposx).w,d0
		neg.w	d0
		move.w	#9,d1
loc_6864:		
		move.w	d0,(a1)+
		dbf	d1,loc_6864
		move.w	(v_bg2screenposx).w,d0
		neg.w	d0
		move.w	#6,d1
loc_6874:		
		move.w	d0,(a1)+
		dbf	d1,loc_6874
		move.w	(v_bgscreenposx).w,d0
		neg.w	d0
		move.w	#$A,d1
loc_6884:		
		move.w	d0,(a1)+
		dbf	d1,loc_6884
		lea	($FFFFA800).w,a2
		move.w	(v_bgscreenposy).w,d0
		move.w	d0,d2
		andi.w	#$1F0,d0
		lsr.w	#3,d0
		lea	(a2,d0),a2
		bra.w	Bg_Scroll_X
;-------------------------------------------------------------------------------
Bg_Scroll_SBz_2:;loc_68A2:
		move.w	($FFFFEEB0).w,d4
		ext.l	d4		
		asl.l	#6,d4
		move.w	($FFFFF73C).w,d5
		ext.l	d5
		asl.l	#5,d5
		bsr.w	ScrollBlock1
		move.w	(v_bgscreenposy).w,($FFFFF618).w
		lea	(v_hscrolltablebuffer).w,a1
		move.w	#223,d1
		move.w	(v_screenposx).w,d0
		neg.w	d0
		swap	d0
		move.w	(v_bgscreenposx).w,d0
		neg.w	d0
loc_68D2:		
		move.l	d0,(a1)+
		dbf	d1,loc_68D2
		rts
; End of function Deform_SBZ

; ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ S U B	R O U T	I N E ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ


ScrollHorizontal:			; CODE XREF: DeformBGLayer+44p
					; DeformBGLayer+7Ap
		move.w	(a1),d4
		bsr.s	sub_6514
		move.w	(a1),d0
		andi.w	#$10,d0
		move.b	(a2),d1
		eor.b	d1,d0
		bne.s	locret_6512
		eori.b	#$10,(a2)
		move.w	(a1),d0
		sub.w	d4,d0
		bpl.s	loc_650E
		bset	#2,(a3)
		rts
; ---------------------------------------------------------------------------

loc_650E:				; CODE XREF: ScrollHorizontal+18j
		bset	#3,(a3)

locret_6512:				; CODE XREF: ScrollHorizontal+Ej
		rts
; End of function ScrollHorizontal


; ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ S U B	R O U T	I N E ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ


sub_6514:				; CODE XREF: ScrollHorizontal+2p
		move.w	(a5),d1
		beq.s	loc_6536
		subi.w	#$100,d1
		move.w	d1,(a5)
		moveq	#0,d1
		move.b	(a5),d1
		lsl.b	#2,d1
		addq.b	#4,d1
		move.w	2(a5),d0
		sub.b	d1,d0
		move.w	(a6,d0.w),d0
		andi.w	#$3FFF,d0
		bra.s	loc_653A
; ---------------------------------------------------------------------------

loc_6536:				; CODE XREF: sub_6514+2j
		move.w	8(a0),d0

loc_653A:				; CODE XREF: sub_6514+20j
		sub.w	(a1),d0
		subi.w	#$90,d0	; "ђ"
		blt.s	loc_654C
		subi.w	#$10,d0
		bge.s	loc_6564
		clr.w	(a4)
		rts
; ---------------------------------------------------------------------------

loc_654C:				; CODE XREF: sub_6514+2Cj
		cmpi.w	#$FFF0,d0
		bgt.s	loc_6556
		move.w	#$FFF0,d0

loc_6556:				; CODE XREF: sub_6514+3Cj
		add.w	(a1),d0
		cmp.w	($FFFFEEC8).w,d0
		bgt.s	loc_657A
		move.w	($FFFFEEC8).w,d0
		bra.s	loc_657A
; ---------------------------------------------------------------------------

loc_6564:				; CODE XREF: sub_6514+32j
		cmpi.w	#$10,d0
		bcs.s	loc_656E
		move.w	#$10,d0

loc_656E:				; CODE XREF: sub_6514+54j
		add.w	(a1),d0
		cmp.w	($FFFFEECA).w,d0
		blt.s	loc_657A
		move.w	($FFFFEECA).w,d0

loc_657A:				; CODE XREF: sub_6514+48j sub_6514+4Ej ...
		move.w	d0,d1
		sub.w	(a1),d1
		asl.w	#8,d1
		move.w	d0,(a1)
		move.w	d1,(a4)
		rts
; End of function sub_6514


; ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ S U B	R O U T	I N E ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ


ScrollVertical:				; CODE XREF: DeformBGLayer+54p
					; DeformBGLayer+8Ap
		moveq	#0,d1
		move.w	$C(a0),d0
		sub.w	(a1),d0
		btst	#2,$22(a0)
		beq.s	loc_6598
		subq.w	#5,d0

loc_6598:				; CODE XREF: ScrollVertical+Ej
		btst	#1,$22(a0)
		beq.s	loc_65B8
		addi.w	#$20,d0	; " "
		sub.w	($FFFFEED8).w,d0
		bcs.s	loc_6602
		subi.w	#$40,d0	; "@"
		bcc.s	loc_6602
		tst.b	($FFFFEEDE).w
		bne.s	loc_6614
		bra.s	loc_65C4
; ---------------------------------------------------------------------------

loc_65B8:				; CODE XREF: ScrollVertical+18j
		sub.w	($FFFFEED8).w,d0
		bne.s	loc_65C8
		tst.b	($FFFFEEDE).w
		bne.s	loc_6614

loc_65C4:				; CODE XREF: ScrollVertical+30j
		clr.w	(a4)
		rts
; ---------------------------------------------------------------------------

loc_65C8:				; CODE XREF: ScrollVertical+36j
		cmpi.w	#$60,($FFFFEED8).w ; "`"
		bne.s	loc_65F0
		move.w	$14(a0),d1
		bpl.s	loc_65D8
		neg.w	d1

loc_65D8:				; CODE XREF: ScrollVertical+4Ej
		cmpi.w	#$800,d1
		bcc.s	loc_6602
		move.w	#$600,d1
		cmpi.w	#6,d0
		bgt.s	loc_665C
		cmpi.w	#$FFFA,d0
		blt.s	loc_662A
		bra.s	loc_661A
; ---------------------------------------------------------------------------

loc_65F0:				; CODE XREF: ScrollVertical+48j
		move.w	#$200,d1
		cmpi.w	#2,d0
		bgt.s	loc_665C
		cmpi.w	#$FFFE,d0
		blt.s	loc_662A
		bra.s	loc_661A
; ---------------------------------------------------------------------------

loc_6602:				; CODE XREF: ScrollVertical+22j
					; ScrollVertical+28j ...
		move.w	#$1000,d1
		cmpi.w	#$10,d0
		bgt.s	loc_665C
		cmpi.w	#$FFF0,d0
		blt.s	loc_662A
		bra.s	loc_661A
; ---------------------------------------------------------------------------

loc_6614:				; CODE XREF: ScrollVertical+2Ej
					; ScrollVertical+3Cj
		moveq	#0,d0
		move.b	d0,($FFFFEEDE).w

loc_661A:				; CODE XREF: ScrollVertical+68j
					; ScrollVertical+7Aj ...
		moveq	#0,d1
		move.w	d0,d1
		add.w	(a1),d1
		tst.w	d0
		bpl.w	loc_6664
		bra.w	loc_6634
; ---------------------------------------------------------------------------

loc_662A:				; CODE XREF: ScrollVertical+66j
					; ScrollVertical+78j ...
		neg.w	d1
		ext.l	d1
		asl.l	#8,d1
		add.l	(a1),d1
		swap	d1

loc_6634:				; CODE XREF: ScrollVertical+A0j
		cmp.w	($FFFFEECC).w,d1
		bgt.s	loc_6686
		cmpi.w	#$FF00,d1
		bgt.s	loc_6656
		andi.w	#$7FF,d1
		andi.w	#$7FF,$C(a0)
		andi.w	#$7FF,(a1)
		andi.w	#$3FF,8(a1)
		bra.s	loc_6686
; ---------------------------------------------------------------------------

loc_6656:				; CODE XREF: ScrollVertical+B8j
		move.w	($FFFFEECC).w,d1
		bra.s	loc_6686
; ---------------------------------------------------------------------------

loc_665C:				; CODE XREF: ScrollVertical+60j
					; ScrollVertical+72j ...
		ext.l	d1
		asl.l	#8,d1
		add.l	(a1),d1
		swap	d1

loc_6664:				; CODE XREF: ScrollVertical+9Cj
		cmp.w	($FFFFEECE).w,d1
		blt.s	loc_6686
		subi.w	#$800,d1
		bcs.s	loc_6682
		andi.w	#$7FF,$C(a0)
		subi.w	#$800,(a1)
		andi.w	#$3FF,8(a1)
		bra.s	loc_6686
; ---------------------------------------------------------------------------

loc_6682:				; CODE XREF: ScrollVertical+E8j
		move.w	($FFFFEECE).w,d1

loc_6686:				; CODE XREF: ScrollVertical+B2j
					; ScrollVertical+CEj ...
		move.w	(a1),d4
		swap	d1
		move.l	d1,d3
		sub.l	(a1),d3
		ror.l	#8,d3
		move.w	d3,(a4)
		move.l	d1,(a1)
		move.w	(a1),d0
		andi.w	#$10,d0
		move.b	(a2),d1
		eor.b	d1,d0
		bne.s	locret_66B4
		eori.b	#$10,(a2)
		move.w	(a1),d0
		sub.w	d4,d0
		bpl.s	loc_66B0
		bset	#0,(a3)
		rts
; ---------------------------------------------------------------------------

loc_66B0:				; CODE XREF: ScrollVertical+122j
		bset	#1,(a3)

locret_66B4:				; CODE XREF: ScrollVertical+118j
		rts
; End of function ScrollVertical


; ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ S U B	R O U T	I N E ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ


ScrollBlock1:				; CODE XREF: ROM:00005E74p
					; ROM:00006006p ...
		move.l	(v_bgscreenposx).w,d2
		move.l	d2,d0
		add.l	d4,d0
		move.l	d0,(v_bgscreenposx).w
		move.l	d0,d1
		swap	d1
		andi.w	#$10,d1
		move.b	(v_bg1_xblock).w,d3
		eor.b	d3,d1
		bne.s	loc_66EA
		eori.b	#$10,(v_bg1_xblock).w
		sub.l	d2,d0
		bpl.s	loc_66E4
		bset	#2,($FFFFEE52).w
		bra.s	loc_66EA
; ---------------------------------------------------------------------------

loc_66E4:				; CODE XREF: ScrollBlock1+24j
		bset	#3,($FFFFEE52).w

loc_66EA:				; CODE XREF: ScrollBlock1+1Aj
					; ScrollBlock1+2Cj
		move.l	(v_bgscreenposy).w,d3
		move.l	d3,d0
		add.l	d5,d0
		move.l	d0,(v_bgscreenposy).w
		move.l	d0,d1
		swap	d1
		andi.w	#$10,d1
		move.b	(v_bg2_xblock).w,d2
		eor.b	d2,d1
		bne.s	locret_671E
		eori.b	#$10,(v_bg2_xblock).w
		sub.l	d3,d0
		bpl.s	loc_6718
		bset	#0,($FFFFEE52).w
		rts
; ---------------------------------------------------------------------------

loc_6718:				; CODE XREF: ScrollBlock1+58j
		bset	#1,($FFFFEE52).w

locret_671E:				; CODE XREF: ScrollBlock1+4Ej
		rts
; End of function ScrollBlock1


; ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ S U B	R O U T	I N E ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ


ScrollBlock2:				; CODE XREF: ROM:00006362p
		move.l	(v_bgscreenposy).w,d3
		move.l	d3,d0
		add.l	d5,d0
		move.l	d0,(v_bgscreenposy).w
		move.l	d0,d1
		swap	d1
		andi.w	#$10,d1
		move.b	(v_bg2_xblock).w,d2
		eor.b	d2,d1
		bne.s	locret_6752
		eori.b	#$10,(v_bg2_xblock).w
		sub.l	d3,d0
		bpl.s	loc_674C
		bset	d6,($FFFFEE52).w
		rts
; ---------------------------------------------------------------------------

loc_674C:				; CODE XREF: ScrollBlock2+24j
		addq.b	#1,d6
		bset	d6,($FFFFEE52).w

locret_6752:				; CODE XREF: ScrollBlock2+1Aj
		rts
; End of function ScrollBlock2

; ---------------------------------------------------------------------------

ScrollBlock3:
		move.w	(v_bgscreenposy).w,d3
		move.w	d0,(v_bgscreenposy).w
		move.w	d0,d1
		andi.w	#$10,d1
		move.b	(v_bg2_xblock).w,d2
		eor.b	d2,d1
		bne.s	locret_6782
		eori.b	#$10,(v_bg2_xblock).w
		sub.w	d3,d0
		bpl.s	loc_677C
		bset	#0,($FFFFEE52).w
		rts
; ---------------------------------------------------------------------------

loc_677C:				; CODE XREF: ROM:00006772j
		bset	#1,($FFFFEE52).w

locret_6782:				; CODE XREF: ROM:00006768j
		rts

; ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ S U B	R O U T	I N E ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ


ScrollBlock4:				; CODE XREF: ROM:00006354p
		move.l	(v_bgscreenposx).w,d2
		move.l	d2,d0
		add.l	d4,d0
		move.l	d0,(v_bgscreenposx).w
		move.l	d0,d1
		swap	d1
		andi.w	#$10,d1
		move.b	(v_bg1_xblock).w,d3
		eor.b	d3,d1
		bne.s	locret_67B6
		eori.b	#$10,(v_bg1_xblock).w
		sub.l	d2,d0
		bpl.s	loc_67B0
		bset	d6,($FFFFEE52).w
		bra.s	locret_67B6
; ---------------------------------------------------------------------------

loc_67B0:				; CODE XREF: ScrollBlock4+24j
		addq.b	#1,d6
		bset	d6,($FFFFEE52).w

locret_67B6:				; CODE XREF: ScrollBlock4+1Aj
					; ScrollBlock4+2Aj
		rts
; End of function ScrollBlock4


; ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ S U B	R O U T	I N E ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ


ScrollBlock5:				; CODE XREF: ROM:00005B7Ep
					; ROM:00005C78p ...
		move.l	(v_bg2screenposx).w,d2
		move.l	d2,d0
		add.l	d4,d0
		move.l	d0,(v_bg2screenposx).w
		move.l	d0,d1
		swap	d1
		andi.w	#$10,d1
		move.b	(v_bg3_xblock).w,d3
		eor.b	d3,d1
		bne.s	locret_67EA
		eori.b	#$10,(v_bg3_xblock).w
		sub.l	d2,d0
		bpl.s	loc_67E4
		bset	d6,($FFFFEE54).w
		bra.s	locret_67EA
; ---------------------------------------------------------------------------

loc_67E4:				; CODE XREF: ScrollBlock5+24j
		addq.b	#1,d6
		bset	d6,($FFFFEE54).w

locret_67EA:				; CODE XREF: ScrollBlock5+1Aj
					; ScrollBlock5+2Aj
		rts
; End of function ScrollBlock5


; ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ S U B	R O U T	I N E ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ


ScrollBlock6:				; CODE XREF: ROM:00005B70p
					; ROM:00005C6Ap
		move.l	($FFFFEE18).w,d2
		move.l	d2,d0
		add.l	d4,d0
		move.l	d0,($FFFFEE18).w
		move.l	d0,d1
		swap	d1
		andi.w	#$10,d1
		move.b	(v_bg4_xblock).w,d3
		eor.b	d3,d1
		bne.s	locret_681E
		eori.b	#$10,(v_bg4_xblock).w
		sub.l	d2,d0
		bpl.s	loc_6818
		bset	d6,($FFFFEE56).w
		bra.s	locret_681E
; ---------------------------------------------------------------------------

loc_6818:				; CODE XREF: ScrollBlock6+24j
		addq.b	#1,d6
		bset	d6,($FFFFEE56).w

locret_681E:				; CODE XREF: ScrollBlock6+1Aj
					; ScrollBlock6+2Aj
		rts
; End of function ScrollBlock6