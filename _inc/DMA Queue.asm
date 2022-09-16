; =============== S U B	R O U T	I N E =======================================


DMA_68KtoVRAM:
	if safeDMA128kb=1
                ; Detect if transfer crosses 128KB boundary
		lsr.l	#1,d1
		move.w	d3,d0
		neg.w	d0
		sub.w	d1,d0
		bcc.s	.transfer
		; Do first transfer
		movem.l	d1-d3,-(sp)
		add.w	d0,d3		; d3 = words remaining in 128KB "bank"
		bsr.s	.transfer
		movem.l	(sp)+,d1-d3
		; Get second transfer's source, destination, and length
		moveq	#0,d0
		sub.w	d1,d0
		sub.w	d0,d3
		add.l	d0,d1
		add.w	d0,d2
		add.w	d0,d2
		; Do second transfer
	.transfer:

	endif
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
	if safeDMA128kb=0
		lsr.l	#1,d1
	endif	
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

DMA_68KtoVRAM_NoDMA:
		rts
; End of function DMA_68KtoVRAM


; =============== S U B	R O U T	I N E =======================================


Process_DMA:
		lea	(vdp_control_port).l,a5
		lea	(v_vdp_cmdbuf).w,a1

Process_DMA_Loop:
		move.w	(a1)+,d0
		beq.s	Process_DMA_End
		move.w	d0,(a5)
		move.w	(a1)+,(a5)
		move.w	(a1)+,(a5)
		move.w	(a1)+,(a5)
		move.w	(a1)+,(a5)
		move.w	(a1)+,(a5)
		move.w	(a1)+,(a5)
		cmpa.w	#v_vdp_cmdbufend&-1,a1
		bne.s	Process_DMA_Loop

Process_DMA_End:
		move.w	#0,(v_vdp_cmdbuf).w
		move.l	#v_vdp_cmdbuf,(v_vdp_cmdbufend).w
		rts
; End of function Process_DMA