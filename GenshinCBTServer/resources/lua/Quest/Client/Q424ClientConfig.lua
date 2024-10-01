local QuestClientData = {}

QuestClientData.MainID = 424
QuestClientData.ActorAlias = "424"
QuestClientData.SubIDs = 
{
	q42401 = 42401,
	q42402 = 42402,
	q42403 = 42403,
	q42404 = 42404,
	q42405 = 42405,
    q42406 = 42406,
    q42407 = 42407,
}

QuestClientData.Score = 100
QuestClientData.Rank = "A"

QuestClientData.SneakJudgeData = 
{
	alias = "SneakJudge",
	metaPath = "Actor/Npc/SneakJudge",
	configID = 1220,
	bornPos = sceneData:GetDummyPoint(1013,"Judge").pos,
	bornDir = sceneData:GetDummyPoint(1013,"Judge").rot,	
}

QuestClientData.KeyID = 100115
QuestClientData.KeyPos = sceneData:GetDummyPoint(1013,"Harp").pos
QuestClientData.KeyDir = sceneData:GetDummyPoint(1013,"Harp").rot

QuestClientData.RedKeyID = 100175
QuestClientData.RedKeyPos = sceneData:GetDummyPoint(1013,"RedKey1").pos

QuestClientData.BlackKeyID = 100176
QuestClientData.BlackKeyPos = sceneData:GetDummyPoint(1013,"BlackKey1").pos

QuestClientData.RedDoorNum = 3
QuestClientData.RedDoor1Data =
{
	alias = "RedDoor1",
	metaPath = "Actor/Npc/SneakRedDoor",
	dataIndex = 1,
	configID = 1235,
	bornPos = sceneData:GetDummyPoint(1013,"RedDoor1").pos,
	bornDir = sceneData:GetDummyPoint(1013,"RedDoor1").rot,
}

QuestClientData.RedDoor2Data =
{
	alias = "RedDoor2",
	metaPath = "Actor/Npc/SneakRedDoor",
	dataIndex = 2,
	configID = 1236,
	bornPos = sceneData:GetDummyPoint(1013,"RedDoor2").pos,
	bornDir = sceneData:GetDummyPoint(1013,"RedDoor2").rot,
}

QuestClientData.RedDoor3Data =
{
	alias = "RedDoor3",
	metaPath = "Actor/Npc/SneakRedDoor",
	dataIndex = 3,
	configID = 1237,
	bornPos = sceneData:GetDummyPoint(1013,"RedDoor3").pos,
	bornDir = sceneData:GetDummyPoint(1013,"RedDoor3").rot,
}

QuestClientData.BlackDoorNum = 2
QuestClientData.BlackDoor1Data =
{
	alias = "BlackDoor1",
	metaPath = "Actor/Npc/SneakBlackDoor",
	dataIndex = 1,
	configID = 1238,
	bornPos = sceneData:GetDummyPoint(1013,"BlackDoor1").pos,
	bornDir = sceneData:GetDummyPoint(1013,"BlackDoor1").rot,
}

QuestClientData.BlackDoor2Data =
{
	alias = "BlackDoor2",
	metaPath = "Actor/Npc/SneakBlackDoor",
	dataIndex = 2,
	configID = 1239,
	bornPos = sceneData:GetDummyPoint(1013,"BlackDoor2").pos,
	bornDir = sceneData:GetDummyPoint(1013,"BlackDoor2").rot,
}

QuestClientData.TreasurePos = 
{
	sceneData:GetDummyPoint(1013,"Treasure1").pos,
	sceneData:GetDummyPoint(1013,"Treasure2").pos,
	sceneData:GetDummyPoint(1013,"Treasure3").pos,
	sceneData:GetDummyPoint(1013,"Treasure4").pos,
	sceneData:GetDummyPoint(1013,"Treasure5").pos,
	sceneData:GetDummyPoint(1013,"Treasure6").pos,
	sceneData:GetDummyPoint(1013,"Treasure7").pos,
	sceneData:GetDummyPoint(1013,"Treasure8").pos,
}
QuestClientData.TreasureDir = sceneData:GetDummyPoint(1013,"Treasure1").rot
QuestClientData.SneakAlarmAI1Data =
{
	alias = "SneakAI1",
	metaPath = "Actor/Npc/SneakAdvAI",
    configID = 1231,
    dataIndex = 11,
	bornPos = sceneData:GetDummyPoint(1013,"AlarmAI1Pos1").pos,
    bornDir = sceneData:GetDummyPoint(1013,"AlarmAI1Pos1").rot,
    PatrolPosNum = 1,
    PatrolPos = 
	{
		sceneData:GetDummyPoint(1013,"AlarmAI1Pos2").pos,
	},
	PatrolDir =
	{
		sceneData:GetDummyPoint(1013,"AlarmAI1Pos2").rot,
	},
	PatrolNext = 1,
}

