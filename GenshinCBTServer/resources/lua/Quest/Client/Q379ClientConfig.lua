local QuestClientData = {}

QuestClientData.MainID = 379
QuestClientData.ActorAlias = "379"
QuestClientData.SubIDs = 
{
	q37901 = 37901,
    q37902 = 37902,
    q37903 = 37903,
    q37904 = 37904,
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

}

QuestClientData.StoryNarrator =
{
	{dialogID = 3820201, audioEvtName = "", duration = 8.5},
    {dialogID = 3820202, audioEvtName = "", duration = 7.5},
    {dialogID = 3820203, audioEvtName = "", duration = 7.5},
    {dialogID = 3820204, audioEvtName = "", duration = 6.5},
    {dialogID = 3820205, audioEvtName = "", duration = 7.5},
    {dialogID = 3820206, audioEvtName = "", duration = 7.5},
    {dialogID = 3820207, audioEvtName = "", duration = 3},
    {dialogID = 3820208, audioEvtName = "", duration = 6.5},
    {dialogID = 3820209, audioEvtName = "", duration = 7.5},
    {dialogID = 3820210, audioEvtName = "", duration = 3},
    {dialogID = 3820211, audioEvtName = "", duration = 8.5},
    {dialogID = 3820212, audioEvtName = "", duration = 7.5},
    {dialogID = 3820213, audioEvtName = "", duration = 6.5},
    {dialogID = 3820214, audioEvtName = "", duration = 9.5},
    {dialogID = 3820215, audioEvtName = "", duration = 9.5},
    {dialogID = 3820216, audioEvtName = "", duration = 7.5},
    {dialogID = 3820217, audioEvtName = "", duration = 9.5},
}

return QuestClientData