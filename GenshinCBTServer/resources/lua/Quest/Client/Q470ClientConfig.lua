local QuestClientData = {}

QuestClientData.MainID = 470
QuestClientData.ActorAlias = "470"
QuestClientData.SubIDs = 
{
	q47001 = 47001,
	q47002 = 47002,
    q47003 = 47003,
    q47004 = 47004,
}

QuestClientData.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1005,		
}

QuestClientData.SaraData = 
{
	Sara = "Sara",
	LynnScript = "Actor/Npc/NpcMengdeInsomniaStand",
    LynnID = 1419,
    Pos = sceneData:GetDummyPoint(3,"Q470ShopLookAt").pos,
    Dir = sceneData:GetDummyPoint(3,"Q470ShopLookAt").rot,		
}

return QuestClientData