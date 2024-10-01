local QuestClientData = {}

QuestClientData.MainID = 451
QuestClientData.ActorAlias = "451"
QuestClientData.SubIDs = 
{
	q45101 = 45101,
    q45102 = 45102,
    q45103 = 45103,
    q45104 = 45104,

}

QuestClientData.RazorData = 
{
	Alias = "Razor",
	Script = "Actor/Npc/Razor",
	ID = 1011,
    BornPos = sceneData:GetDummyPoint(3,"Q451WolfRunStart").pos,
	BornDir = sceneData:GetDummyPoint(3,"Q451WolfRunStart").rot,	
}

QuestClientData.PaimonData = 
{
	Alias = "Paimon",
	Script = "Actor/Quest/Q352/Paimon",
	ID = 1005,
	BornPos = sceneData:GetDummyPoint(3,"Q451WolfRunStart").pos,
	BornDir = sceneData:GetDummyPoint(3,"Q451WolfRunStart").rot,	
}

QuestClientData.NarratorFlow1 =
{
	{dialogID = 4510001, audioEvtName = "", duration = 5},
}

QuestClientData.NarratorFlow2 =
{
	{dialogID = 4510201, audioEvtName = "", duration = 5},
}

return QuestClientData