require('Actor/ActorCommon')

local Q305Config = {}

Q305Config.MainID = 305
Q305Config.ActorAlias = "305"

Q305Config.SubIDs = 
{
	q30500 = 30500,
	q30501 = 30501,
	q30502 = 30502,
	q30503 = 30503,
	q30504 = 30504,
	q30505 = 30505,
	q30506 = 30506,
	q30507 = 30507,
	q30508 = 30508,
	q30509 = 30509,
	q30510 = 30510,
}
Q305Config.AmborData = 
{
	Ambor = "Ambor",
	AmborScript = "Actor/Quest/Q301/Ambor301",
    AmborID = 1002,

    StartPos = sceneData:GetDummyPoint(3,"Q304Ambor4").pos,
    StartDir = sceneData:GetDummyPoint(3,"Q304Ambor4").rot,
    RoofPos = sceneData:GetDummyPoint(3,"Q305RoofAmbor").pos,
    RoofDir = sceneData:GetDummyPoint(3,"Q305RoofAmbor").rot,
    KnightPos = sceneData:GetDummyPoint(3,"Q305KnightAmbor").pos,
    KnightDir = sceneData:GetDummyPoint(3,"Q305KnightAmbor").rot,
}

Q305Config.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
	WendyID = 1001,

	RoofPos = sceneData:GetDummyPoint(3, "Q305RoofWendy").pos,
	RoofDir = sceneData:GetDummyPoint(3, "Q305RoofWendy").rot,
    KnightPos = sceneData:GetDummyPoint(3,"Q305KnightWendy").pos,
    KnightDir = sceneData:GetDummyPoint(3,"Q305KnightWendy").rot,
}

Q305Config.GaiaData =
{
	Gaia = "Gaia",
	GaiaScript = "Actor/Quest/Q301/Gaia301",
	GaiaID = 1004,

	RoofShowPos = sceneData:GetDummyPoint(3, "Q305RoofGaiaShow").pos,
	RoofShowDir = sceneData:GetDummyPoint(3, "Q305RoofGaiaShow").rot,
	RoofTalkPos = sceneData:GetDummyPoint(3, "Q305RoofGaiaTalk").pos,
    RoofTalkDir = sceneData:GetDummyPoint(3, "Q305RoofGaiaTalk").rot,
    KnightPos = sceneData:GetDummyPoint(3,"Q305KnightGaia").pos,
    KnightDir = sceneData:GetDummyPoint(3,"Q305KnightGaia").rot,
}

Q305Config.QinData = 
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,
	BornPos = sceneData:GetDummyPoint(3, "Q411QinBorn").pos,
	BornDir = sceneData:GetDummyPoint(3, "Q411QinBorn").rot,
}

Q305Config.LisaData = 
{
	Lisa = "Lisa",
	LisaScript = "Actor/Quest/Q411/Lisa",
	LisaID = 1007,
    KnightPos = sceneData:GetDummyPoint(3,"Q305KnightLisa").pos,
    KnightDir = sceneData:GetDummyPoint(3,"Q305KnightLisa").rot,
}

Q305Config.BlackData = 
{
    MonsterID = 20103027,
    Black1Pos = sceneData:GetDummyPoint(3,"Q305RoofBlack1").pos,
    Black1Dir = sceneData:GetDummyPoint(3,"Q305RoofBlack1").rot,
    Black2Pos = sceneData:GetDummyPoint(3,"Q305RoofBlack2").pos,
    Black2Dir = sceneData:GetDummyPoint(3,"Q305RoofBlack2").rot,
}

Q305Config.AmborNoReplyInter = 
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


return Q305Config