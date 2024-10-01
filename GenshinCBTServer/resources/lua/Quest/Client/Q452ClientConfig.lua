local QuestClientData = {}

QuestClientData.MainID = 452
QuestClientData.ActorAlias = "452"
QuestClientData.SubIDs = 
{
	q45201 = 45201,
    q45202 = 45202,
    q45203 = 45203,
    q45204 = 45204,
    q45205 = 45205,
}

QuestClientData.AmborData = 
{
	Alias = "Ambor",
	Script = "Actor/Quest/Q301/Ambor301",
	ID = 1002,
	BornPos = sceneData:GetDummyPoint(3,"Q452AmborBorn").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q452AmborBorn").rot,
    FightPos = sceneData:GetDummyPoint(3,"Q452AmborFight").pos,
	FightDir = sceneData:GetDummyPoint(3,"Q452AmborFight").rot,
}

QuestClientData.PaimonData = 
{
	Alias = "Paimon",
	Script = "Actor/Quest/Q352/Paimon",
	ID = 1005,
	BornPos = { sceneData:GetDummyPoint(3,"Q452AmborBorn").pos.x+1, sceneData:GetDummyPoint(3,"Q452AmborBorn").pos.y, sceneData:GetDummyPoint(3,"Q452AmborBorn").pos.z },
	BornDir = sceneData:GetDummyPoint(3,"Q452AmborBorn").rot,	
}

QuestClientData.FarmerData = 
{
	Alias = "Farmer",
	Script = "Actor/Npc/RazorFarmer",
	ID = 1151,
	BornPos = sceneData:GetDummyPoint(3,"Q452FightFarmer").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q452FightFarmer").rot,
}


return QuestClientData