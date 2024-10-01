local QuestClientData = {}

QuestClientData.MainID = 389
QuestClientData.ActorAlias = "389"
QuestClientData.SubIDs = 
{
	q38901 = 38901,
    q38902 = 38902,
    q38903 = 38903,
	q38904 = 38904,
	q38905 = 38905,
	q38906 = 38906,
	q38907 = 38907,
}

QuestClientData.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
    WendyID = 1001,
    bornPos1 = sceneData:GetDummyPoint(3,"Q389VentiPos1").pos,
	bornDir1 = sceneData:GetDummyPoint(3,"Q389VentiPos1").rot,
	bornPos2 = sceneData:GetDummyPoint(3,"Q389VentiPos2").pos,
	bornDir2 = sceneData:GetDummyPoint(3,"Q389VentiPos2").rot,
}

QuestClientData.QinData = 
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,
	bornPos1 = sceneData:GetDummyPoint(3,"Q389QinPos1").pos,
	bornDir1 = sceneData:GetDummyPoint(3,"Q389QinPos1").rot,	
	bornPos2 = sceneData:GetDummyPoint(3,"Q389QinPos2").pos,
	bornDir2 = sceneData:GetDummyPoint(3,"Q389QinPos2").rot,
}

QuestClientData.DilucData = 
{
	Diluc = "Diluc",
	DilucScript = "Actor/Quest/Q376/Diluc",
	DilucID = 1009,
    bornPos1 = sceneData:GetDummyPoint(3,"Q389DilucPos1").pos,
	bornDir1 = sceneData:GetDummyPoint(3,"Q389DilucPos1").rot,
	bornPos2 = sceneData:GetDummyPoint(3,"Q389DilucPos2").pos,
	bornDir2 = sceneData:GetDummyPoint(3,"Q389DilucPos2").rot,	
}

QuestClientData.NarratorData = {
	Story1 = {
        {dialogID = 3890101, duration = 5},
        {dialogID = 3890102, duration = 5},
		{dialogID = 3890103, duration = 5},
		{dialogID = 3890104, duration = 5},
	},

	Story2 = {
        {dialogID = 3890401, duration = 5},
        {dialogID = 3890402, duration = 7},
		{dialogID = 3890403, duration = 5},
		{dialogID = 3890404, duration = 8},
		{dialogID = 3890405, duration = 5},
		{dialogID = 3890406, duration = 5},
		{dialogID = 3890407, duration = 5},
		{dialogID = 3890408, duration = 5},
		{dialogID = 3890409, duration = 5},
	},

	Story3 = {
        {dialogID = 3890501, duration = 3},
		{dialogID = 3890502, duration = 3},
	}
}

return QuestClientData