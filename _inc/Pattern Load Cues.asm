ArtLoadCues:	dc.w PLC_Main-ArtLoadCues,PLC_Main2-ArtLoadCues; 0
		dc.w PLC_Explode-ArtLoadCues,PLC_GameOver-ArtLoadCues; 2
		dc.w PLC_GHZ-ArtLoadCues,PLC_GHZ2-ArtLoadCues; 4
		dc.w PLC_CPZ-ArtLoadCues,PLC_CPZ2-ArtLoadCues; 6
		dc.w PLC_CPZ-ArtLoadCues,PLC_CPZ2-ArtLoadCues; 8
		dc.w PLC_EHZ-ArtLoadCues,PLC_EHZ2-ArtLoadCues; 10
		dc.w PLC_HPZ-ArtLoadCues,PLC_HPZ2-ArtLoadCues; 12
		dc.w PLC_HTZ-ArtLoadCues,PLC_HTZ2-ArtLoadCues; 14
		dc.w PLC_S1TitleCard-ArtLoadCues,PLC_Boss-ArtLoadCues; 16
		dc.w PLC_Signpost-ArtLoadCues,PLC_Invalid-ArtLoadCues; 18
		dc.w PLC_Invalid-ArtLoadCues,PLC_GHZAnimals-ArtLoadCues; 20
		dc.w PLC_LZAnimals-ArtLoadCues,PLC_CPZAnimals-ArtLoadCues; 22
		dc.w PLC_EHZAnimals-ArtLoadCues,PLC_HPZAnimals-ArtLoadCues; 24
		dc.w PLC_HTZAnimals-ArtLoadCues,LeftoverArt_Unknown-ArtLoadCues; 26
		dc.w LeftoverArt_Unknown+2-ArtLoadCues,LeftoverArt_Unknown+4-ArtLoadCues; 28
		dc.w LeftoverArt_Unknown+6-ArtLoadCues,LeftoverArt_Unknown+8-ArtLoadCues; 30
PLC_Main:	dc.w 4			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_Lamppost
		dc.w $F400
		dc.l Nem_HUD
		dc.w $D940
		dc.l Nem_Lives
		dc.w $FA80
		dc.l Nem_Ring
		dc.w $D780
		dc.l Nem_Points
		dc.w $9580
PLC_Main2:	dc.w 2			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_Monitors
		dc.w $D000
		dc.l Nem_Shield
		dc.w $A820
		dc.l Nem_Stars
		dc.w $AB80
PLC_Explode:	dc.w 0			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_Explosion
		dc.w $B400
PLC_GameOver:	dc.w 0			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_GameOver
		dc.w $ABC0
PLC_GHZ:	dc.w 8			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_GHZ
		dc.w 0
		dc.l Nem_GHZ_Piranha
		dc.w $8F60
		dc.l Nem_VSpikes
		dc.w $9400
		dc.l Nem_HSpring
		dc.w $A460
		dc.l Nem_VSpring
		dc.w $A660
		dc.l Nem_GHZ_Bridge
		dc.w $71C0
		dc.l Nem_SwingPlatform
		dc.w $7000
		dc.l Nem_Motobug
		dc.w $9E00
		dc.l Nem_GHZ_Rock
		dc.w $7A00
PLC_GHZ2:	dc.w 2
		dc.l Nem_Crabmeat
		dc.w $8000
		dc.l Nem_GHZBuzzbomber
		dc.w $8880
		dc.l Nem_S1Newtron
		dc.w $9360
PLC_CPZ:	dc.w 2			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_CPZ
		dc.w 0
		dc.l Nem_CPZ_Unknown
		dc.w $7A00
		dc.l Nem_CPZ_FloatingPlatform
		dc.w $8000
PLC_CPZ2:	dc.w 3			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_VSpikes
		dc.w $8680
		dc.l Nem_DSpikes
		dc.w $8780
		dc.l Nem_VSpring2
		dc.w $8B80
		dc.l Nem_HSpring2
		dc.w $8E00
PLC_EHZ:	dc.w 8			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_EHZ
		dc.w 0
		dc.l Nem_EHZ_Fireball
		dc.w $73C0
		dc.l Nem_EHZ_Waterfall
		dc.w $75C0
		dc.l Nem_EHZ_Bridge
		dc.w $78C0
		dc.l Nem_HTZ_Seesaw
		dc.w $79C0
		dc.l Nem_VSpikes
		dc.w $8680
		dc.l Nem_DSpikes
		dc.w $8780
		dc.l Nem_VSpring2
		dc.w $8B80
		dc.l Nem_HSpring2
		dc.w $8E00
