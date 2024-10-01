local QuestClientData = {}

QuestClientData.MainID = 425
QuestClientData.ActorAlias = "425"
QuestClientData.SubIDs = 
{
	q42501 = 42501,
	q42502 = 42502,
	q42503 = 42503,
	q42504 = 42504,
}


QuestClientData.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
	WendyID = 1160,

	bornPos = sceneData:GetDummyPoint(1015,"QuestNpc").pos,
	bornDir = sceneData:GetDummyPoint(1015,"QuestNpc").rot,	
}

QuestClientData.WindCushionData = 
{
	WindCushion = "WindCushion",
	WindCushionID = 70300058,

	bornPos = sceneData:GetDummyPoint(1015,"WindCushion01").pos,
	bornDir = sceneData:GetDummyPoint(1015,"WindCushion01").rot,	
}

QuestClientData.WindFlowData = 
{
	WindFlow = "WindFlow",
	WindFlowID = 40200002,

	bornPos = sceneData:GetDummyPoint(1015,"WindBed02").pos,
	bornDir = sceneData:GetDummyPoint(1015,"WindBed02").rot,	
}

return QuestClientData