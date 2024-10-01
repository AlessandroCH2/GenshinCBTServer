local QuestClientData = {}

QuestClientData.MainID = 404
QuestClientData.ActorAlias = "404"
QuestClientData.SubIDs = 
{
	q40400 = 40400,
	q40401 = 40401,
	q40402 = 40402,
	q40403 = 40403,
	q40404 = 40404,
	q40405 = 40405,
	q40406 = 40406,
	q40407 = 40407,
	q40408 = 40408,
	q40409 = 40409,
	q40410 = 40410,
}

QuestClientData.AmborData = 
{
	Ambor = "Ambor",
	AmborScript = "Actor/Quest/Q301/Ambor301",
	AmborID = 1002,

	bornPos = sceneData:GetDummyPoint(3,"Q301AmborBorn").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q301AmborBorn").rot,	
	arguePos = sceneData:GetDummyPoint(3,"Q301AmborArgue").pos,
	argueDir = sceneData:GetDummyPoint(3,"Q301AmborArgue").rot,
	vanishPos = sceneData:GetDummyPoint(3,"Q301AmborVanish").pos,
	judgePos = sceneData:GetDummyPoint(3,"Q404AmborStart").pos,
	judgeDir = sceneData:GetDummyPoint(3,"Q404AmborStart").rot,
}

QuestClientData.KeyID = 100008
-- Q404Config.KeyPos = { x = -508, y = 279, z = -481 }
QuestClientData.KeyPos = { x = 1540, y = 279, z = -5601 }
QuestClientData.KeyDir = { x = 0, y = 45, z = 0 }
QuestClientData.MatchTime = 35
QuestClientData.gotKey = false
QuestClientData.AmborNoReplyInter = 
{
	{
		{
			type = InteractionType.DIALOG,
			dialogType = DialogType.LOCK_FRAME,
			talkerName = "安柏",
			content = "我先去了，你也快来"
		}
	},
}
-- Q404Config.KeyPos2 = { x = -156, y = 208, z = -349 }
QuestClientData.KeyPos2 = { x = 1892, y = 208, z = -5469 }
QuestClientData.KeyDir2 = { x = 0, y = -36, z = 0 }
QuestClientData.MatchTime2 = 40

QuestClientData.InterData = {
	Cutscene1 = {
		type = CutsceneType.TIME_LINE_PREFAB,
		canSkip = true,
		resPath = "ART/Cutscene/Cs_Opening_CutScene1",
		startPosType = CutsceneInitPosType.FREE,
		startOffset = {0, 0, 0},
		keepCamera = true
	},
	AmborNoReplyInter = {
		{
			{
				type = InteractionType.DIALOG,
				dialogType = DialogType.LOCK_FRAME,
				dialogID = 3100701,
			}
		},
	}
}

return QuestClientData