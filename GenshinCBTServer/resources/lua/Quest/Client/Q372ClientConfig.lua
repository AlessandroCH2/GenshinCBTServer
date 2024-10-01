local QuestClientData = {}

QuestClientData.MainID = 372
QuestClientData.ActorAlias = "372"
QuestClientData.SubIDs = 
{
	q37201 = 37201,
	q37202 = 37202,
	q37203 = 37203,
	q37204 = 37204,
}

QuestClientData.PurifyTearCfg =
{
	type = CutsceneType.TIME_LINE_PREFAB,
	canSkip = true,
	castListPath = "Cs_CastList_Q372",
	resPath = "ART/Cutscene/Cs_MDAQ41_CleanTear_Convert",
	startPosType = CutsceneInitPosType.FREE,
	startOffset = {0, 0, 0},
	keepCamera = true,
	entityBan="37201_Dialog",
	fadeInDuration = 0.0
}

QuestClientData.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1005,

	bornPos = sceneData:GetDummyPoint(3,"Q372Paimon").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q372Paimon").rot,	

}

QuestClientData.WendyData = 
{
	Wendy = "Wendy",
	WendyScript = "Actor/Quest/Q301/Wendy301",
	WendyID = 1160,

	bornPos = sceneData:GetDummyPoint(3,"Q372Venti").pos,
	bornDir = sceneData:GetDummyPoint(3,"Q372Venti").rot,	
	desPos = sceneData:GetDummyPoint(3,"Q372VentiDis").pos,
}


return QuestClientData