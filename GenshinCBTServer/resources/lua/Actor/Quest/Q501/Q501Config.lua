require('Actor/ActorCommon')

local Q501Config = {}

Q501Config.MainID = 501
Q501Config.ActorAlias = "501"

Q501Config.SubIDs =
{
	q50101 = 50101,
	q50102 = 50102,
	q50103 = 50103,
	q50104 = 50104,
	q50105 = 50105,
	q50106 = 50106,
}
Q501Config.Clue1ID = 100136
Q501Config.Clue2ID = 100137
Q501Config.Clue3ID = 100138
Q501Config.SealID = 100145

Q501Config.CluePos1 = sceneData:GetDummyPoint(3,"Q390CluePos1").pos
Q501Config.ClueRot1 = sceneData:GetDummyPoint(3,"Q390CluePos1").rot
Q501Config.CluePos2 = sceneData:GetDummyPoint(3,"Q390CluePos2").pos
Q501Config.ClueRot2 = sceneData:GetDummyPoint(3,"Q390CluePos2").rot
Q501Config.CluePos3 = sceneData:GetDummyPoint(3,"Q390CluePos3").pos
Q501Config.ClueRot3 = sceneData:GetDummyPoint(3,"Q390CluePos3").rot
Q501Config.SealPos = sceneData:GetDummyPoint(3,"Q390SealPos").pos
Q501Config.SealRot = sceneData:GetDummyPoint(3,"Q390SealPos").rot

Q501Config.ClueGadgetID = 70900003
Q501Config.SealGadgetID = 70800001

Q501Config.SealOpenTimeCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_MDAQ501_DvalinSealOpen01",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0},
	fadeInDuration = 0
}

Q501Config.SealAppearTimeCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_MDAQ501_DvalinSeal01Appear",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0},
	fadeInDuration = 0
}

Q501Config.NarratorData =
{
    Storyclue1 = {
		{dialogID = 5010101, duration = 3}
	},
	Storyclue2 = {
		{dialogID = 5010102, duration = 3}
	},
	Storyclue3 = {
		{dialogID = 5010103, duration = 3}
	}
}

return Q501Config
