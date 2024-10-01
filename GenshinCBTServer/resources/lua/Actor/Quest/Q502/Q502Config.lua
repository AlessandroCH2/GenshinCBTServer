require('Actor/ActorCommon')

local Q502Config = {}

Q502Config.MainID = 502
Q502Config.ActorAlias = "502"

Q502Config.SubIDs =
{
	q50201 = 50201,
	q50202 = 50202,
	q50203 = 50203,
	q50204 = 50204,
	q50205 = 50205,
	q50206 = 50206,
}
Q502Config.Clue1ID = 100139
Q502Config.Clue2ID = 100140
Q502Config.Clue3ID = 100141
Q502Config.SealID = 100146

Q502Config.CluePos1 = sceneData:GetDummyPoint(3,"Q502CluePos201").pos
Q502Config.ClueRot1 = sceneData:GetDummyPoint(3,"Q502CluePos201").rot
Q502Config.CluePos2 = sceneData:GetDummyPoint(3,"Q502CluePos202").pos
Q502Config.ClueRot2 = sceneData:GetDummyPoint(3,"Q502CluePos202").rot
Q502Config.CluePos3 = sceneData:GetDummyPoint(3,"Q502CluePos203").pos
Q502Config.ClueRot3 = sceneData:GetDummyPoint(3,"Q502CluePos203").rot
Q502Config.SealPos = sceneData:GetDummyPoint(3,"Q502SealPos").pos
Q502Config.SealRot = sceneData:GetDummyPoint(3,"Q502SealPos").rot

Q502Config.ClueGadgetID = 70900003
Q502Config.SealGadgetID = 70800001

Q502Config.SealOpenTimeCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_MDAQ501_DvalinSealOpen01",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0},
	fadeInDuration = 0
}

Q502Config.SealAppearTimeCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_MDAQ501_DvalinSeal02Appear",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0},
	fadeInDuration = 0
}


return Q502Config
