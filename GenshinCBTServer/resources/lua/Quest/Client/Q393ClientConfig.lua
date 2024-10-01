local QuestClientData = {}

QuestClientData.MainID = 393
QuestClientData.ActorAlias = "393"
QuestClientData.SubIDs = 
{
	q39301 = 39301,
	q39302 = 39302,
	q39303 = 39303
}

QuestClientData.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
    WendyID = 1001,
    bornPos = sceneData:GetDummyPoint(3,"Q389VentiPos2").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q389VentiPos2").rot,
	bornPos2 = sceneData:GetDummyPoint(3,"Q393WendyPos").pos,
    bornDir2 = sceneData:GetDummyPoint(3,"Q393WendyPos").rot,
}

QuestClientData.QinData = 
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,
	bornPos = sceneData:GetDummyPoint(3,"Q389QinPos2").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q389QinPos2").rot,
	bornPos2 = sceneData:GetDummyPoint(3,"Q393QinPos").pos,
    bornDir2 = sceneData:GetDummyPoint(3,"Q393QinPos").rot,
}

QuestClientData.DilucData = 
{
	Diluc = "Diluc",
	DilucScript = "Actor/Quest/Q376/Diluc",
	DilucID = 1009,
    bornPos = sceneData:GetDummyPoint(3,"Q389DilucPos2").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q389DilucPos2").rot,
	bornPos2 = sceneData:GetDummyPoint(3,"Q393DilucPos").pos,
    bornDir2 = sceneData:GetDummyPoint(3,"Q393DilucPos").rot,
}

QuestClientData.NarratorData = {
	Story1 = {
        {dialogID = 3920801, duration = 3},
        {dialogID = 3920802, duration = 3},
	}
}
return QuestClientData