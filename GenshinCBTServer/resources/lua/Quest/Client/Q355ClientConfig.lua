local QuestClientData = {}

QuestClientData.MainID = 355
QuestClientData.ActorAlias = "355"
QuestClientData.SubIDs = 
{
	q35501 = 35501,
	q35502 = 35502,
	q35503 = 35503,
	q35504 = 35504,
	q35505 = 35505,
}

QuestClientData.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1005,

	Pos1 = sceneData:GetDummyPoint(3,"Q355Paimon1").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q355Paimon1").rot,	
    Pos2 = sceneData:GetDummyPoint(3,"Q355Paimon2").pos,
	Dir2 = sceneData:GetDummyPoint(3,"Q355Paimon2").rot,	
}

QuestClientData.NarratorData = {
	CutsceneTemp = {
	},
	Story1 = {
		{dialogID = 3550501, duration = 5},
	}
}

QuestClientData.TearData = {
	Tear = "Tear",
	TearID = 100135,
	TearPos = sceneData:GetDummyPoint(3,"Q355Stone").pos,
    TearDir = sceneData:GetDummyPoint(3,"Q355Stone").rot,
}

QuestClientData.InterData = {
	Cutscene1 = {
		type = CutsceneType.TIME_LINE_PREFAB,
		canSkip = true,
		castListPath = "Cs_CastList_Q355",
		resPath = "ART/Cutscene/Cs_MDAQ013_DragonInYJLin_Convert",
		startPosType = CutsceneInitPosType.FREE,
		startOffset = {0, 0, 0},
		keepCamera = true
	},
	NoReplyInter = {
		{
			{
				type = InteractionType.DIALOG,
				dialogType = DialogType.LOCK_FRAME,
				dialogID = 3500001,
			}
		},
	}
}



return QuestClientData