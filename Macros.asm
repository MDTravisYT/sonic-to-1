; ---------------------------------------------------------------------------
; Align and pad
; input: length to align to, value to use as padding (default is 0)
; ---------------------------------------------------------------------------

align:	macro
	if (narg=1)
		dcb.b \1-(*%\1),0
	else
		dcb.b \1-(*%\1),\2
	endc
		endm
		
; ---------------------------------------------------------------------------
; stop the Z80
; ---------------------------------------------------------------------------

stopZ80:	macro
		move.w	#$100,(z80_bus_request).l
		endm

; ---------------------------------------------------------------------------
; wait for Z80 to stop
; ---------------------------------------------------------------------------

waitZ80:	macro
	@wait:	btst	#0,(z80_bus_request).l
		bne.s	@wait
		endm

; ---------------------------------------------------------------------------
; reset the Z80
; ---------------------------------------------------------------------------

resetZ80:	macro
		move.w	#$100,(z80_reset).l
		endm

resetZ80a:	macro
		move.w	#0,(z80_reset).l
		endm

; ---------------------------------------------------------------------------
; start the Z80
; ---------------------------------------------------------------------------

startZ80:	macro
		move.w	#0,(z80_bus_request).l
		endm
		
; ---------------------------------------------------------------------------
; Set a VRAM address via the VDP control port.
; input: 16-bit VRAM address, control port (default is ($C00004).l)
; ---------------------------------------------------------------------------

locVRAM:	macro loc,controlport
		if (narg=1)
		move.l	#($40000000+((loc&$3FFF)<<16)+((loc&$C000)>>14)),(vdp_control_port).l
		else
		move.l	#($40000000+((loc&$3FFF)<<16)+((loc&$C000)>>14)),controlport
		endc
		endm
		
; ---------------------------------------------------------------------------
; check if object moves out of range
; input: location to jump to if out of range, x-axis pos (obX(a0) by default)
; ---------------------------------------------------------------------------

out_of_range:	macro exit,pos
		if (narg=2)
		move.w	pos,d0		; get object position (if specified as not obX)
		else
		move.w	obX(a0),d0	; get object position
		endc
		andi.w	#$FF80,d0	; round down to nearest $80
		move.w	($FFFFF700).w,d1 ; get screen position
		subi.w	#128,d1
		andi.w	#$FF80,d1
		sub.w	d1,d0		; approx distance between object and screen
		cmpi.w	#128+320+192,d0
		bhi.\0	exit
		endm
