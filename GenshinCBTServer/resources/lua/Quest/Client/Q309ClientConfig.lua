local QuestClientData = {}

QuestClientData.MainID = 309
QuestClientData.ActorAlias = "309"
QuestClientData.SubIDs = 
{
	q30901 = 30901,
	-- q30902 = 30902,
	q30903 = 30903,
	q30904 = 30904,
}

QuestClientData.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1005,		
}

QuestClientData.CutsceneData =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	canSkip = true,
	castListPath = "Cs_CastList_Paimon",
	resPath = "ART/Cutscene/Cs_MDAQ000_ChangeWeather_Convert",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0},
	fadeInDuration = 0.0
}

return QuestClientData