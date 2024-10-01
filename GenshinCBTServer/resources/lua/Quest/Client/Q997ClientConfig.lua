local QuestClientData = {}

QuestClientData.MainID = 997
QuestClientData.ActorAlias = "997"
QuestClientData.SubIDs = 
{
	q99701 = 99701,

}

QuestClientData.QinData = 
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,

	bornPos = sceneData:GetDummyPoint(1004,"Q370Qin").pos,
	bornDir = sceneData:GetDummyPoint(1004,"Q370Qin").rot,	

}

QuestClientData.AmborData = 
{
	Ambor = "Ambor",
	AmborScript = "Actor/Quest/Q301/Ambor301",
	AmborID = 1002,

	bornPos = sceneData:GetDummyPoint(1004,"Q370Ambor").pos,
	bornDir = sceneData:GetDummyPoint(1004,"Q370Ambor").rot,	

}

QuestClientData.LisaData = 
{
	Lisa = "Lisa",
	LisaScript = "Actor/Quest/Q411/Lisa",
	LisaID = 1007,

	bornPos = sceneData:GetDummyPoint(1004,"Q370Lisa").pos,
	bornDir = sceneData:GetDummyPoint(1004,"Q370Lisa").rot,	

}

QuestClientData.GaiaData = 
{
	Gaia = "Gaia",
	GaiaScript = "Actor/Quest/Q301/Gaia301",
	GaiaID = 1004,

	bornPos = sceneData:GetDummyPoint(1004,"Q370Gaia").pos,
	bornDir = sceneData:GetDummyPoint(1004,"Q370Gaia").rot,

}

return QuestClientData