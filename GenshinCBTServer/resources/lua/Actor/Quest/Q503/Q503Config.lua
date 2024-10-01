require('Actor/ActorCommon')

local Q503Config = {}

Q503Config.MainID = 503
Q503Config.ActorAlias = "503"

Q503Config.SubIDs =
{
	q50301 = 50301,
	q50302 = 50302,
	q50303 = 50303,
	q50304 = 50304,
	q50305 = 50305,
	q50306 = 50306,
}
Q503Config.Clue1ID = 100142
Q503Config.Clue2ID = 100143
Q503Config.Clue3ID = 100144
Q503Config.SealID = 100147

Q503Config.CluePos1 = sceneData:GetDummyPoint(3,"Q503CluePos301").pos
Q503Config.ClueRot1 = sceneData:GetDummyPoint(3,"Q503CluePos301").rot
Q503Config.CluePos2 = sceneData:GetDummyPoint(3,"Q503CluePos302").pos
Q503Config.ClueRot2 = sceneData:GetDummyPoint(3,"Q503CluePos302").rot
Q503Config.CluePos3 = sceneData:GetDummyPoint(3,"Q503CluePos303").pos
Q503Config.ClueRot3 = sceneData:GetDummyPoint(3,"Q503CluePos303").rot
Q503Config.SealPos = sceneData:GetDummyPoint(3,"Q503SealPos").pos
Q503Config.SealRot = sceneData:GetDummyPoint(3,"Q503SealPos").rot

Q503Config.ClueGadgetID = 70900003
Q503Config.SealGadgetID = 70800001

Q503Config.SealOpenTimeCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_MDAQ501_DvalinSealOpen01",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0},
	fadeInDuration = 0
}

Q503Config.SealAppearTimeCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_MDAQ501_DvalinSeal03Appear",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0},
	fadeInDuration = 0
}


return Q503Config
