local QuestClientData = {}

QuestClientData.MainID = 394
QuestClientData.ActorAlias = "394"
QuestClientData.SubIDs = 
{
	q39401 = 39401,
    q39402 = 39402,
    q39403 = 39403,
}

QuestClientData.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
    WendyID = 1001,
    bornPos = sceneData:GetDummyPoint(1008, "Q396Wendy").pos,
    bornDir = sceneData:GetDummyPoint(1008, "Q396Wendy").rot,	
}

QuestClientData.BarbaraData = 
{
	Barbara = "Barbara",
	BarbaraScript = "Actor/Quest/Q413/Barbara",
	BarbaraID = 1008,
    bornPos = sceneData:GetDummyPoint(1008,"Q396BBR").pos,
    bornDir = sceneData:GetDummyPoint(1008,"Q396BBR").rot,		
}

QuestClientData.QinData = 
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,
	bornPos = sceneData:GetDummyPoint(1008,"Q396Qin").pos,
    bornDir = sceneData:GetDummyPoint(1008,"Q396Qin").rot,	
}

return QuestClientData