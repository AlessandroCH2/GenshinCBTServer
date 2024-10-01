local QuestClientData = {}

QuestClientData.MainID = 383
QuestClientData.ActorAlias = "383"
QuestClientData.SubIDs = 
{
	q38301 = 38301,
    q38302 = 38302,
    q38303 = 38303,
    q38304 = 38304,
}

QuestClientData.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
	WendyID = 1001,
    bornPos = sceneData:GetDummyPoint(3,"Q383WendyTemp").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q383WendyTemp").rot,
	bornPos2 = sceneData:GetDummyPoint(3,"Q384WendyTemp").pos,
	bornDir2 = sceneData:GetDummyPoint(3,"Q384WendyTemp").rot,				

}

QuestClientData.DilucData = 
{
	Diluc = "Diluc",
	DilucScript = "Actor/Quest/Q376/Diluc",
	DilucID = 1009,
    bornPos = sceneData:GetDummyPoint(3,"Q383DilucTemp").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q383DilucTemp").rot,	
	bornPos2 = sceneData:GetDummyPoint(3,"Q384DilucTemp").pos,
	bornDir2 = sceneData:GetDummyPoint(3,"Q384DilucTemp").rot,		
}

QuestClientData.QinData = 
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,
	bornPos = sceneData:GetDummyPoint(3,"Q383QinTemp").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q383QinTemp").rot,	
	bornPos2 = sceneData:GetDummyPoint(3,"Q384QinTemp").pos,
	bornDir2 = sceneData:GetDummyPoint(3,"Q384QinTemp").rot,	
}

return QuestClientData