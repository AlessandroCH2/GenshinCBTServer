require('Actor/ActorCommon')

local Q301Config = {}

Q301Config.MainID = 301
Q301Config.ActorAlias = "301"

Q301Config.SubIDs = 
{
	q30100 = 30100,
	q30101 = 30101,
	q30102 = 30102,
	q30103 = 30103,
	q30104 = 30104,
	q30105 = 30105,
	q30106 = 30106,
	q30107 = 30107,
	q30108 = 30108,
	q30109 = 30109,
	q30110 = 30110,
	q30111 = 30111,
	q30112 = 30112,
	q30113 = 30113,
	q30114 = 30114,
	q30115 = 30115,
	q30116 = 30116,
	q30117 = 30117,
	q30118 = 30118,
}

Q301Config.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
	WendyID = 1001,
	-- bornPos = M.Pos(1444.513, 60.50317, 136.6221),
	-- bornDir = M.Dir(0, 0, 0),
	-- vanishPos = M.Pos(1449, 65, 116),

	bornPos = sceneData:GetDummyPoint(3, "Q301WendyPlay").pos,
	bornDir = sceneData:GetDummyPoint(3, "Q301WendyPlay").rot,
	vanishPos = sceneData:GetDummyPoint(3,"Q301WendyVanish").pos,

	EvtFinishDance = 10079,
}

Q301Config.RobamData = 
{
	Robam = "Robam",
	RobamScript = "Actor/Quest/Q301/Robam301",
	RobamID = 1003,
	-- bornPos = M.Pos(1440, 60.3, 136),
	-- bornDir = M.Dir(0, 76, 0),	
	-- arguePos = M.Pos(1440, 60.3, 136),
	-- argueDir = M.Dir(0, 76, 0),
	EvtFinishDance = 10079,

	bornPos = sceneData:GetDummyPoint(3,"Q301RobamBorn").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q301RobamBorn").rot,
	arguePos = sceneData:GetDummyPoint(3,"Q301RobamArgue").pos,
	argueDir = sceneData:GetDummyPoint(3,"Q301RobamArgue").rot,
}

Q301Config.AmborData = 
{
	Ambor = "Ambor",
	AmborScript = "Actor/Quest/Q301/Ambor301",
	AmborID = 1002,

	-- bornPos = M.Pos(1443, 59.4, 142.7),
	-- bornDir = M.Dir(0, 170, 0),	
	-- arguePos = M.Pos(1443, 59.4, 142.7),
	-- argueDir = M.Dir(0, 170, 0),
	-- vanishPos = M.Pos(1449, 65, 116),

	EvtFinishDance = 10079,

	bornPos = sceneData:GetDummyPoint(3,"Q301AmborBorn").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q301AmborBorn").rot,	
	arguePos = sceneData:GetDummyPoint(3,"Q301AmborArgue").pos,
	argueDir = sceneData:GetDummyPoint(3,"Q301AmborArgue").rot,
	vanishPos = sceneData:GetDummyPoint(3,"Q301AmborVanish").pos,
}

Q301Config.GaiaData =
{
	Gaia = "Gaia",
	GaiaScript = "Actor/Quest/Q301/Gaia301",
	GaiaID = 1004,
	-- bornPos = M.Pos(1455, 62.6, 156.5),
	-- bornDir = M.Dir(0, 0, 0),
	-- showPos = M.Pos(1448.2, 60.3, 139.9),
	-- showDir = M.Dir(0, 0, 0),
	-- firstPos = M.Pos(1433, 57, 169),
	-- secondPos = M.Pos(1415, 56, 182),
	-- thirdPos = M.Pos(1411, 56, 192),
	-- fourthPos = M.Pos(1407, 55, 202),

	BeFollowLen = 10,
	BeFollowFailedLen = 50,

	bornPos = sceneData:GetDummyPoint(3,"Q301GaiaBorn").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q301GaiaBorn").rot,
	showPos = sceneData:GetDummyPoint(3,"Q301GaiaShow").pos,
	showDir = sceneData:GetDummyPoint(3,"Q301GaiaShow").rot,
	firstPos = sceneData:GetDummyPoint(3,"Q301GaiaFollow1").pos,
	secondPos = sceneData:GetDummyPoint(3,"Q301GaiaFollow2").pos,
	thirdPos = sceneData:GetDummyPoint(3,"Q301GaiaFollow3").pos,
	fifthPos = sceneData:GetDummyPoint(3,"Q301GaiaFollow4").pos,
	sixthPos = sceneData:GetDummyPoint(3,"Q301GaiaFollow5").pos,
	fourthPos = sceneData:GetDummyPoint(3,"Q301GaiaFollowFinal").pos,
}

