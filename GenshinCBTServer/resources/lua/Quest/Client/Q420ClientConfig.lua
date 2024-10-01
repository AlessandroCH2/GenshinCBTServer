local QuestClientData = {}

QuestClientData.MainID = 420
QuestClientData.ActorAlias = "420"
QuestClientData.SubIDs = 
{
	q42001 = 42001,
    -- q38203 = 38203,

}


QuestClientData.SwordBreak =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	roleSheetPath = "",
	resPath = "ART/Cutscene/Cs_MDAQ501_SwordBreak01",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0}
}



return QuestClientData
