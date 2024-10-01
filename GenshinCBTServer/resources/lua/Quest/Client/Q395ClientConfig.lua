local QuestClientData = {}

QuestClientData.MainID = 395
QuestClientData.ActorAlias = "395"
QuestClientData.SubIDs = 
{
	q39501 = 39501,
    q39502 = 39502,
	q39503 = 39503,
}


QuestClientData.BarbaraData = 
{
	Barbara = "Barbara",
	BarbaraScript = "Actor/Quest/Q413/Barbara",
	BarbaraID = 1008,
    bornPos = sceneData:GetDummyPoint(3,"Q395BBR").pos,
    bornDir = sceneData:GetDummyPoint(3,"Q395BBR").rot,	
}

return QuestClientData