QuestClientData.SneakAINum = 10
QuestClientData.SneakAI1Data =
{
	alias = "SneakAI1",
	metaPath = "Actor/Npc/SneakAdvAI",
    configID = 1221,
    dataIndex = 1,
	bornPos = sceneData:GetDummyPoint(1013,"AI1Pos1").pos,
    bornDir = sceneData:GetDummyPoint(1013,"AI1Pos1").rot,
    PatrolPosNum = 1,
    PatrolPos = 
	{
		sceneData:GetDummyPoint(1013,"AI1Pos1").pos,
	},
	PatrolDir =
	{
		sceneData:GetDummyPoint(1013,"AI1Pos1").rot,
	},
	PatrolNext = 1,
}
QuestClientData.SneakAI2Data =
{
	alias = "SneakAI2",
	metaPath = "Actor/Npc/SneakAdvAI",
    configID = 1222,
    dataIndex = 2,
	bornPos = sceneData:GetDummyPoint(1013,"AI2Pos1").pos,
    bornDir = sceneData:GetDummyPoint(1013,"AI2Pos1").rot,
    PatrolPosNum = 2,
    PatrolPos = 
	{
		sceneData:GetDummyPoint(1013,"AI2Pos1").pos,
		sceneData:GetDummyPoint(1013,"AI2Pos2").pos,
	},
	PatrolDir =
	{
		sceneData:GetDummyPoint(1013,"AI2Pos1").rot,
		sceneData:GetDummyPoint(1013,"AI2Pos2").rot,
	},
	PatrolNext = 1,
}

QuestClientData.SneakAI3Data =
{
	alias = "SneakAI3",
	metaPath = "Actor/Npc/SneakAdvAI",
    configID = 1223,
    dataIndex = 3,
	bornPos = sceneData:GetDummyPoint(1013,"AI3Pos1").pos,
    bornDir = sceneData:GetDummyPoint(1013,"AI3Pos1").rot,
    PatrolPosNum = 2,
    PatrolPos = 
	{
        sceneData:GetDummyPoint(1013,"AI3Pos1").pos,
        sceneData:GetDummyPoint(1013,"AI3Pos2").pos,
	},
	PatrolDir =
	{
        sceneData:GetDummyPoint(1013,"AI3Pos1").rot,
        sceneData:GetDummyPoint(1013,"AI3Pos2").rot,
	},
	PatrolNext = 1,
}

QuestClientData.SneakAI4Data =
{
	alias = "SneakAI4",
	metaPath = "Actor/Npc/SneakAdvAI",
    configID = 1224,
    dataIndex = 4,
	bornPos = sceneData:GetDummyPoint(1013,"AI4Pos1").pos,
    bornDir = sceneData:GetDummyPoint(1013,"AI4Pos1").rot,
    PatrolPosNum = 2,
    PatrolPos = 
	{
        sceneData:GetDummyPoint(1013,"AI4Pos1").pos,
        sceneData:GetDummyPoint(1013,"AI4Pos2").pos,
	},
	PatrolDir =
	{
        sceneData:GetDummyPoint(1013,"AI4Pos1").rot,
        sceneData:GetDummyPoint(1013,"AI4Pos2").rot,
	},
	PatrolNext = 1,
}

QuestClientData.SneakAI5Data =
{
	alias = "SneakAI5",
	metaPath = "Actor/Npc/SneakAdvAI",
    configID = 1225,
    dataIndex = 5,
	bornPos = sceneData:GetDummyPoint(1013,"AI5Pos1").pos,
    bornDir = sceneData:GetDummyPoint(1013,"AI5Pos1").rot,
    PatrolPosNum = 2,
    PatrolPos = 
	{
        sceneData:GetDummyPoint(1013,"AI5Pos1").pos,
        sceneData:GetDummyPoint(1013,"AI5Pos2").pos,
	},
	PatrolDir =
	{
        sceneData:GetDummyPoint(1013,"AI5Pos1").rot,
        sceneData:GetDummyPoint(1013,"AI5Pos2").rot,
	},
	PatrolNext = 1,
}

