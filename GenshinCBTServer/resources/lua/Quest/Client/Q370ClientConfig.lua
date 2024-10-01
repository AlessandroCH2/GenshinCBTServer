local QuestClientData = {}

QuestClientData.MainID = 370
QuestClientData.ActorAlias = "370"
QuestClientData.SubIDs = 
{
	q37001 = 37001,
	q37002 = 37002,
	q37003 = 37003,
}

QuestClientData.QinData = 
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,

	bornPos = sceneData:GetDummyPoint(1004,"Q358Qin").pos,
	bornDir = sceneData:GetDummyPoint(1004,"Q358Qin").rot,	

}

QuestClientData.AmborData = 
{
	Ambor = "Ambor",
	AmborScript = "Actor/Quest/Q301/Ambor301",
	AmborID = 1002,

	bornPos = sceneData:GetDummyPoint(1004,"Q358Ambor").pos,
	bornDir = sceneData:GetDummyPoint(1004,"Q358Ambor").rot,	

}

QuestClientData.LisaData = 
{
	Lisa = "Lisa",
	LisaScript = "Actor/Quest/Q411/Lisa",
	LisaID = 1007,

	bornPos = sceneData:GetDummyPoint(1004,"Q358Lisa").pos,
	bornDir = sceneData:GetDummyPoint(1004,"Q358Lisa").rot,	

}

QuestClientData.GaiaData = 
{
	Gaia = "GaiaSP",
	GaiaScript = "Actor/Quest/Q301/Gaia301",
	GaiaID = 1014,

	bornPos = sceneData:GetDummyPoint(1004,"Q358Kaeya").pos,
	bornDir = sceneData:GetDummyPoint(1004,"Q358Kaeya").rot,

}

QuestClientData.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1005,

	bornPos = sceneData:GetDummyPoint(1004,"Q358Paimon").pos,
	bornDir = sceneData:GetDummyPoint(1004,"Q358Paimon").rot,	

}

return QuestClientData