PLC_EHZ2:	dc.w 4			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_Shield
		dc.w $AC00
		dc.l Nem_Points
		dc.w $9580
		dc.l Nem_Buzzbomber
		dc.w $7CC0
		dc.l Nem_Snail
		dc.w $8040
		dc.l Nem_EHZ_Piranha
		dc.w $8380
PLC_HPZ:	dc.w 7			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_HPZ
		dc.w 0
		dc.l Nem_HPZ_Bridge
		dc.w $6000
		dc.l Nem_HPZ_Waterfall
		dc.w $62A0
		dc.l Nem_HPZ_Platform
		dc.w $6940
		dc.l Nem_HPZ_PulsingBall
		dc.w $6B40
		dc.l Nem_HPZ_Various
		dc.w $6F80
		dc.l Nem_HPZ_Emerald
		dc.w $7240
		dc.l Nem_HPZ_WaterSurface
		dc.w $8000
PLC_HPZ2:	dc.w 1			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_Dinobot
		dc.w $A000
		dc.l Nem_Bat
word_1C1E4:	dc.w $A600		; DATA XREF: ROM:0000C3FAo
		dc.l Nem_Crocobot
		dc.w $6000
		dc.l Nem_Buzzbomber
		dc.w $6580
		dc.l Nem_Bat
		dc.w $6A00
		dc.l Nem_Triceratops
		dc.w $7880
		dc.l Nem_Dinobot
		dc.w $A000
		dc.l Nem_HPZ_Piranha
		dc.w $A600
PLC_HTZ:	dc.w 9			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_EHZ
		dc.w 0
		dc.l Nem_HTZ
		dc.w $3F80
		dc.l Nem_HTZ_AniPlaceholders
		dc.w $A000
		dc.l Nem_EHZ_Fireball
		dc.w $73C0
		dc.l Nem_HTZ_Fireball
		dc.w $75C0
		dc.l Nem_HTZ_AutomaticDoor
		dc.w $77C0
		dc.l Nem_EHZ_Bridge
		dc.w $78C0
		dc.l Nem_HTZ_Seesaw
		dc.w $79C0
		dc.l Nem_VSpikes
		dc.w $8680
		dc.l Nem_DSpikes
		dc.w $8780
		dc.l Nem_VSpring2
		dc.w $8B80
		dc.l Nem_HSpring2
		dc.w $8E00
PLC_HTZ2:	dc.w 0			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_HTZ_Lift
		dc.w $7CC0
		dc.l Nem_Buzzbomber
		dc.w $7CC0
		dc.l Nem_Snail
		dc.w $8040
		dc.l Nem_EHZ_Piranha
		dc.w $8380
PLC_S1TitleCard:dc.w 0			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_S1TitleCard
		dc.w $B000
PLC_Boss:	dc.w 2			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_BossShip
		dc.w $8C00
		dc.l Nem_EHZ_Boss
		dc.w $9800
		dc.l Nem_EHZ_Boss_Blades
		dc.w $A800
		dc.l Nem_BossShip
		dc.w $8000
		dc.l Nem_CPZ_ProtoBoss
		dc.w $8C00
		dc.l Nem_BossShipBoost
		dc.w $9A00
		dc.l Nem_Smoke
		dc.w $9B00
		dc.l Nem_EHZ_Boss
		dc.w $9D00
		dc.l Nem_EHZ_Boss_Blades
		dc.w $AD00
PLC_Signpost:	dc.w 2			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_Signpost
		dc.w $D000
		dc.l Nem_S1BonusPoints
		dc.w $96C0
		dc.l Nem_BigFlash
		dc.w $8C40
PLC_Invalid:	dc.w $10		; DATA XREF: ROM:ArtLoadCueso
PLC_GHZAnimals:	dc.w 1			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_Bunny
		dc.w $B000
		dc.l Nem_Flicky
		dc.w $B240
PLC_LZAnimals:	dc.w 1			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_Penguin
		dc.w $B000
		dc.l Nem_Seal
		dc.w $B240
PLC_CPZAnimals:	dc.w 1			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_Squirrel
		dc.w $B000
		dc.l Nem_Seal
		dc.w $B240
PLC_EHZAnimals:	dc.w 1			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_Pig
		dc.w $B000
		dc.l Nem_Flicky
		dc.w $B240
PLC_HPZAnimals:	dc.w 1			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_Pig
		dc.w $B000
		dc.l Nem_Chicken
		dc.w $B240
PLC_HTZAnimals:	dc.w 1			; DATA XREF: ROM:ArtLoadCueso
		dc.l Nem_Bunny
		dc.w $B000
		dc.l Nem_Chicken
		dc.w $B240