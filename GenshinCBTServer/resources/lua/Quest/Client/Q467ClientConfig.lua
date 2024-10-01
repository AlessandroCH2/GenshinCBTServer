local QuestClientData = {}

QuestClientData.MainID = 467
QuestClientData.ActorAlias = "467"
QuestClientData.SubIDs = 
{
	q46701 = 46701,
	q46703 = 46703,
	q46702 = 46702,
}

QuestClientData.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1005,		
}

QuestClientData.LynnData = 
{
	Lynn = "Lynn",
	LynnScript = "Actor/Npc/Config/CfgMengdeInsomniaStand",
    LynnID = 1479,
    Pos1 = sceneData:GetDummyPoint(3,"Q467Lynn1").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q467Lynn1").rot,		
}

--for test, to be deleted
QuestClientData.GuardData = 
{
	Guard = "Guard",
	GuardScript = "Actor/Quest/Q376/Soldier",
	GuardID = 1217,
    Pos1 = sceneData:GetDummyPoint(3,"Q467Lynn1").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q467Lynn1").rot,	
}

QuestClientData.NarratorData = {
	Story1 = {
    	{dialogID = 4670001, audioEvtName = "", duration = 4},
    },
}

return QuestClientData