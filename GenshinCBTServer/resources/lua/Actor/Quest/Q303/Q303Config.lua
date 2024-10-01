require('Actor/ActorCommon')

local Q303Config = {}

Q303Config.MainID = 303
Q303Config.ActorAlias = "303"

Q303Config.SubIDs = 
{
	q30301 = 30301,
	q30302 = 30302,
	q30303 = 30303,
	q30304 = 30304,
	q30305 = 30305,
	q30306 = 30306,
}

Q303Config.TestTimeCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_MdGoddess_Lite01_CamMove",
	canSkip = false,
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0}
}

return Q303Config