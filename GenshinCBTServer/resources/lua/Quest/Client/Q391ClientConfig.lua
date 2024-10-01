local QuestClientData = {}

QuestClientData.MainID = 391
QuestClientData.ActorAlias = "391"
QuestClientData.SubIDs = 
{
	q39101 = 39101,
    q39102 = 39102,
    q39103 = 39103,
    q39104 = 39104,
    q39105 = 39105,
    q39106 = 39106,
    q39107 = 39107,
    q39108 = 39108,
    q39109 = 39109,
    q39110 = 39110
}

QuestClientData.WendyData =
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
    WendyID = 1001,
    bornPos = sceneData:GetDummyPoint(3,"Q391Wendy").pos,
    bornDir = sceneData:GetDummyPoint(3,"Q391Wendy").rot
}

QuestClientData.DilucData =
{
	Diluc = "Diluc",
	DilucScript = "Actor/Quest/Q376/Diluc",
	DilucID = 1009,
    bornPos = sceneData:GetDummyPoint(3,"Q391Diluc").pos,
    bornDir = sceneData:GetDummyPoint(3,"Q391Diluc").rot,
}

QuestClientData.QinData =
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,
	bornPos = sceneData:GetDummyPoint(3,"Q391Qin").pos,
    bornDir = sceneData:GetDummyPoint(3,"Q391Qin").rot,	
}

QuestClientData.PaimonData =
{
    Paimon = "Paimon",
    PaimonScript = "Actor/Quest/Q352/Paimon",
    PaimonID = 1005,
    bornPos = sceneData:GetDummyPoint(3,"Q391Paimon").pos,
    bornDir = sceneData:GetDummyPoint(3,"Q391Paimon").rot,	
}

QuestClientData.OrganData =
{
    bornPos = sceneData:GetDummyPoint(3,"Q391OrganPos").pos,
    bornDir = sceneData:GetDummyPoint(3,"Q391OrganPos").rot,
}

QuestClientData.SealOpenTimeCfg1 =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_MDAQ501_DvalinSealOpen01",
	startPosType = CutsceneInitPosType.FREE,
    startOffset = {0, 0, 0},
    fadeInDuration = 1
}

QuestClientData.SealOpenTimeCfg2 =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_MDAQ501_DvalinSealOpen02",
	startPosType = CutsceneInitPosType.FREE,
    startOffset = {0, 0, 0},
    fadeInDuration = 1
}

QuestClientData.SealOpenTimeCfg3 =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_MDAQ501_DvalinSealOpen03",
	startPosType = CutsceneInitPosType.FREE,
    startOffset = {0, 0, 0},
    fadeInDuration = 1
}

QuestClientData.SealAppearTimeCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_MDAQ501_DvalinSeal02Appear",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0},
    fadeInDuration = 0
}

QuestClientData.NarratorData =
{
    FindOrgan1 =
    {
        {dialogID = 3900101, duration = 3},
        {dialogID = 3900102, duration = 3},
        {dialogID = 3900103, duration = 3}
    },

    -- FindOrgan2 =
    -- {
    --     {dialogID = 3910101, duration = 3},
    --     {dialogID = 3910102, duration = 3},
    -- },

    -- FindOrgan3 =
    -- {
    --     {dialogID = 3920101, duration = 3},
    --     {dialogID = 3920102, duration = 3},
    -- },

    OpenOrgan1 =
    {
        {dialogID = 3900801, duration = 3},
        {dialogID = 3900802, duration = 3},
        {dialogID = 3900803, duration = 3}
    },

    OpenOrgan2 =
    {
        {dialogID = 3910801, duration = 3},
        {dialogID = 3910802, duration = 3},
    },

    OpenOrgan3 =
    {
        {dialogID = 3920801, duration = 3},
        {dialogID = 3920802, duration = 3},
    },

    FindClue1_1 = 
    {
        {dialogID = 3900401, duration = 3}
    },

    FindClue1_3 = 
    {
        {dialogID = 3900601, duration = 3}
    },

    FindClue2_2 = 
    {
        {dialogID = 3910501, duration = 3}
    },

    FindClue3_3 = 
    {
        {dialogID = 3920601, duration = 3}
    },
}

return QuestClientData