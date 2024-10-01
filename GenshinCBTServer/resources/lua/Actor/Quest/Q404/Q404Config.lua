require('Actor/ActorCommon')

local Q404Config = {}

Q404Config.MainID = 404
Q404Config.ActorAlias = "404"

Q404Config.SubIDs = 
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
Q404Config.AmborData = 
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
Q404Config.KeyID = 100008
-- Q404Config.KeyPos = { x = -508, y = 279, z = -481 }
Q404Config.KeyPos = { x = 1540, y = 279, z = -5601 }
Q404Config.KeyDir = { x = 0, y = 45, z = 0 }
Q404Config.MatchTime = 35
Q404Config.gotKey = false
Q404Config.AmborNoReplyInter = 
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
Q404Config.KeyPos2 = { x = 1892, y = 208, z = -5469 }
Q404Config.KeyDir2 = { x = 0, y = -36, z = 0 }
Q404Config.MatchTime2 = 40

return Q404Config