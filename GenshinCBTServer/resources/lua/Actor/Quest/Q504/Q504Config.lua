require('Actor/ActorCommon')

local Q504Config = {}

Q504Config.MainID = 504
Q504Config.ActorAlias = "504"

Q504Config.SubIDs =
{
	q50401 = 50401,
	q50402 = 50402,
 	q50403 = 50403,
	q50404 = 50404,
	-- q50405 = 50405,
	-- q50406 = 50406,
	q50407 = 50407,
}
Q504Config.Seal1ID = 100148
Q504Config.Seal2ID = 100149

Q504Config.SealPos = sceneData:GetDummyPoint(3,"Q504SealPos").pos
Q504Config.SealRot = sceneData:GetDummyPoint(3,"Q504SealPos").rot

Q504Config.LairDisplay01TimeCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_MDAQ504_DvalinLairDisplay01",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0}
}

Q504Config.LairDisplay02TimeCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_MDAQ504_DvalinLairDisplay02",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0}
}

Q504Config.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
    WendyID = 1001,
    bornPos = sceneData:GetDummyPoint(3,"Q504Venti").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q504Venti").rot,
	bornPos2 = sceneData:GetDummyPoint(3,"Q50402Venti").pos,
	bornDir2 = sceneData:GetDummyPoint(3,"Q50402Venti").rot,
}

Q504Config.QinData = 
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,
	bornPos = sceneData:GetDummyPoint(3,"Q504Qin").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q504Qin").rot,	
	bornPos2 = sceneData:GetDummyPoint(3,"Q50402Qin").pos,
	bornDir2 = sceneData:GetDummyPoint(3,"Q50402Qin").rot,
}

Q504Config.DilucData = 
{
	Diluc = "Diluc",
	DilucScript = "Actor/Quest/Q376/Diluc",
	DilucID = 1009,
    bornPos = sceneData:GetDummyPoint(3,"Q504Diluc").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q504Diluc").rot,
	bornPos2 = sceneData:GetDummyPoint(3,"Q50402Diluc").pos,
	bornDir2 = sceneData:GetDummyPoint(3,"Q50402Diluc").rot,	
}

Q504Config.Story1 = 
{
    {dialogID = 5040301, duration = 6},
    {dialogID = 5040302, duration = 6},
	{dialogID = 5040303, duration = 6},
	{dialogID = 5040304, duration = 6},
}

Q504Config.Story2 = 
{
    {dialogID = 5040101, duration = 6},
    {dialogID = 5040102, duration = 6},
	{dialogID = 5040103, duration = 6},
	{dialogID = 5040104, duration = 6},
	{dialogID = 5040105, duration = 6},
    {dialogID = 5040106, duration = 6},
	{dialogID = 5040107, duration = 6},
	{dialogID = 5040108, duration = 6},
	{dialogID = 5040109, duration = 6},
}

return Q504Config
