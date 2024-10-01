local QuestClientData = {}

QuestClientData.MainID = 376
QuestClientData.ActorAlias = "376"
QuestClientData.SubIDs = 
{
	q37601 = 37601,
    q37602 = 37602,
    q37603 = 37603,
    q37604 = 37604,
    q37605 = 37605,
    q37606 = 37606,
    q37607 = 37607,
    q37608 = 37608,

}

QuestClientData.EscapeTime = 60

QuestClientData.FailureNum = 0

QuestClientData.EscapeFlag = false

QuestClientData.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
	WendyID = 1001,
    bornPos1 = sceneData:GetDummyPoint(3,"Q376Wendy1Temp").pos,
	bornDir1 = sceneData:GetDummyPoint(3,"Q376Wendy1Temp").rot,		
    bornPos2 = sceneData:GetDummyPoint(1009,"Q37607Venti").pos,
	bornDir2 = sceneData:GetDummyPoint(1009,"Q37607Venti").rot,	
}

QuestClientData.DilucData = 
{
	Diluc = "Diluc",
	DilucScript = "Actor/Quest/Q376/Diluc",
	DilucID = 1009,
    bornPos = sceneData:GetDummyPoint(1009,"Q376DilucTemp").pos,
	bornDir = sceneData:GetDummyPoint(1009,"Q376DilucTemp").rot,
	bornPos2 = sceneData:GetDummyPoint(1009,"Q376Diluc").pos,
	bornDir2 = sceneData:GetDummyPoint(1009,"Q376Diluc").rot,		
}

QuestClientData.Soldier1Data = 
{
	Soldier = "Soldier01",
	SoldierScript = "Actor/Quest/Q376/Soldier",
	SoldierID = 1162,
    bornPos = sceneData:GetDummyPoint(1009,"Q376Soldier1Temp").pos,
    bornDir = sceneData:GetDummyPoint(1009,"Q376Soldier1Temp").rot,
    desPos = sceneData:GetDummyPoint(1009,"Q376SoldierDes").pos,
    desDir = sceneData:GetDummyPoint(1009,"Q376SoldierDes").rot,		
}

QuestClientData.Soldier2Data = 
{
	Soldier = "Soldier02",
	SoldierScript = "Actor/Quest/Q376/Soldier",
	SoldierID = 1163,
    bornPos = sceneData:GetDummyPoint(1009,"Q376Soldier2Temp").pos,
	bornDir = sceneData:GetDummyPoint(1009,"Q376Soldier2Temp").rot,		
}

QuestClientData.EscapeRoute1 = 
{	
	sceneData:GetDummyPoint(3,"Acc11").pos,
	{
		x = sceneData:GetDummyPoint(3,"Acc11").pos.x + (sceneData:GetDummyPoint(3,"Acc15").pos.x - sceneData:GetDummyPoint(3,"Acc11").pos.x)/4,
		y = sceneData:GetDummyPoint(3,"Acc11").pos.y + (sceneData:GetDummyPoint(3,"Acc15").pos.y - sceneData:GetDummyPoint(3,"Acc11").pos.y)/4,
		z = sceneData:GetDummyPoint(3,"Acc11").pos.z + (sceneData:GetDummyPoint(3,"Acc15").pos.z - sceneData:GetDummyPoint(3,"Acc11").pos.z)/4
	},
	{
		x = sceneData:GetDummyPoint(3,"Acc11").pos.x + (sceneData:GetDummyPoint(3,"Acc15").pos.x - sceneData:GetDummyPoint(3,"Acc11").pos.x)/2,
		y = sceneData:GetDummyPoint(3,"Acc11").pos.y + (sceneData:GetDummyPoint(3,"Acc15").pos.y - sceneData:GetDummyPoint(3,"Acc11").pos.y)/2,
		z = sceneData:GetDummyPoint(3,"Acc11").pos.z + (sceneData:GetDummyPoint(3,"Acc15").pos.z - sceneData:GetDummyPoint(3,"Acc11").pos.z)/2
	},
	{
		x = sceneData:GetDummyPoint(3,"Acc11").pos.x + (sceneData:GetDummyPoint(3,"Acc15").pos.x - sceneData:GetDummyPoint(3,"Acc11").pos.x)/4*3,
		y = sceneData:GetDummyPoint(3,"Acc11").pos.y + (sceneData:GetDummyPoint(3,"Acc15").pos.y - sceneData:GetDummyPoint(3,"Acc11").pos.y)/4*3,
		z = sceneData:GetDummyPoint(3,"Acc11").pos.z + (sceneData:GetDummyPoint(3,"Acc15").pos.z - sceneData:GetDummyPoint(3,"Acc11").pos.z)/4*3
	},
	sceneData:GetDummyPoint(3,"Acc15").pos,
}
QuestClientData.EscapeRoute2 = 	
{	
	{x=2304.38, y=251.44, z=-787.13},
	{x=2301.86, y=251.65, z=-798.49},
	{x=2299.34, y=251.87, z=-809.85},
	{x=2296.82, y=252.09, z=-821.21},
	{x=2294.3, y=252.31, z=-832.57},	
}
QuestClientData.EscapeRoute3 = 	
{		
	{x=2309.11, y=237.81, z=-866.66},
	{x=2304.7, y=240.04, z=-876.19},
	{x=2300.28, y=242.28, z=-885.71},			
}

