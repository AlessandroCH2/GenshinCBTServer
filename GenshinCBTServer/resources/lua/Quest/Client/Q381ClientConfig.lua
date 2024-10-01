local QuestClientData = {}

QuestClientData.MainID = 381
QuestClientData.ActorAlias = "381"
QuestClientData.SubIDs = 
{
	q38101 = 38101,
    q38102 = 38102,
    q38103 = 38103,
    q38104 = 38104,
    q38105 = 38105,
}

QuestClientData.StoryNarrator =
{
    {dialogID = 3810103, audioEvtName = "", duration = 6.5},
    {dialogID = 3810104, audioEvtName = "", duration = 8.5},
    {dialogID = 3810105, audioEvtName = "", duration = 3},
    {dialogID = 3810106, audioEvtName = "", duration = 7.5},
    {dialogID = 3810107, audioEvtName = "", duration = 3},
    {dialogID = 3810108, audioEvtName = "", duration = 3},
    {dialogID = 3810109, audioEvtName = "", duration = 7.5},
    {dialogID = 3810110, audioEvtName = "", duration = 3},
    {dialogID = 3810111, audioEvtName = "", duration = 3},
    {dialogID = 3810112, audioEvtName = "", duration = 7.5},
    {dialogID = 3810113, audioEvtName = "", duration = 3},
    {dialogID = 3810114, audioEvtName = "", duration = 8.5},
    {dialogID = 3810115, audioEvtName = "", duration = 3},
    {dialogID = 3810116, audioEvtName = "", duration = 3},
    {dialogID = 3810117, audioEvtName = "", duration = 3},
}

QuestClientData.QinData = 
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,
	bornPos = sceneData:GetDummyPoint(1006,"Q381Qin").pos,
	bornDir = sceneData:GetDummyPoint(1006,"Q381Qin").rot,	

}

QuestClientData.DilucData = 
{
	Diluc = "Diluc",
	DilucScript = "Actor/Quest/Q376/Diluc",
	DilucID = 1009,
    bornPos = sceneData:GetDummyPoint(1006,"Q381Diluc").pos,
	bornDir = sceneData:GetDummyPoint(1006,"Q381Diluc").rot,		
}

QuestClientData.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1005,

	bornPos = sceneData:GetDummyPoint(1006,"Q381Paimon").pos,
	bornDir = sceneData:GetDummyPoint(1006,"Q381Paimon").rot,	

}

return QuestClientData