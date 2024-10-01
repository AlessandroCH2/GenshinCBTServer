local QuestClientData = {}

QuestClientData.MainID = 384
QuestClientData.ActorAlias = "384"
QuestClientData.SubIDs = 
{
	q38401 = 38401,
    q38402 = 38402,
    q38403 = 38403,
    q38404 = 38404,
    q38405 = 38405,
	q38406 = 38406,
	q38407 = 38407,
	q38408 = 38408,
	q38409 = 38409,
	q38410 = 38410,
}

QuestClientData.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
    WendyID = 1001,
    bornPos1 = sceneData:GetDummyPoint(3,"Q384WendyTemp").pos,
	bornDir1 = sceneData:GetDummyPoint(3,"Q384WendyTemp").rot,	
    bornPos2 = sceneData:GetDummyPoint(3,"Q384Wendy").pos,
	bornDir2 = sceneData:GetDummyPoint(3,"Q384Wendy").rot,		
    bornPos3 = sceneData:GetDummyPoint(3,"Q388Venti").pos,
    bornDir3 = sceneData:GetDummyPoint(3,"Q388Venti").rot,
}

QuestClientData.DilucData = 
{
	Diluc = "Diluc",
	DilucScript = "Actor/Quest/Q376/Diluc",
	DilucID = 1009,
    bornPos1 = sceneData:GetDummyPoint(3,"Q384DilucTemp").pos,
    bornDir1 = sceneData:GetDummyPoint(3,"Q384DilucTemp").rot,	
    bornPos2 = sceneData:GetDummyPoint(3,"Q384Diluc").pos,
	bornDir2 = sceneData:GetDummyPoint(3,"Q384Diluc").rot,	
	bornPos3 = sceneData:GetDummyPoint(3,"Q388Diluc").pos,
	bornDir3 = sceneData:GetDummyPoint(3,"Q388Diluc").rot,			
}

QuestClientData.QinData = 
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,
	bornPos1 = sceneData:GetDummyPoint(3,"Q384QinTemp").pos,
    bornDir1 = sceneData:GetDummyPoint(3,"Q384QinTemp").rot,	
    bornPos2 = sceneData:GetDummyPoint(3,"Q384Qin").pos,
	bornDir2 = sceneData:GetDummyPoint(3,"Q384Qin").rot,
	bornPos3 = sceneData:GetDummyPoint(3,"Q388Qin").pos,
    bornDir3 = sceneData:GetDummyPoint(3,"Q388Qin").rot,		
}

QuestClientData.ZhaiXingYaCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	canSkip = true,
	castListPath = "Cs_CastList_Q384",
	resPath = "ART/Cutscene/Cs_MDAQ063_ZhaiXingYa_Convert",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0},
	keepCamera = false
}

QuestClientData.FightNarrator =
{
	{dialogID = 3840707, audioEvtName = "", duration = 2},
	{dialogID = 3840708, audioEvtName = "", duration = 3},
}

return QuestClientData