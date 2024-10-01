local QuestClientData = {}

QuestClientData.MainID = 994
QuestClientData.ActorAlias = "994"
QuestClientData.SubIDs = 
{
	q99401 = 99401,


}

QuestClientData.QinData = 
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,

	bornPos = sceneData:GetDummyPoint(1004,"Q358Qin").pos,
	bornDir = sceneData:GetDummyPoint(1004,"Q358Qin").rot,	

}

return QuestClientData