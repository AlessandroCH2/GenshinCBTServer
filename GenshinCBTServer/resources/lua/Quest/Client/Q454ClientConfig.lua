local QuestClientData = {}

QuestClientData.MainID = 454
QuestClientData.ActorAlias = "454"
QuestClientData.SubIDs = 
{
	q45401 = 45401,
    q45402 = 45402,
    q45403 = 45403,
    q45404 = 45404,
    q45405 = 45405,
    q45406 = 45406,
}

QuestClientData.AmborData = 
{
	Alias = "Ambor",
	Script = "Actor/Quest/Q301/Ambor301",
	ID = 1002,
	BornPos = sceneData:GetDummyPoint(3,"Q454Ambor").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q454Ambor").rot,
}

QuestClientData.PaimonData = 
{
	Alias = "Paimon",
	Script = "Actor/Quest/Q352/Paimon",
	ID = 1005,
	BornPos = { sceneData:GetDummyPoint(3,"Q454Ambor").pos.x+1, sceneData:GetDummyPoint(3,"Q454Ambor").pos.y, sceneData:GetDummyPoint(3,"Q454Ambor").pos.z },
	BornDir = sceneData:GetDummyPoint(3,"Q454Ambor").rot,	
}

QuestClientData.RazorData = 
{
	Alias = "Razor",
	Script = "Actor/Npc/Razor",
	ID = 1011,
    BornPos = sceneData:GetDummyPoint(3,"Q454Razor").pos,
	BornDir = sceneData:GetDummyPoint(3,"Q454Razor").rot,	
}

QuestClientData.WolfWoundData = 
{
	Alias = "WolfWound",
	Script = "Actor/Npc/RazorWolfWound",
	ID = 1165,
    BornPos = sceneData:GetDummyPoint(3,"Q454WolfWound").pos,
	BornDir = sceneData:GetDummyPoint(3,"Q454WolfWound").rot,	
}

QuestClientData.WolfBossData = 
{
	Alias = "WolfBoss",
	Script = "Actor/Npc/RazorWolfBoss",
	ID = 1176,
    BornPos = sceneData:GetDummyPoint(3,"Q454PlayerTalk").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q454PlayerTalk").rot,
}

QuestClientData.Farmer1Data = 
{
	Alias = "Farmer1",
	Script = "Actor/Npc/RazorFarmer",
	ID = 1174,
	BornPos = sceneData:GetDummyPoint(3,"Q454FarmerBorn1").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q454FarmerBorn1").rot,
    TalkPos = sceneData:GetDummyPoint(3,"Q454FarmerTalk1").pos,
    TalkDir = sceneData:GetDummyPoint(3,"Q454FarmerTalk1").rot,
}

QuestClientData.Farmer2Data = 
{
	Alias = "Farmer2",
	Script = "Actor/Npc/RazorFarmer",
	ID = 1175,
	BornPos = sceneData:GetDummyPoint(3,"Q454FarmerBorn2").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q454FarmerBorn2").rot,
    TalkPos = sceneData:GetDummyPoint(3,"Q454FarmerTalk2").pos,
    TalkDir = sceneData:GetDummyPoint(3,"Q454FarmerTalk2").rot,
}

QuestClientData.HerbData = 
{
	Alias = "Herb",
	ID = 100016,
	BornPos = sceneData:GetDummyPoint(3,"Q454WolfBoss").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q454WolfBoss").rot,  
}

QuestClientData.NarratorFlow1 =
{
	{dialogID = 4540205, audioEvtName = "", duration = 5},
}


return QuestClientData