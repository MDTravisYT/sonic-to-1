ArtLoadCues:	dc.w PLC_Main-ArtLoadCues,PLC_Main2-ArtLoadCues; 0
		dc.w PLC_Explode-ArtLoadCues,PLC_GameOver-ArtLoadCues; 2
		dc.w PLC_GHZ-ArtLoadCues,PLC_GHZ2-ArtLoadCues; 4
		dc.w PLC_LZ-ArtLoadCues,PLC_LZ2-ArtLoadCues; 6
		dc.w PLC_MZ-ArtLoadCues,PLC_MZ2-ArtLoadCues; 8
		dc.w PLC_SLZ-ArtLoadCues,PLC_SLZ2-ArtLoadCues; 10
		dc.w PLC_SYZ-ArtLoadCues,PLC_SYZ2-ArtLoadCues; 12
		dc.w PLC_SBZ-ArtLoadCues,PLC_SBZ2-ArtLoadCues; 14
		dc.w PLC_S1TitleCard-ArtLoadCues,PLC_Boss-ArtLoadCues; 16
		dc.w PLC_Signpost-ArtLoadCues,PLC_Invalid-ArtLoadCues; 18
		dc.w PLC_Invalid-ArtLoadCues,PLC_GHZAnimals-ArtLoadCues; 20
		dc.w PLC_LZAnimals-ArtLoadCues,PLC_MZAnimals-ArtLoadCues; 22
		dc.w PLC_SLZAnimals-ArtLoadCues,PLC_SYZAnimals-ArtLoadCues; 24
		dc.w PLC_SBZAnimals-ArtLoadCues
PLC_Main:	dc.w 4			
		dc.l Nem_Lamppost
		dc.w $F400
		dc.l Nem_HUD
		dc.w $D940
		dc.l Nem_Lives
		dc.w $FA80
		dc.l Nem_Ring
		dc.w $D780
		dc.l Nem_Points
		dc.w $F2E0
PLC_Main2:	dc.w 2			
		dc.l Nem_Monitors
		dc.w $D000
		dc.l Nem_Shield
		dc.w $A820
		dc.l Nem_Stars
		dc.w $AB80
PLC_Explode:	dc.w 0			
		dc.l Nem_Explosion
		dc.w $B400
PLC_GameOver:	dc.w 0			
		dc.l Nem_GameOver
		dc.w $ABC0
PLC_GHZ:	dc.w ((PLC_GHZ2-PLC_GHZ-2)/6)-1			
		dc.l Nem_GHZ
		dc.w 0
		dc.l S1Nem_GHZFlowerBits
		dc.w $6B00
		dc.l Nem_GHZ_Rock
		dc.w $7A00
		dc.l Nem_Crabmeat
		dc.w $8000
		dc.l Nem_GHZBuzzbomber
		dc.w $8880
		dc.l Nem_GHZ_Piranha
		dc.w $8F60
		dc.l Nem_S1Newtron
		dc.w $9360
		dc.l Nem_Motobug
		dc.w $9E00
		dc.l Nem_VSpikes
		dc.w $A360
		dc.l Nem_HSpring
		dc.w $A460
		dc.l Nem_VSpring
		dc.w $A660
PLC_GHZ2:	dc.w ((PLC_LZ-PLC_GHZ2-2)/6)-1
		dc.l Nem_SwingPlatform
		dc.w $7000
		dc.l Nem_GHZ_Bridge
		dc.w $71C0
		dc.l S1Nem_GHZLogSpikes
		dc.w $7300
		dc.l S1Nem_GHZRollingBall	;	cool s1 beta leftover you have here s2 team
		dc.w $7540
		dc.l S1Nem_GHZBreakableWall
		dc.w $A1E0
		dc.l S1Nem_GHZWall
		dc.w $6980
		
PLC_LZ:	dc.w ((PLC_LZ2-PLC_LZ-2)/6)-1			
		dc.l Nem_LZ
		dc.w 0
		dc.l Nem_SYZ_WaterSurface
		dc.w $8000
		dc.l S1Nem_LZBurrobot
		dc.w $94C0

