local QuestClientData = {}

QuestClientData.MainID = 380
QuestClientData.ActorAlias = "380"
QuestClientData.SubIDs = 
{
	q38001 = 38001,
    q38002 = 38002,
    q38003 = 38003,
    q38004 = 38004,

}

QuestClientData.StoryNarrator =
{
	{dialogID = 3800101, audioEvtName = "", duration = 7.5},
    {dialogID = 3800102, audioEvtName = "", duration = 3},
    {dialogID = 3800103, audioEvtName = "", duration = 3},
    {dialogID = 3800104, audioEvtName = "", duration = 8.5},
    {dialogID = 3800105, audioEvtName = "", duration = 6.5},
    {dialogID = 3800106, audioEvtName = "", duration = 3},
    {dialogID = 3800107, audioEvtName = "", duration = 3},
    {dialogID = 3800108, audioEvtName = "", duration = 7.5},
    {dialogID = 3800109, audioEvtName = "", duration = 6.5},
    {dialogID = 3800110, audioEvtName = "", duration = 6.5},
    {dialogID = 3800111, audioEvtName = "", duration = 7.5},
    {dialogID = 3800112, audioEvtName = "", duration = 3},
}

QuestClientData.QinData = 
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,
	bornPos = sceneData:GetDummyPoint(3,"Q380Qin").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q380Qin").rot,	

}

QuestClientData.TreasureData = 
{
	GadgetID = 70210041,
	DropId = 403020,
	ShowCutscene = true,
	bornPos = { x = 2356.9, y = 283.9, z = -1739.7 }, 
	bornDir = { x = 0.0, y = 247.1, z = 0.0 },
}

QuestClientData.DilucData = 
{
	Diluc = "Diluc",
	DilucScript = "Actor/Quest/Q376/Diluc",
	DilucID = 1009,
    bornPos = sceneData:GetDummyPoint(3,"Q380Diluc").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q380Diluc").rot,		
}

QuestClientData.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1005,

	bornPos = sceneData:GetDummyPoint(3,"Q380Paimon").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q380Paimon").rot,	

}

return QuestClientData