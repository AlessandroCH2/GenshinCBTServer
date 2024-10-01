local QuestClientData = {}

QuestClientData.MainID = 388
QuestClientData.ActorAlias = "388"
QuestClientData.SubIDs = 
{
	q38801 = 38801,
    q38802 = 38802,
    q38803 = 38803,
	q38804 = 38804,
	q38805 = 38805,
	q38806 = 38806,
	q38807 = 38807,
}

QuestClientData.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
    WendyID = 1001,
    bornPos = sceneData:GetDummyPoint(1004,"Q388Venti").pos,
    bornDir = sceneData:GetDummyPoint(1004,"Q388Venti").rot,	
    born2Pos = sceneData:GetDummyPoint(3,"Q38802Venti").pos,
	born2Dir = sceneData:GetDummyPoint(3,"Q38802Venti").rot,
	born3Pos = sceneData:GetDummyPoint(3,"Q388Venti").pos,
	born3Dir = sceneData:GetDummyPoint(3,"Q388Venti").rot,
	dis1Pos = sceneData:GetDummyPoint(3,"Q38802VentiDes1").pos,
	dis1Dir = sceneData:GetDummyPoint(3,"Q38802VentiDes1").rot,	
	dis2Pos = sceneData:GetDummyPoint(3,"Q38802VentiDes2").pos,
    dis2Dir = sceneData:GetDummyPoint(3,"Q38802VentiDes2").rot,
}

QuestClientData.QinData = 
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,
	bornPos = sceneData:GetDummyPoint(1004,"Q370QinInside").pos,
    bornDir = sceneData:GetDummyPoint(1004,"Q370QinInside").rot,	
    born2Pos = sceneData:GetDummyPoint(3,"Q38802Qin").pos,
	born2Dir = sceneData:GetDummyPoint(3,"Q38802Qin").rot,	
	born3Pos = sceneData:GetDummyPoint(3,"Q388Qin").pos,
	born3Dir = sceneData:GetDummyPoint(3,"Q388Qin").rot,
	dis1Pos = sceneData:GetDummyPoint(3,"Q38803QinDes1").pos,
	dis1Dir = sceneData:GetDummyPoint(3,"Q38803QinDes1").rot,	
	dis2Pos = sceneData:GetDummyPoint(3,"Q38802QinDes2").pos,
    dis2Dir = sceneData:GetDummyPoint(3,"Q38802QinDes2").rot,	
}

QuestClientData.DilucData = 
{
	Diluc = "Diluc",
	DilucScript = "Actor/Quest/Q376/Diluc",
	DilucID = 1009,
    born2Pos = sceneData:GetDummyPoint(3,"Q38802Diluc").pos,
	born2Dir = sceneData:GetDummyPoint(3,"Q38802Diluc").rot,	
	born3Pos = sceneData:GetDummyPoint(3,"Q388Diluc").pos,
	born3Dir = sceneData:GetDummyPoint(3,"Q388Diluc").rot,	
	dis1Pos = sceneData:GetDummyPoint(3,"Q38802DilucDes1").pos,
	dis1Dir = sceneData:GetDummyPoint(3,"Q38802DilucDes1").rot,	
	dis2Pos = sceneData:GetDummyPoint(3,"Q38802DilucDes2").pos,
    dis2Dir = sceneData:GetDummyPoint(3,"Q38802DilucDes2").rot,
}

QuestClientData.NarratorData = {
	Story1 = {
        {dialogID = 3880202, duration = 5},
        {dialogID = 3880203, duration = 5},
		{dialogID = 3880204, duration = 5},
		{dialogID = 3880205, duration = 5},
	}
}

return QuestClientData