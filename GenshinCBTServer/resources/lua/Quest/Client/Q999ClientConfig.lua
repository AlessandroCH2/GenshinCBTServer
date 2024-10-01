local QuestClientData = {}

QuestClientData.FollowData = {
	Follow1 = {

	},
}

QuestClientData.NarratorData = {
	Narrator1 = {
		
		flow = {
			{dialogID = 3510008, duration = 2},
			{dialogID = 3510009, duration = 3},
			{dialogID = 3510010, duration = 2},
			{dialogID = 3510011, duration = 3},
			{dialogID = 3510012, duration = 3},
		}
	}
}

QuestClientData.InterData = {
	Inter1 = {
		type = CutsceneType.TIME_LINE_PREFAB,
		canSkip = true,
		resPath = "ART/Cutscene/Cs_Opening_CutScene1",
		startPosType = CutsceneInitPosType.FREE,
		startOffset = {0, 0, 0},
		keepCamera = true
	}
}

return QuestClientData