QuestClientData.EscapeRoute4 = 	
{	
	sceneData:GetDummyPoint(3,"Acc81").pos,
	{
		x = sceneData:GetDummyPoint(3,"Acc81").pos.x + (sceneData:GetDummyPoint(3,"Acc82").pos.x - sceneData:GetDummyPoint(3,"Acc81").pos.x)/3,
		y = sceneData:GetDummyPoint(3,"Acc81").pos.y + (sceneData:GetDummyPoint(3,"Acc82").pos.y - sceneData:GetDummyPoint(3,"Acc81").pos.y)/3,
		z = sceneData:GetDummyPoint(3,"Acc81").pos.z + (sceneData:GetDummyPoint(3,"Acc82").pos.z - sceneData:GetDummyPoint(3,"Acc81").pos.z)/3
	},
	{
		x = sceneData:GetDummyPoint(3,"Acc81").pos.x + (sceneData:GetDummyPoint(3,"Acc82").pos.x - sceneData:GetDummyPoint(3,"Acc81").pos.x)/3*2,
		y = sceneData:GetDummyPoint(3,"Acc81").pos.y + (sceneData:GetDummyPoint(3,"Acc82").pos.y - sceneData:GetDummyPoint(3,"Acc81").pos.y)/3*2,
		z = sceneData:GetDummyPoint(3,"Acc81").pos.z + (sceneData:GetDummyPoint(3,"Acc82").pos.z - sceneData:GetDummyPoint(3,"Acc81").pos.z)/3*2
	},
	-- {
	-- 	x = sceneData:GetDummyPoint(3,"Acc81").pos.x + (sceneData:GetDummyPoint(3,"Acc82").pos.x - sceneData:GetDummyPoint(3,"Acc81").pos.x)/4*3,
	-- 	y = sceneData:GetDummyPoint(3,"Acc81").pos.y + (sceneData:GetDummyPoint(3,"Acc82").pos.y - sceneData:GetDummyPoint(3,"Acc81").pos.y)/4*3,
	-- 	z = sceneData:GetDummyPoint(3,"Acc81").pos.z + (sceneData:GetDummyPoint(3,"Acc82").pos.z - sceneData:GetDummyPoint(3,"Acc81").pos.z)/4*3
	-- },
	sceneData:GetDummyPoint(3,"Acc82").pos,
}

QuestClientData.EscapeRoute5 = 	
{	
	sceneData:GetDummyPoint(3,"Acc91").pos,
	{
		x = sceneData:GetDummyPoint(3,"Acc91").pos.x + (sceneData:GetDummyPoint(3,"Acc92").pos.x - sceneData:GetDummyPoint(3,"Acc91").pos.x)/3,
		y = sceneData:GetDummyPoint(3,"Acc91").pos.y + (sceneData:GetDummyPoint(3,"Acc92").pos.y - sceneData:GetDummyPoint(3,"Acc91").pos.y)/3,
		z = sceneData:GetDummyPoint(3,"Acc91").pos.z + (sceneData:GetDummyPoint(3,"Acc92").pos.z - sceneData:GetDummyPoint(3,"Acc91").pos.z)/3
	},
	{
		x = sceneData:GetDummyPoint(3,"Acc91").pos.x + (sceneData:GetDummyPoint(3,"Acc92").pos.x - sceneData:GetDummyPoint(3,"Acc91").pos.x)/3*2,
		y = sceneData:GetDummyPoint(3,"Acc91").pos.y + (sceneData:GetDummyPoint(3,"Acc92").pos.y - sceneData:GetDummyPoint(3,"Acc91").pos.y)/3*2,
		z = sceneData:GetDummyPoint(3,"Acc91").pos.z + (sceneData:GetDummyPoint(3,"Acc92").pos.z - sceneData:GetDummyPoint(3,"Acc91").pos.z)/3*2
	},
	sceneData:GetDummyPoint(3,"Acc92").pos,
}

QuestClientData.EscapeRoute6 = 	
{	
	sceneData:GetDummyPoint(3,"Acc101").pos,
	{
		x = sceneData:GetDummyPoint(3,"Acc101").pos.x + (sceneData:GetDummyPoint(3,"Acc102").pos.x - sceneData:GetDummyPoint(3,"Acc101").pos.x)/3,
		y = sceneData:GetDummyPoint(3,"Acc101").pos.y + (sceneData:GetDummyPoint(3,"Acc102").pos.y - sceneData:GetDummyPoint(3,"Acc101").pos.y)/3,
		z = sceneData:GetDummyPoint(3,"Acc101").pos.z + (sceneData:GetDummyPoint(3,"Acc102").pos.z - sceneData:GetDummyPoint(3,"Acc101").pos.z)/3
	},
	{
		x = sceneData:GetDummyPoint(3,"Acc101").pos.x + (sceneData:GetDummyPoint(3,"Acc102").pos.x - sceneData:GetDummyPoint(3,"Acc101").pos.x)/3*2,
		y = sceneData:GetDummyPoint(3,"Acc101").pos.y + (sceneData:GetDummyPoint(3,"Acc102").pos.y - sceneData:GetDummyPoint(3,"Acc101").pos.y)/3*2,
		z = sceneData:GetDummyPoint(3,"Acc101").pos.z + (sceneData:GetDummyPoint(3,"Acc102").pos.z - sceneData:GetDummyPoint(3,"Acc101").pos.z)/3*2
	},
	sceneData:GetDummyPoint(3,"Acc102").pos,
}

return QuestClientData