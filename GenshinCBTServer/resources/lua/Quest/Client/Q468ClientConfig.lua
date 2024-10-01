local QuestClientData = {}

QuestClientData.MainID = 468
QuestClientData.ActorAlias = "468"
QuestClientData.SubIDs = 
{
	q46801 = 46801,
	q46803 = 46803,
	q46802 = 46802,
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
    Pos1 = sceneData:GetDummyPoint(3,"Q468Lynn1").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q468Lynn1").rot,		
}

--for test, to be deleted
QuestClientData.GuardData = 
{
	Guard = "Guard",
	GuardScript = "Actor/Quest/Q376/Soldier",
	GuardID = 1217,
    Pos1 = sceneData:GetDummyPoint(3,"Q468Lynn1").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q468Lynn1").rot,	
}

QuestClientData.NarratorData = {
	Story1 = {
    	{dialogID = 4680001, audioEvtName = "", duration = 4},
    },
}

return QuestClientData