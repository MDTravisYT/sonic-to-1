; ллллллллллллллл S U B	R O U T	I N E ллллллллллллллллллллллллллллллллллллллл


LevelSizeLoad:				; CODE XREF: ROM:00003D30p
		clr.w	($FFFFEE50).w
		clr.w	($FFFFEE52).w
		clr.w	($FFFFEE54).w
		clr.w	($FFFFEE56).w
		clr.w	($FFFFEE58).w
		clr.w	($FFFFEE5A).w
		clr.w	($FFFFEE5C).w
		clr.w	($FFFFEE5E).w
		clr.w	($FFFFEEA0).w
		clr.w	($FFFFEEA2).w
		clr.w	($FFFFEEA4).w
		clr.w	($FFFFEEA6).w
		clr.w	($FFFFEEA8).w
		clr.w	($FFFFEEAA).w
		clr.w	($FFFFEEAC).w
		clr.w	($FFFFEEAE).w
		clr.b	($FFFFEEDC).w
		moveq	#0,d0
		move.b	d0,($FFFFEEDF).w
		move.w	(v_zone).w,d0
		lsl.b	#6,d0
		lsr.w	#3,d0
		lea	LevelSizeArray(pc,d0.w),a0
		move.l	(a0)+,d0
		move.l	d0,($FFFFEEC8).w
		move.l	d0,($FFFFEEC0).w
		move.l	(a0)+,d0
		move.l	d0,($FFFFEECC).w
		move.l	d0,($FFFFEEC4).w
		move.w	#$1010,(v_fg_horiz_rd_flags).w
		move.w	#$60,($FFFFEED8).w ; "`"
		bra.w	LevelSize_CheckLamp
; ---------------------------------------------------------------------------
LevelSizeArray:
		; GHZ
		dc.w $0000, $24BF, $0000, $0300
		dc.w $0000, $1EBF, $0000, $0300
		dc.w $0000, $2960, $0000, $0300
		dc.w $0000, $2ABF, $0000, $0300
		; LZ
		dc.w $0000, $19BF, $0000, $0530
		dc.w $0000, $10AF, $0000, $0720
		dc.w $0000, $202F, $FF00, $0800
		dc.w $0000, $20BF, $0000, $0720
		; MZ
		dc.w $0000, $17BF, $0000, $01D0
		dc.w $0000, $17BF, $0000, $0520
		dc.w $0000, $1800, $0000, $0720
		dc.w $0000, $16BF, $0000, $0720
		; SLZ
		dc.w $0000, $1FBF, $0000, $0640
		dc.w $0000, $1FBF, $0000, $0640
		dc.w $0000, $2000, $0000, $06C0
		dc.w $0000, $3EC0, $0000, $0720
		; SYZ
		dc.w $0000, $22C0, $0000, $0420
		dc.w $0000, $28C0, $0000, $0520
		dc.w $0000, $2C00, $0000, $0620
		dc.w $0000, $2EC0, $0000, $0620
		; SBZ
		dc.w $0000, $21C0, $0000, $0720
		dc.w $0000, $1E40, $FF00, $0800
		dc.w $2080, $2460, $0510, $0510
		dc.w $0000, $3EC0, $0000, $0720
s1endingstartloc:
		; Ending
		dc.w $0000, $0500, $0110, $0110
		dc.w $0000, $0DC0, $0110, $0110
		dc.w $0000, $2FFF, $0000, $0320
		dc.w $0000, $2FFF, $0000, $0320
; ---------------------------------------------------------------------------

LevelSize_CheckLamp:			; CODE XREF: LevelSizeLoad+76j
		tst.b	($FFFFFE30).w
		beq.s	LevelSize_StartLoc
		jsr	(Lamppost_LoadInfo).l
		move.w	($FFFFB008).w,d1
		move.w	($FFFFB00C).w,d0
		bra.s	LevelSize_StartLocLoaded
; ---------------------------------------------------------------------------

LevelSize_StartLoc:			; CODE XREF: LevelSizeLoad+17Ej
		move.w	(v_zone).w,d0
		lsl.b	#6,d0
		lsr.w	#4,d0
		lea	StartLocArray(pc,d0.w),a1
		tst.w	($FFFFFFF0).w
		bpl.s	loc_58CE
		move.w	($FFFFFFF4).w,d0
		subq.w	#1,d0
		lsl.w	#2,d0
		lea	S1EndingStartLoc(pc,d0.w),a1

loc_58CE:				; CODE XREF: LevelSizeLoad+1A0j
		moveq	#0,d1
		move.w	(a1)+,d1
		move.w	d1,($FFFFB008).w
		moveq	#0,d0
		move.w	(a1),d0
		move.w	d0,($FFFFB00C).w

LevelSize_StartLocLoaded:		; CODE XREF: LevelSizeLoad+18Ej
		subi.w	#$A0,d1	; " "
		bcc.s	loc_58E6
		moveq	#0,d1

loc_58E6:				; CODE XREF: LevelSizeLoad+1C2j
		move.w	($FFFFEECA).w,d2
		cmp.w	d2,d1
		bcs.s	loc_58F0
		move.w	d2,d1

loc_58F0:				; CODE XREF: LevelSizeLoad+1CCj
		move.w	d1,(v_screenposx).w
		move.w	d1,(v_screenposx_2p).w
		subi.w	#$60,d0	; "`"
		bcc.s	loc_5900
		moveq	#0,d0

loc_5900:				; CODE XREF: LevelSizeLoad+1DCj
		cmp.w	($FFFFEECE).w,d0
		blt.s	loc_590A
		move.w	($FFFFEECE).w,d0

loc_590A:				; CODE XREF: LevelSizeLoad+1E4j
		move.w	d0,(v_screenposy).w
		move.w	d0,(v_screenposy_2p).w
		bsr.w	BgScrollSpeed
		rts
