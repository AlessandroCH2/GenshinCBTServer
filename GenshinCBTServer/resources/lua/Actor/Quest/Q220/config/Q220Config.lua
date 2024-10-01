require('Actor/ActorCommon')

local Q220Config = {}

Q220Config.MainID = 220
Q220Config.ActorAlias = "220"

Q220Config.SubIDs = 
{
	q22002 = 22002,
	q22003 = 22003,
	q22004 = 22004,
	q22005 = 22005,
}

Q220Config.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q220/Wendy22003",
	WendyID = 102,
	bornPos = M.Pos(1426, 56.4, 176),
	bornDir = M.Dir(0, -36, 0),
	
	EvtFinishDance = 10079
}

Q220Config.ExtrasData =
{
	Extras = "Extras",
	ExtrasAudience = "Actor/Quest/Q220/WendyAudience",
	ExtrasIDs =
	{
		5,
		37,
	},
	ExtrasOriginPos =
	{
		M.Pos(1429.2, 56.8, 184),
		M.Pos(1425.79, 56.38, 178.15),
	},
	ExtrasOriginDir =
	{
		M.Dir(0, 0, 0),
		M.Dir(0, 0, 0),
	},
	ExtrasSeatPos = 
	{
		M.Pos(1424, 56.4, 177),
		M.Pos(1425.79, 56.38, 178.15),
	},
	ExtrasSeatDir =
	{
		M.Dir(0, 150, 0),
		M.Dir(0, 160, 0),
	},
	ExtrasReturnCallback = 
	{
		nil,
		function(self)
			self:Destroy(false)
		end
	},
}

Q220Config.GaiaData =
{
	Gaia = "Gaia",
	GaiaScript = "Actor/Quest/Q220/Gaia22003",
	GaiaID = 103,
	bornPos = M.Pos(1403, 57.4, 195),
	bornDir = M.Dir(0, -36, 0),

	FirstPos = M.Pos(1397.4, 60, 363),
	BeFollowLen = 10,
	BeFollowFailedLen = 20,
}

Q220Config.AudienceInter = 
{
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
		},
		{
			type = InteractionType.DIALOG,
			dialogType = DialogType.LOCK_FRAME,
			talkerName = "观众",
			content = "跳舞跳得挺好啊"
		}
	},
	{
		{
			type = InteractionType.DIALOG_FINISH,
		},
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
}

Q220Config.MonsterData = 
{
	MonsterIDs = {20103026, 20105101},
}

Q220Config.CutsceneData =
{
	Test1 = {
		type = CutsceneType.TIME_LINE_PREFAB,
		roleSheetPath = "",
		resPath = "ART/Cutscene/Cs_UnlockCityCutScene",
		startPosType = CutsceneInitPosType.RELATIVE_TO_LOCAL_AVATAR,
		startOffset = {x = 0, y = 3, z = 0}
	}
}

return Q220Config