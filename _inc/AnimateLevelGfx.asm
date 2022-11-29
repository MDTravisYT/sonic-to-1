; ---------------------------------------------------------------------------
; Subroutine to	animate	level graphics
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


AnimateLevelGfx:
		tst.w	(f_pause).w	; is the game paused?
		bne.s	@ispaused	; if yes, branch
		lea	(vdp_data_port).l,a6
		bsr.w	AniArt_GiantRing
		moveq	#0,d0
		move.b	(v_zone).w,d0
		add.w	d0,d0
		move.w	AniArt_Index(pc,d0.w),d0
		jmp	AniArt_Index(pc,d0.w)

	@ispaused:
		rts

; ===========================================================================
AniArt_Index:	dc.w AniArt_GHZ-AniArt_Index, AniArt_none-AniArt_Index
		dc.w AniArt_none-AniArt_Index, AniArt_none-AniArt_Index
		dc.w AniArt_none-AniArt_Index, AniArt_none-AniArt_Index
		dc.w AniArt_none-AniArt_Index
; ===========================================================================
; ---------------------------------------------------------------------------
; Animated pattern routine - Green Hill
; ---------------------------------------------------------------------------

AniArt_GHZ:

AniArt_GHZ_Waterfall:

@size:		equ 8	; number of tiles per frame

		subq.b	#1,(v_lani0_time).w ; decrement timer
		bpl.s	AniArt_GHZ_Bigflower ; branch if not 0

		move.b	#5,(v_lani0_time).w ; time to display each frame
		lea	(Art_GhzWater).l,a1 ; load waterfall patterns
		move.b	(v_lani0_frame).w,d0
		addq.b	#1,(v_lani0_frame).w ; increment frame counter
		andi.w	#1,d0		; there are only 2 frames
		beq.s	@isframe0	; branch if frame 0
		lea	@size*$20(a1),a1 ; use graphics for frame 1

	@isframe0:
		locVRAM	$6F00		; VRAM address
		move.w	#@size-1,d1	; number of 8x8	tiles
		bra.w	LoadTiles
; ===========================================================================

AniArt_GHZ_Bigflower:

@size:		equ 16	; number of tiles per frame

		subq.b	#1,(v_lani1_time).w
		bpl.s	AniArt_GHZ_Smallflower

		move.b	#$F,(v_lani1_time).w
		lea	(Art_GhzFlower1).l,a1 ;	load big flower	patterns
		move.b	(v_lani1_frame).w,d0
		addq.b	#1,(v_lani1_frame).w
		andi.w	#1,d0
		beq.s	@isframe0
		lea	@size*$20(a1),a1

	@isframe0:
		locVRAM	$6B80
		move.w	#@size-1,d1
		bra.w	LoadTiles
; ===========================================================================

AniArt_GHZ_Smallflower:

@size:		equ 12	; number of tiles per frame

		subq.b	#1,(v_lani2_time).w
		bpl.s	@end

		move.b	#7,(v_lani2_time).w
		move.b	(v_lani2_frame).w,d0
		addq.b	#1,(v_lani2_frame).w ; increment frame counter
		andi.w	#3,d0		; there are 4 frames
		move.b	@sequence(pc,d0.w),d0
		btst	#0,d0		; is frame 0 or 2? (actual frame, not frame counter)
		bne.s	@isframe1	; if not, branch
		move.b	#$7F,(v_lani2_time).w ; set longer duration for frames 0 and 2

	@isframe1:
		lsl.w	#7,d0		; multiply frame num by $80
		move.w	d0,d1
		add.w	d0,d0
		add.w	d1,d0		; multiply that by 3 (i.e. frame num times 12 * $20)
		locVRAM	$6D80
		lea	(Art_GhzFlower2).l,a1 ;	load small flower patterns
		lea	(a1,d0.w),a1	; jump to appropriate tile
		move.w	#@size-1,d1
		bsr.w	LoadTiles

@end:
		rts

@sequence:	dc.b 0,	1, 2, 1

AniArt_none:
		rts

; ---------------------------------------------------------------------------
; Subroutine to	transfer graphics to VRAM

; input:
;	a1 = source address
;	a6 = vdp_data_port ($C00000)
;	d1 = number of tiles to load (minus one)
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


LoadTiles:
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		dbf	d1,LoadTiles
		rts
; End of function LoadTiles

; ---------------------------------------------------------------------------
; Animated pattern routine - giant ring
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


AniArt_GiantRing:

@size:		equ 14

		tst.w	(v_gfxbigring).w	; Is there any of the art left to load?
		bne.s	@loadTiles		; If so, get to work
		rts	
; ===========================================================================
; loc_1C518:
@loadTiles:
		subi.w	#@size*$20,(v_gfxbigring).w	; Count-down the 14 tiles we're going to load now
		lea	(Art_BigRing).l,a1 ; load giant	ring patterns
		moveq	#0,d0
		move.w	(v_gfxbigring).w,d0
		lea	(a1,d0.w),a1
		; Turn VRAM address into VDP command
		addi.w	#$8000,d0
		lsl.l	#2,d0
		lsr.w	#2,d0
		ori.w	#$4000,d0
		swap	d0
		; Send VDP command (write to VRAM at address contained in v_gfxbigring)
		move.l	d0,4(a6)

		move.w	#@size-1,d1
		bra.w	LoadTiles

; End of function AniArt_GiantRing
