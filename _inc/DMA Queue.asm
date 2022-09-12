; ллллллллллллллл S U B	R O U T	I N E ллллллллллллллллллллллллллллллллллллллл


DMA_68KtoVRAM:				; CODE XREF: LoadSonicDynPLC+48p
					; LoadTailsDynPLC+48p ...
		movea.l	(v_vdp_cmdbufend).w,a1
		cmpa.w	#v_vdp_cmdbufend&-1,a1
		beq.s	DMA_68KtoVRAM_NoDMA
		move.w	#$9300,d0
		move.b	d3,d0
		move.w	d0,(a1)+
		move.w	#$9400,d0
		lsr.w	#8,d3
		move.b	d3,d0
		move.w	d0,(a1)+
		move.w	#$9500,d0
		lsr.l	#1,d1
		move.b	d1,d0
		move.w	d0,(a1)+
		move.w	#$9600,d0
		lsr.l	#8,d1
		move.b	d1,d0
		move.w	d0,(a1)+
		move.w	#$9700,d0
		lsr.l	#8,d1
		move.b	d1,d0
		move.w	d0,(a1)+
		andi.l	#$FFFF,d2
		lsl.l	#2,d2
		lsr.w	#2,d2
		swap	d2
		ori.l	#$40000080,d2
		move.l	d2,(a1)+
		move.l	a1,(v_vdp_cmdbufend).w
		cmpa.w	#v_vdp_cmdbufend&-1,a1
		beq.s	DMA_68KtoVRAM_NoDMA
		move.w	#0,(a1)

DMA_68KtoVRAM_NoDMA:			; CODE XREF: DMA_68KtoVRAM+8j
					; DMA_68KtoVRAM+56j
		rts
; End of function DMA_68KtoVRAM


; ллллллллллллллл S U B	R O U T	I N E ллллллллллллллллллллллллллллллллллллллл


Process_DMA:				; CODE XREF: ROM:00000D9Cp
					; ROM:00000E84p ...
		lea	(vdp_control_port).l,a5
		lea	(v_vdp_cmdbuf).w,a1

Process_DMA_Loop:			; CODE XREF: Process_DMA+20j
		move.w	(a1)+,d0
		beq.s	Process_DMA_End
		move.w	d0,(a5)
		rept 6
		move.w	(a1)+,(a5)
		endr
		cmpa.w	#v_vdp_cmdbufend&-1,a1
		bne.s	Process_DMA_Loop

Process_DMA_End:			; CODE XREF: Process_DMA+Cj
		move.w	#0,(v_vdp_cmdbuf).w
		move.l	#v_vdp_cmdbuf,(v_vdp_cmdbufend).w
		rts
; End of function Process_DMA