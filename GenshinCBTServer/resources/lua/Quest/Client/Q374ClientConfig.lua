local QuestClientData = {}

QuestClientData.MainID = 374
QuestClientData.ActorAlias = "374"
QuestClientData.SubIDs = 
{
	q37401 = 37401,
    q37402 = 37402,
    q37403 = 37403,
    q37404 = 37404,
    q37405 = 37405,
    q37406 = 37406,
}

QuestClientData.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1005,

	bornPos1 = sceneData:GetDummyPoint(1008,"Q374PaimonTemp").pos,
    bornDir1 = sceneData:GetDummyPoint(1008,"Q374PaimonTemp").rot,
    bornPos2 = sceneData:GetDummyPoint(1008,"Q374Paimon2Temp").pos,
	bornDir2 = sceneData:GetDummyPoint(1008,"Q374Paimon2Temp").rot,		

}

QuestClientData.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
	WendyID = 1001,

	bornPos1 = sceneData:GetDummyPoint(1008,"Q373WendyTemp").pos,
    bornDir1 = sceneData:GetDummyPoint(1008,"Q373WendyTemp").rot,
    bornPos2 = sceneData:GetDummyPoint(1008,"Q374WendyTemp").pos,
	bornDir2 = sceneData:GetDummyPoint(1008,"Q374WendyTemp").rot,		

}

QuestClientData.MaidData = 
{
	Maid = "Maid",
	MaidScript = "Actor/Quest/Q413/Pastor",
	MaidID = 1161,

	bornPos1 = sceneData:GetDummyPoint(1008,"Q374Maid1Temp").pos,
    bornDir1 = sceneData:GetDummyPoint(1008,"Q374Maid1Temp").rot,
    bornPos2 = sceneData:GetDummyPoint(1008,"Q37404Maid").pos,
    bornDir2 = sceneData:GetDummyPoint(1008,"Q37404Maid").rot, 	
	missPos = sceneData:GetDummyPoint(1008,"Q374Maid2Miss").pos,
    missDir = sceneData:GetDummyPoint(1008,"Q374Maid2Miss").rot,
}

QuestClientData.GuardData = 
{
	Guard = "Guard",
	GuardScript = "Actor/Quest/Q375/Guard",
	GuardID = 1164,
    bornPos = sceneData:GetDummyPoint(1008,"Q374Guard").pos,
	bornDir = sceneData:GetDummyPoint(1008,"Q374Guard").rot,	
	transPos = sceneData:GetDummyPoint(1008,"Q375Player").pos,
	transDir = sceneData:GetDummyPoint(1008,"Q375Player").rot,		

}


return QuestClientData