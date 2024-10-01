local QuestClientData = {}

QuestClientData.MainID = 371
QuestClientData.ActorAlias = "371"
QuestClientData.SubIDs = 
{
	q37101 = 37101,
    q37102 = 37102,
	q37103 = 37103,
	q37104 = 37104,
	q37105 = 37105,
	q37106 = 37106,
	q37107 = 37107,
	q37108 = 37108,
	q37109 = 37109,
	q37110 = 37110,
	q37111 = 37111,
	q37112 = 37112,
	q37113 = 37113,
	q37114 = 37114,
	q37115 = 37115,
}

QuestClientData.PaimonData = 
{
	Paimon = "PaimonNew",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1243,

	bornPos = sceneData:GetDummyPoint(3,"Q371PaimonTemp").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q371PaimonTemp").rot,	

}

QuestClientData.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
	WendyID = 1160,

	bornPos = sceneData:GetDummyPoint(3,"Q371Wendy").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q371Wendy").rot,
	cameraPos = sceneData:GetDummyPoint(3,"Q371WendyCamera").pos,
	cameraDir = sceneData:GetDummyPoint(3,"Q371WendyCamera").rot,
	run1Pos = sceneData:GetDummyPoint(3,"Q371WendyRun1").pos,
	run1Dir = sceneData:GetDummyPoint(3,"Q371WendyRun1").rot,	
	run2Pos = sceneData:GetDummyPoint(3,"Q371WendyRun2").pos,
	run2Dir = sceneData:GetDummyPoint(3,"Q371WendyRun2").rot,	
}


return QuestClientData