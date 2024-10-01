local QuestClientData = {}

QuestClientData.MainID = 453
QuestClientData.ActorAlias = "453"
QuestClientData.SubIDs = 
{
	q45301 = 45301,
    q45302 = 45302,
    q45303 = 45303,
    q45304 = 45304,
    q45305 = 45305,
    q45306 = 45306,
}

QuestClientData.AmborData = 
{
	Alias = "Ambor",
	Script = "Actor/Quest/Q301/Ambor301",
	ID = 1002,
	BornPos = sceneData:GetDummyPoint(3,"Q453AmborTalk").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q453AmborTalk").rot,
}

QuestClientData.PaimonData = 
{
	Alias = "Paimon",
	Script = "Actor/Quest/Q352/Paimon",
	ID = 1005,
	BornPos = { sceneData:GetDummyPoint(3,"Q453AmborTalk").pos.x+1, sceneData:GetDummyPoint(3,"Q453AmborTalk").pos.y, sceneData:GetDummyPoint(3,"Q453AmborTalk").pos.z },
	BornDir = sceneData:GetDummyPoint(3,"Q453AmborTalk").rot,	
}

QuestClientData.FarmerOldData = 
{
	Alias = "FarmerOldData",
	Script = "Actor/Npc/RazorFarmer",
	ID = 1167,
	BornPos = sceneData:GetDummyPoint(3,"Q453FarmerOld").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q453FarmerOld").rot,
}

QuestClientData.FarmerAngryData = 
{
	Alias = "FarmerAngry",
	Script = "Actor/Npc/RazorFarmer",
	ID = 1168,
	BornPos = sceneData:GetDummyPoint(3,"Q453Farmer1").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q453Farmer1").rot,
}

QuestClientData.Farmer2Data = 
{
	Alias = "Farmer2",
	Script = "Actor/Npc/RazorFarmer",
	ID = 1169,
	BornPos = sceneData:GetDummyPoint(3,"Q453Farmer2").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q453Farmer2").rot,
}

QuestClientData.Farmer3Data = 
{
	Alias = "Farmer3",
	Script = "Actor/Npc/RazorFarmer",
	ID = 1170,
	BornPos = sceneData:GetDummyPoint(3,"Q453Farmer3").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q453Farmer3").rot,
}

QuestClientData.FarmerWound1Data = 
{
	Alias = "FarmerWound1",
	Script = "Actor/Npc/RazorFarmer",
	ID = 1171,
	BornPos = sceneData:GetDummyPoint(3,"Q453FarmerWound1").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q453FarmerWound1").rot,
}

QuestClientData.FarmerWound2Data = 
{
	Alias = "FarmerWound2",
	Script = "Actor/Npc/RazorFarmer",
	ID = 1172,
	BornPos = sceneData:GetDummyPoint(3,"Q453FarmerWound2").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q453FarmerWound2").rot,
}

QuestClientData.FarmerWound3Data = 
{
	Alias = "FarmerWound3",
	Script = "Actor/Npc/RazorFarmer",
	ID = 1173,
	BornPos = sceneData:GetDummyPoint(3,"Q453FarmerWound3").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q453FarmerWound3").rot,
}

QuestClientData.FarmerAngry1Data = 
{
	Alias = "FarmerAngry1",
	Script = "Actor/Npc/RazorFarmer",
	ID = 1174,
	BornPos = sceneData:GetDummyPoint(3,"Q453FarmerAngery1").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q453FarmerAngery1").rot,
}

QuestClientData.FarmerAngry2Data = 
{
	Alias = "FarmerAngry2",
	Script = "Actor/Npc/RazorFarmer",
	ID = 1175,
	BornPos = sceneData:GetDummyPoint(3,"Q453FarmerAngery2").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q453FarmerAngery2").rot,
}

QuestClientData.PawHintData = 
{
	Alias = "PawHint",
	ID = 100155,
	BornPos = sceneData:GetDummyPoint(3,"Q453PawHint").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q453PawHint").rot,
}

QuestClientData.ShitHintData = 
{
	Alias = "ShitHint",
	ID = 100156,
	BornPos = sceneData:GetDummyPoint(3,"Q453ShitHint").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q453ShitHint").rot,
}

QuestClientData.HairHintData = 
{
	Alias = "HairHint",
	ID = 100157,
	BornPos = sceneData:GetDummyPoint(3,"Q453HairHint").pos,
    BornDir = sceneData:GetDummyPoint(3,"Q453HairHint").rot,
}

QuestClientData.NarratorFlow1 =
{
	{dialogID = 4530205, audioEvtName = "", duration = 5},
}

QuestClientData.NarratorFlow2 =
{
	{dialogID = 4530206, audioEvtName = "", duration = 4},
}

QuestClientData.NarratorFlow3 =
{
	{dialogID = 4530207, audioEvtName = "", duration = 4},
}

QuestClientData.NarratorFlow4 =
{
	{dialogID = 4530208, audioEvtName = "", duration = 4},
}


return QuestClientData