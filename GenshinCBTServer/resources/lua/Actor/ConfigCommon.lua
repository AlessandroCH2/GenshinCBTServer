require('Actor/ActorCommon')

local ConfigCommon = {}

ConfigCommon.InterConfig = {}
ConfigCommon.InterConfig.default_start = 
{
	{
		type = InteractionType.STEER_TO,
		steerType = DialogSteerType.TO_LOCAL_AVATAR,
		duration = 1.0
	},
	{
		type = InteractionType.CAMERA_MOVE,
		cameraPosType = StoryCameraPosType.RELATIVE_TO_INTER,
		camPosOffset = {x = 0, y = 0.5, z = 0},
		nearLength = 2,
		camTargetType = StoryCameraTargetType.TO_INTEE,
		camForwardTargetOffset = {x = 0, y = 0.5, z = 0},
		duration = 1.0,
		lerpRatio = 5.0,
		lerpPattern = 0
	}
}
ConfigCommon.InterConfig.default_finish = 
{
	{
		type = InteractionType.STEER_TO,
		steerType = DialogSteerType.RETURN,
		duration = 1.0
	},
	{
		type = InteractionType.CAMERA_MOVE,
		cameraPosType = StoryCameraPosType.EXIT,
		camPosOffset = {x = 0, y = 0, z = 0},
		nearLength = 0,
		camTargetType = StoryCameraTargetType.TO_INTEE,
		camForwardTargetOffset = {x = 0, y = 0, z = 0},
		duration = 1.0,
		lerpRatio = 5.0,
		lerpPattern = 1
	}
}

return ConfigCommon