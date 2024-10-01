require('Actor/ActorCommon')

local Q411Config = {}

Q411Config.MainID = 411
Q411Config.ActorAlias = "411"

Q411Config.ItemFileID = 100101
Q411Config.ItemJourneyNotesID = 100102
Q411Config.ItemMusic1stHalfID = 100103
Q411Config.ItemMusic2ndHalfID = 100104
Q411Config.ItemLetterID = 100105
Q411Config.ItemBookFallNightID = 100106

Q411Config.SubIDs = 
{
	q41100 = 41100,
	q41101 = 41101,
	q41102 = 41102,
	q41103 = 41103,
	q41104 = 41104,
	q41105 = 41105,
	q41106 = 41106,
	q41107 = 41107,
	q41108 = 41108,
	q41109 = 41109,
	q41110 = 41110,
	q41111 = 41111,
	q41112 = 41112,
	q41113 = 41113,
	q41114 = 41114,
	q41115 = 41115,
	q41116 = 41116,
	q41117 = 41117,
	q41118 = 41118,
}

Q411Config.QinData = 
{
	Qin = "Qin",
	QinScript = "Actor/Quest/Q411/Qin",
	QinID = 1006,
	bornPos = sceneData:GetDummyPoint(3, "Q411QinBorn").pos,
	bornDir = sceneData:GetDummyPoint(3, "Q411QinBorn").rot,
}

Q411Config.LisaData = 
{
	Lisa = "Lisa",
	LisaScript = "Actor/Quest/Q411/Lisa",
	LisaID = 1007,
	bornPos = sceneData:GetDummyPoint(3, "Q411LisaBorn").pos,
	bornDir = sceneData:GetDummyPoint(3, "Q411LisaBorn").rot,
}

Q411Config.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1005,
}

Q411Config.MerchantData = 
{
	Merchant = "Merchant",
	MerchantScript = "Actor/Quest/Q411/Merchant",
	MerchantID = 1107,
	bornPos = sceneData:GetDummyPoint(3, "Q411Merchant").pos,
	bornDir = sceneData:GetDummyPoint(3, "Q411Merchant").rot,
}
Q411Config.SpeedFieldDir = { x = 48.748, y = 0.0, z = -469.432 }
Q411Config.SpeedFieldPos =
{
	{x=1600.12, y=330, z=-6262.65},
	{x=1602.83, y=324, z=-6288.73},
	{x=1605.54, y=318, z=-6314.81},
	{x=1608.24, y=312, z=-6340.89},
	{x=1610.95, y=306, z=-6366.97},
	{x=1613.66, y=300, z=-6393.05},
	{x=1616.37, y=294, z=-6419.13},
	{x=1619.08, y=288, z=-6445.21},
	{x=1621.79, y=282, z=-6471.29},
	{x=1624.49, y=276, z=-6497.36},
	{x=1627.2, y=270, z=-6523.44},
	{x=1629.91, y=264, z=-6549.52},
	{x=1632.62, y=258, z=-6575.6},
	{x=1635.33, y=252, z=-6601.68},
	{x=1638.04, y=246, z=-6627.76},
	{x=1640.74, y=240, z=-6653.84},
	{x=1643.45, y=234, z=-6679.92},
	{x=1646.16, y=228, z=-6706},						
}
Q411Config.LookTimeCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_QinSQ_LookAtIsland",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0}
}

Q411Config.QinSingTimeCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_QinSQ_CutScene2_Convert",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0}
}

Q411Config.SunRiseTimeCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_QinSQ_Cutscene3_Convert",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0}
}

Q411Config.NarratorFlow1 =
{
	{dialogID = 4111801, audioEvtName = "", duration = 4},
	{dialogID = 4111802, audioEvtName = "", duration = 4},
	{dialogID = 4111803, audioEvtName = "", duration = 4},
}

Q411Config.NarratorFlow2 =
{
    {dialogID = 4111001, audioEvtName = "", duration = 4},
    {dialogID = 4111002, audioEvtName = "", duration = 4},
}
return Q411Config