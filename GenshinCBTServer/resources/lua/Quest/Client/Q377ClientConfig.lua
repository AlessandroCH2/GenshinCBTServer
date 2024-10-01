local QuestClientData = {}

QuestClientData.MainID = 377
QuestClientData.ActorAlias = "377"
QuestClientData.SubIDs = 
{
	q37701 = 37701,
	q37702 = 37702,
	q37703 = 37703,
	q37704 = 37704,
	q37705 = 37705,

}

QuestClientData.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
	WendyID = 1001,
    bornPos = sceneData:GetDummyPoint(1009,"Q37702Venti").pos,
	bornDir = sceneData:GetDummyPoint(1009,"Q37702Venti").rot,		

}

QuestClientData.DilucData = 
{
	Diluc = "Diluc",
	DilucScript = "Actor/Quest/Q376/Diluc",
	DilucID = 1009,
    bornPos = sceneData:GetDummyPoint(1009,"Q37702Diluc").pos,
	bornDir = sceneData:GetDummyPoint(1009,"Q37702Diluc").rot,		
}

QuestClientData.QinData = 
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,
	bornPos = sceneData:GetDummyPoint(1009,"Q37702Qin").pos,
	bornDir = sceneData:GetDummyPoint(1009,"Q37702Qin").rot,	
	desPos = sceneData:GetDummyPoint(1009,"Q376SoldierDes").pos,
    desDir = sceneData:GetDummyPoint(1009,"Q376SoldierDes").rot,	

}

return QuestClientData