Q301Config.ExtrasData =
{
	Extras = "Extras",
	ExtrasAudience = "Actor/Quest/Q301/WendyAudience",
	ExtrasIDs =
	{
		1101,
		1102,
		1103,
		1104,
	},
	ExtrasOriginPos =
	{
		-- M.Pos(1463, 64, 141),
		-- M.Pos(1436, 61, 131),
		-- M.Pos(1429, 60, 136),
		-- M.Pos(1436, 60, 143),
		sceneData:GetDummyPoint(3,"Q301Folk1Born").pos,
		sceneData:GetDummyPoint(3,"Q301Folk2Born").pos,
		sceneData:GetDummyPoint(3,"Q301Folk3Born").pos,
		sceneData:GetDummyPoint(3,"Q301Folk4Born").pos,
	},
	ExtrasOriginDir =
	{
		-- M.Dir(0, 219, 0),
		-- M.Dir(0, 181, 0),
		-- M.Dir(0, 147, 0),
		-- M.Dir(0, 129, 0),
		sceneData:GetDummyPoint(3,"Q301Folk1Born").rot,
		sceneData:GetDummyPoint(3,"Q301Folk2Born").rot,
		sceneData:GetDummyPoint(3,"Q301Folk3Born").rot,
		sceneData:GetDummyPoint(3,"Q301Folk4Born").rot,
	},
	ExtrasSeatPos = 
	{
		-- M.Pos(1448.2, 60.3, 139.9),
		-- M.Pos(1445.1, 59.8, 140.9),
		-- M.Pos(1441.9, 59.8, 140.7),
		-- M.Pos(1439.5, 60.1, 139.5),
		sceneData:GetDummyPoint(3,"Q301Audience1").pos,
		sceneData:GetDummyPoint(3,"Q301Audience2").pos,
		sceneData:GetDummyPoint(3,"Q301Audience3").pos,
		sceneData:GetDummyPoint(3,"Q301Audience4").pos,
	},
	ExtrasSeatDir =
	{
		-- M.Dir(0, 219, 0),
		-- M.Dir(0, 181, 0),
		-- M.Dir(0, 147, 0),
		-- M.Dir(0, 129, 0),
		sceneData:GetDummyPoint(3,"Q301Audience1").rot,
		sceneData:GetDummyPoint(3,"Q301Audience2").rot,
		sceneData:GetDummyPoint(3,"Q301Audience3").rot,
		sceneData:GetDummyPoint(3,"Q301Audience4").rot,
	},
	ExtrasDaily1Pos =
	{
		sceneData:GetDummyPoint(3,"Q301Folk1Pos1").pos,
		sceneData:GetDummyPoint(3,"Q301Folk2Pos1").pos,
		sceneData:GetDummyPoint(3,"Q301Folk3Pos1").pos,
		sceneData:GetDummyPoint(3,"Q301Folk4Pos1").pos,
	},
	ExtrasDaily2Pos =
	{
		sceneData:GetDummyPoint(3,"Q301Folk1Pos2").pos,
		sceneData:GetDummyPoint(3,"Q301Folk2Pos2").pos,
		sceneData:GetDummyPoint(3,"Q301Folk3Pos2").pos,
		sceneData:GetDummyPoint(3,"Q301Folk4Pos2").pos,
	},
	ExtrasDaily3Pos =
	{
		sceneData:GetDummyPoint(3,"Q301Folk1Pos3").pos,
		sceneData:GetDummyPoint(3,"Q301Folk2Pos3").pos,
		sceneData:GetDummyPoint(3,"Q301Folk3Pos3").pos,
		sceneData:GetDummyPoint(3,"Q301Folk4Pos3").pos,
	},
	ExtrasDaily4Pos =
	{
		sceneData:GetDummyPoint(3,"Q301Folk1Pos4").pos,
		sceneData:GetDummyPoint(3,"Q301Folk2Pos4").pos,
		sceneData:GetDummyPoint(3,"Q301Folk3Pos4").pos,
		sceneData:GetDummyPoint(3,"Q301Folk4Pos4").pos,
	},
	ExtrasHomePos =
	{
		sceneData:GetDummyPoint(3,"Q301Folk1Home").pos,
		sceneData:GetDummyPoint(3,"Q301Folk2Home").pos,
		sceneData:GetDummyPoint(3,"Q301Folk3Home").pos,
		sceneData:GetDummyPoint(3,"Q301Folk4Home").pos,
	},
	ExtrasReturnCallback = 
	{
		function(self)
			self:StartDaily()
		end,
		function(self)
			self:StartDaily()
		end,
		function(self)
			self:StartDaily()
		end,
		function(self)
			self:StartDaily()
		end
	},
}

Q301Config.MeiData =
{
	Mei = "Mei",
	MeiScript = "Actor/Npc/Npc101Test",
	MeiID = 101,
	bornPos = M.Pos(1460, 65, 152),
	bornDir = M.Dir(0, 0, 0),
}

Q301Config.TestData = 
{
	Test = "Test",
	TestScript = "Actor/Quest/Q301/Test301",
	TestID = 1105,

	bornPos = M.Pos(1443, 59.4, 162.7),
	bornDir = M.Dir(0, 170, 0),	

	vanishPos = M.Pos(1449, 65, 116),

	EvtFinishDance = 10079
}

Q301Config.AudienceInter = 
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
			talkerName = "市民",
			content = "唱的真好听啊，只是风魔龙已经不再守护我们了啊"
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

Q301Config.MonsterData = 
{
	MonsterIDs = {21010301, 21010301},
}

Q301Config.Mq1TimeCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_MD_MQ1_Cutscene01",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0}
}
return Q301Config