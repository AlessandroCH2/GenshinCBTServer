local QuestClientData = {}

QuestClientData.MainID = 396
QuestClientData.ActorAlias = "396"
QuestClientData.SubIDs = 
{
	q39601 = 39601,
    q39602 = 39602,
    q39603 = 39603,
    q39604 = 39604,
    q39605 = 39605,
    q39606 = 39606,
}

QuestClientData.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
    WendyID = 1001,
    bornPos = sceneData:GetDummyPoint(1008, "Q396Wendy").pos,
    bornDir = sceneData:GetDummyPoint(1008, "Q396Wendy").rot,	
    disPos = sceneData:GetDummyPoint(1008, "Q396Wendydis").pos,
    disDir = sceneData:GetDummyPoint(1008, "Q396Wendydis").rot,	
}

QuestClientData.BarbaraData = 
{
	Barbara = "Barbara",
	BarbaraScript = "Actor/Quest/Q413/Barbara",
	BarbaraID = 1008,
    bornPos = sceneData:GetDummyPoint(1008,"Q396BBR").pos,
    bornDir = sceneData:GetDummyPoint(1008,"Q396BBR").rot,	
    disPos = sceneData:GetDummyPoint(1008,"Q396BBRdis").pos,
    disDir = sceneData:GetDummyPoint(1008,"Q396BBRdis").rot,	
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