PLC_LZ2:	dc.w ((PLC_MZ-PLC_LZ2-2)/6)-1
		dc.l S1Nem_Orbinaut
		dc.w $8CE0
		dc.l Nem_S1LZJaws
		dc.w $90C0
		dc.l Nem_VSpikes
		dc.w $A360
		dc.l Nem_HSpring
		dc.w $A460
		dc.l Nem_VSpring
		dc.w $A660

PLC_MZ:	dc.w ((PLC_MZ2-PLC_MZ-2)/6)-1			
		dc.l Nem_MZ
		dc.w 0

PLC_MZ2:	dc.w ((PLC_SLZ-PLC_MZ2-2)/6)-1		
		dc.l Nem_VSpikes
		dc.w $A360
		dc.l Nem_HSpring
		dc.w $A460
		dc.l Nem_VSpring
		dc.w $A660
	
PLC_SLZ:	dc.w ((PLC_SLZ2-PLC_SLZ-2)/6)-1			
		dc.l Nem_SLZ
		dc.w 0
		dc.l Nem_VSpikes
		dc.w $A360
		dc.l Nem_HSpring
		dc.w $A460
		dc.l Nem_VSpring
		dc.w $A660
PLC_SLZ2:	dc.w ((PLC_SYZ-PLC_SLZ2-2)/6)-1		

PLC_SYZ:	dc.w ((PLC_SYZ2-PLC_SYZ-2)/6)-1			
		dc.l Nem_SYZ
		dc.w 0
		dc.l Nem_VSpikes
		dc.w $A360
		dc.l Nem_HSpring
		dc.w $A460
		dc.l Nem_VSpring
		dc.w $A660
PLC_SYZ2:	dc.w ((PLC_SBZ-PLC_SYZ2-2)/6)-1		

PLC_SBZ:	dc.w ((PLC_SBZ2-PLC_SBZ-2)/6)-1			
		dc.l Nem_SBZ
		dc.w 0
		dc.l Nem_VSpikes
		dc.w $A360
		dc.l Nem_HSpring
		dc.w $A460
		dc.l Nem_VSpring
		dc.w $A660
PLC_SBZ2:	dc.w ((PLC_SYZ-PLC_S1TitleCard-2)/6)-1	

PLC_S1TitleCard:dc.w 0			
		dc.l Nem_S1TitleCard
		dc.w $B000
PLC_Boss:	dc.w ((PLC_Signpost-PLC_Boss-2)/6)-1
		dc.l Nem_BossShip
		dc.w $8000
		dc.l Nem_Weapons
		dc.w $8D80
		dc.l Nem_Prison
		dc.w $93A0
		dc.l Nem_BossShipBoost
		dc.w $A540

PLC_Signpost:	dc.w 2			
		dc.l Nem_Signpost
		dc.w $D000
		dc.l Nem_S1BonusPoints
		dc.w $96C0
		dc.l Nem_BigFlash
		dc.w $8C40
PLC_Invalid:	dc.w $10		
PLC_GHZAnimals:	dc.w 1			
		dc.l Nem_Bunny
		dc.w $B000
		dc.l Nem_Flicky
		dc.w $B240
PLC_LZAnimals:	dc.w 1			
		dc.l Nem_Penguin
		dc.w $B000
		dc.l Nem_Seal
		dc.w $B240
PLC_MZAnimals:	dc.w 1			
		dc.l Nem_Squirrel
		dc.w $B000
		dc.l Nem_Seal
		dc.w $B240
PLC_SLZAnimals:	dc.w 1			
		dc.l Nem_Pig
		dc.w $B000
		dc.l Nem_Flicky
		dc.w $B240
PLC_SYZAnimals:	dc.w 1			
		dc.l Nem_Pig
		dc.w $B000
		dc.l Nem_Chicken
		dc.w $B240
PLC_SBZAnimals:	dc.w 1			
		dc.l Nem_Bunny
		dc.w $B000
		dc.l Nem_Chicken
		dc.w $B240