QuestClientData.SneakAI6Data =
{
	alias = "SneakAI6",
	metaPath = "Actor/Npc/SneakAdvAI",
    configID = 1226,
    dataIndex = 6,
	bornPos = sceneData:GetDummyPoint(1013,"AI6Pos1").pos,
    bornDir = sceneData:GetDummyPoint(1013,"AI6Pos1").rot,
    PatrolPosNum = 2,
    PatrolPos = 
	{
        sceneData:GetDummyPoint(1013,"AI6Pos1").pos,
        sceneData:GetDummyPoint(1013,"AI6Pos2").pos,
	},
	PatrolDir =
	{
        sceneData:GetDummyPoint(1013,"AI6Pos1").rot,
        sceneData:GetDummyPoint(1013,"AI6Pos2").rot,
	},
	PatrolNext = 1,
}

QuestClientData.SneakAI7Data =
{
	alias = "SneakAI7",
	metaPath = "Actor/Npc/SneakAdvAI",
    configID = 1227,
    dataIndex = 7,
	bornPos = sceneData:GetDummyPoint(1013,"AI7Pos1").pos,
    bornDir = sceneData:GetDummyPoint(1013,"AI7Pos1").rot,
    PatrolPosNum = 2,
    PatrolPos = 
	{
        sceneData:GetDummyPoint(1013,"AI7Pos1").pos,
        sceneData:GetDummyPoint(1013,"AI7Pos2").pos,
	},
	PatrolDir =
	{
        sceneData:GetDummyPoint(1013,"AI7Pos1").rot,
        sceneData:GetDummyPoint(1013,"AI7Pos2").rot,
	},
	PatrolNext = 1,
}

QuestClientData.SneakAI8Data =
{
	alias = "SneakAI8",
	metaPath = "Actor/Npc/SneakAdvAI",
    configID = 1228,
    dataIndex = 8,
	bornPos = sceneData:GetDummyPoint(1013,"AI8Pos1").pos,
    bornDir = sceneData:GetDummyPoint(1013,"AI8Pos1").rot,
    PatrolPosNum = 4,
    PatrolPos = 
	{
        sceneData:GetDummyPoint(1013,"AI8Pos1").pos,
        sceneData:GetDummyPoint(1013,"AI8Pos2").pos,
        sceneData:GetDummyPoint(1013,"AI8Pos3").pos,
        sceneData:GetDummyPoint(1013,"AI8Pos4").pos,
	},
	PatrolDir =
	{
        sceneData:GetDummyPoint(1013,"AI8Pos1").rot,
        sceneData:GetDummyPoint(1013,"AI8Pos2").rot,
        sceneData:GetDummyPoint(1013,"AI8Pos3").rot,
        sceneData:GetDummyPoint(1013,"AI8Pos4").rot,
	},
	PatrolNext = 1,
}

QuestClientData.SneakAI9Data =
{
	alias = "SneakAI9",
	metaPath = "Actor/Npc/SneakAdvAI",
    configID = 1229,
    dataIndex = 9,
	bornPos = sceneData:GetDummyPoint(1013,"AI9Pos1").pos,
    bornDir = sceneData:GetDummyPoint(1013,"AI9Pos1").rot,
    PatrolPosNum = 4,
    PatrolPos = 
	{
        sceneData:GetDummyPoint(1013,"AI9Pos1").pos,
		sceneData:GetDummyPoint(1013,"AI9Pos2").pos,
		sceneData:GetDummyPoint(1013,"AI9Pos3").pos,
		sceneData:GetDummyPoint(1013,"AI9Pos4").pos,
	},
	PatrolDir =
	{
        sceneData:GetDummyPoint(1013,"AI9Pos1").rot,
		sceneData:GetDummyPoint(1013,"AI9Pos2").rot,
		sceneData:GetDummyPoint(1013,"AI9Pos3").rot,
		sceneData:GetDummyPoint(1013,"AI9Pos4").rot,
	},
	PatrolNext = 1,
}

QuestClientData.SneakAI10Data =
{
	alias = "SneakAI10",
	metaPath = "Actor/Npc/SneakAdvAI",
    configID = 1230,
    dataIndex = 10,
	bornPos = sceneData:GetDummyPoint(1013,"AI10Pos1").pos,
    bornDir = sceneData:GetDummyPoint(1013,"AI10Pos1").rot,
    PatrolPosNum = 1,
    PatrolPos = 
	{
        sceneData:GetDummyPoint(1013,"AI10Pos1").pos,
	},
	PatrolDir =
	{
        sceneData:GetDummyPoint(1013,"AI10Pos1").rot,
	},
	PatrolNext = 1,
}

QuestClientData.AwareReminder =
{
	{dialogID = 4240602, audioEvtName = "", duration = 2},
}
QuestClientData.DiscoverReminder =
{
	{dialogID = 4240603, audioEvtName = "", duration = 1},
}

QuestClientData.ScoreReminder = 
{
	talkerName = "派蒙",
	content = "过关评分："
}

return QuestClientData