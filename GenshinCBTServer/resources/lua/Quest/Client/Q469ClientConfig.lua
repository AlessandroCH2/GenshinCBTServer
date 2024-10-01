local QuestClientData = {}

QuestClientData.MainID = 469
QuestClientData.ActorAlias = "469"
QuestClientData.SubIDs = 
{
    q46901 = 46901,
    q46902 = 46902,
	q46903 = 46903,
	q46904 = 46904,
}

QuestClientData.PaimonData = 
{
	Paimon = "Paimon469",
	PaimonScript = "Actor/Quest/Q352/Paimon",
    PaimonID = 1483,
    Pos1 = sceneData:GetDummyPoint(3,"Q469Paimon1").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q469Paimon1").rot,			
}

QuestClientData.NarratorData = {
	Story1 = {
    	{dialogID = 4690001, audioEvtName = "", duration = 2},
    	{dialogID = 4690002, audioEvtName = "", duration = 4},
    },
    Story2 = {
    	{dialogID = 4690003, audioEvtName = "", duration = 3},
    	{dialogID = 4690004, audioEvtName = "", duration = 5},
    	{dialogID = 4690005, audioEvtName = "", duration = 4},
    },
}

return QuestClientData