; End of function LevelSizeLoad

; ---------------------------------------------------------------------------
StartLocArray:	dc.w   $50, $3B0,  $50,	 $FC,  $50, $3B0,  $80,	 $A8; 0
		dc.w   $60,  $6C,  $50,	 $EC,  $50, $2EC, $B80,	   0; 8
		dc.w   $30, $1EC,  $30,	$266,  $30, $166,  $80,	 $A8; 16
		dc.w   $60, $28F,  $40,	$2AF,  $40, $370,  $80,	 $A8; 24
		dc.w  $230, $1AC,  $30,	$1BD,  $30,  $EC,  $80,	 $A8; 32
		dc.w   $40, $36F,  $60,	$690,$2140, $5AC,  $80,	 $A8; 40
		dc.w  $620, $16B, $EE0,	$16C,  $80,  $A8,  $80,	 $A8; 48

; ллллллллллллллл S U B	R O U T	I N E ллллллллллллллллллллллллллллллллллллллл


BgScrollSpeed:				; CODE XREF: LevelSizeLoad+1F2p
		tst.b	($FFFFFE30).w
		bne.s	loc_59B6
		move.w	d0,(v_bgscreenposy).w
		move.w	d0,(v_bg2screenposy).w
		move.w	d1,(v_bgscreenposx).w
		move.w	d1,(v_bg2screenposx).w
		move.w	d1,(v_bg3screenposx).w
		move.w	d0,(v_bgscreenposy_2p).w
		move.w	d0,(v_bg2screenposy_2p).w
		move.w	d1,(v_bgscreenposx_2p).w
		move.w	d1,(v_bg2screenposx_2p).w
		move.w	d1,(v_bg3screenposx_2p).w

loc_59B6:				; CODE XREF: BgScrollSpeed+4j
		moveq	#0,d2
		move.b	(v_zone).w,d2
		add.w	d2,d2
		move.w	BgScroll_Index(pc,d2.w),d2
		jmp	BgScroll_Index(pc,d2.w)
; End of function BgScrollSpeed

; ---------------------------------------------------------------------------
BgScroll_Index:	dc.w BgScroll_GHZ-BgScroll_Index; 0 ; DATA XREF: ROM:BgScroll_Indexo
					; ROM:BgScroll_Index+2o ...
		dc.w BgScroll_LZ-BgScroll_Index; 1
		dc.w BgScroll_CPZ-BgScroll_Index; 2
		dc.w BgScroll_SLZ-BgScroll_Index; 3
		dc.w BgScroll_SYZ-BgScroll_Index; 4
		dc.w BgScroll_SBZ-BgScroll_Index; 5
		dc.w BgScroll_S1Ending-BgScroll_Index; 6
; ---------------------------------------------------------------------------

BgScroll_GHZ:				; DATA XREF: ROM:BgScroll_Indexo
		clr.l	(v_bgscreenposx).w
		clr.l	(v_bgscreenposy).w
		clr.l	(v_bg2screenposy).w
		clr.l	(v_bg3screenposy).w
		lea	(v_bgscroll_buffer).w,a2
		clr.l	(a2)+
		clr.l	(a2)+
		clr.l	(a2)+
		clr.l	(v_bgscreenposx_2p).w
		clr.l	(v_bgscreenposy_2p).w
		clr.l	(v_bg2screenposy_2p).w
		clr.l	(v_bg3screenposy_2p).w
		rts
; ---------------------------------------------------------------------------

BgScroll_LZ:				; DATA XREF: ROM:BgScroll_Indexo
		asr.l	#1,d0
		move.w	d0,(v_bgscreenposy).w
		rts
; ---------------------------------------------------------------------------

BgScroll_CPZ:				; DATA XREF: ROM:BgScroll_Indexo
		lsr.w	#2,d0
		move.w	d0,(v_bgscreenposy).w
		move.w	d0,(v_bgscreenposy_2p).w
		clr.l	(v_bgscreenposx).w
		clr.l	(v_bg2screenposx).w
		rts
; ---------------------------------------------------------------------------

BgScroll_SLZ:				; DATA XREF: ROM:BgScroll_Indexo
		asr.l	#1,d0
		addi.w	#$C0,d0
		move.w	d0,(v_bgscreenposy).w
		clr.l	(v_bgscreenposx).w
		rts	
; ---------------------------------------------------------------------------

BgScroll_SYZ:
		asl.l	#4,d0
		move.l	d0,d2
		asl.l	#1,d0
		add.l	d2,d0
		asr.l	#8,d0
		addq.w	#1,d0
		move.w	d0,(v_bgscreenposy).w
		clr.l	(v_bgscreenposx).w
		rts
; ---------------------------------------------------------------------------

BgScroll_SBZ:
		andi.w	#$7F8,d0
		asr.w	#3,d0
		addq.w	#1,d0
		move.w	d0,(v_bgscreenposy).w
		rts	
; ---------------------------------------------------------------------------

BgScroll_S1Ending:			; DATA XREF: ROM:BgScroll_Indexo
		move.w	(v_screenposx).w,d0
		asr.w	#1,d0
		move.w	d0,(v_bgscreenposx).w
		move.w	d0,(v_bg2screenposx).w
		asr.w	#2,d0
		move.w	d0,d1
		add.w	d0,d0
		add.w	d1,d0
		move.w	d0,(v_bg3screenposx).w
		clr.l	(v_bgscreenposy).w
		clr.l	(v_bg2screenposy).w
		clr.l	(v_bg3screenposy).w
		lea	(v_bgscroll_buffer).w,a2
		clr.l	(a2)+
		clr.l	(a2)+
		clr.l	(a2)+
		rts