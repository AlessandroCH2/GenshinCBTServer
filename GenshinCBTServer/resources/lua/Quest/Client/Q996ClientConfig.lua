local QuestClientData = {}

QuestClientData.MainID = 996
QuestClientData.ActorAlias = "996"
QuestClientData.SubIDs = 
{
	q99601 = 99601,
	q99602 = 99602,

}

QuestClientData.GaiaData = 
{
	Gaia = "Gaia",
	GaiaScript = "Actor/Quest/Q301/Gaia301",
	GaiaID = 1004,

	bornPos = sceneData:GetDummyPoint(1008,"Q996Kaeya").pos,
	bornDir = sceneData:GetDummyPoint(1008,"Q996Kaeya").rot,

}

return QuestClientData