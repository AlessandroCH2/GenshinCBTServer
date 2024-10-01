require('Actor/ActorCommon')

local Q412Config = {}

Q412Config.MainID = 412
Q412Config.ActorAlias = "412"

Q412Config.SubIDs = 
{
	q41200 = 41200,
	q41201 = 41201,
	q41202 = 41202,
	q41203 = 41203,
	q41204 = 41204,
	q41205 = 41205,
	q41206 = 41206,
	q41207 = 41207,
	q41208 = 41208,
	q41209 = 41209,
	q41210 = 41210,

}
Q412Config.GaiaData = 
{
	Gaia = "Gaia",
	GaiaScript = "Actor/Quest/Q301/Gaia301",
	GaiaID = 1004,

	bornPos = sceneData:GetDummyPoint(3,"Q412GaiaBorn").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q412GaiaBorn").rot,
	runPos = sceneData:GetDummyPoint(3,"Q412GaiaRun").pos,	
	hidePos = sceneData:GetDummyPoint(3,"Q412GaiaHide").pos,
	hideDir = sceneData:GetDummyPoint(3,"Q412GaiaHide").rot,
	observePos = sceneData:GetDummyPoint(3,"Q412GaiaObserve").pos,
	observeDir = sceneData:GetDummyPoint(3,"Q412GaiaObserve").rot,
	askPos = sceneData:GetDummyPoint(3,"Q412GaiaAsk").pos,
	askDir = sceneData:GetDummyPoint(3,"Q412GaiaAsk").rot,	
	answerPos = sceneData:GetDummyPoint(3,"Q412GaiaAnswer").pos,
	answerDir = sceneData:GetDummyPoint(3,"Q412GaiaAnswer").rot,
	run2Pos = sceneData:GetDummyPoint(3,"Q412GaiaRun2").pos,


}

Q412Config.GaiaNoReplyInter = 
{
	{
		-- {
		-- 	type = InteractionType.STEER_TO,
		-- 	steerType = DialogSteerType.TO_LOCAL_AVATAR,
		-- 	duration = 1.0
		-- },
		-- {
		-- 	type = InteractionType.CAMERA_MOVE,
		-- 	cameraPosType = StoryCameraPosType.RELATIVE_TO_INTER,
		-- 	camPosOffset = {x = 0, y = 0.5, z = 0},
		-- 	nearLength = 2,
		-- 	camTargetType = StoryCameraTargetType.TO_INTEE,
		-- 	camForwardTargetOffset = {x = 0, y = 0.5, z = 0},
		-- 	duration = 1.0,
		-- 	lerpRatio = 5.0,
		-- 	lerpPattern = 0
		-- },
		{
			type = InteractionType.DIALOG,
			dialogType = DialogType.LOCK_FRAME,
			talkerName = "凯亚",
			content = "我先去了，你也快来"
		}
	},
	-- {
	-- 	{
	-- 		type = InteractionType.DIALOG_FINISH,
	-- 	},
	-- 	{
	-- 		type = InteractionType.STEER_TO,
	-- 		steerType = DialogSteerType.RETURN,
	-- 		duration = 1.0
	-- 	},
	-- 	{
	-- 		type = InteractionType.CAMERA_MOVE,
	-- 		cameraPosType = StoryCameraPosType.EXIT,
	-- 		-- camPosOffset = {x = 0, y = 0, z = 0},
	-- 		-- nearLength = 0,
	-- 		-- camTargetType = StoryCameraTargetType.TO_INTEE,
	-- 		-- camForwardTargetOffset = {x = 0, y = 0, z = 0},
	-- 		-- duration = 1.0,
	-- 		-- lerpRatio = 5.0,
	-- 		-- lerpPattern = 1
	-- 	}
	-- }
}


return Q412Config