local QuestClientData = {}

QuestClientData.MainID = 373
QuestClientData.ActorAlias = "373"
QuestClientData.SubIDs = 
{
	q37301 = 37301,
    q37302 = 37302,
    q37303 = 37303,
}

QuestClientData.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1005,

	bornPos = sceneData:GetDummyPoint(1008,"Q373PaimonTemp").pos,
	bornDir = sceneData:GetDummyPoint(1008,"Q373PaimonTemp").rot,	

}

QuestClientData.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
	WendyID = 1001,

	bornPos = sceneData:GetDummyPoint(1008,"Q373WendyTemp").pos,
	bornDir = sceneData:GetDummyPoint(1008,"Q373WendyTemp").rot,	

}

QuestClientData.MaidData = 
{
	Maid = "Maid",
	MaidScript = "Actor/Quest/Q413/Pastor",
	MaidID = 1161,

	bornPos = sceneData:GetDummyPoint(1008,"Q374Maid1Temp").pos,
    bornDir = sceneData:GetDummyPoint(1008,"Q374Maid1Temp").rot,

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