local QuestClientData = {}

QuestClientData.TargetNpc = "QQ1121"

QuestClientData.TargetPos = {
	PosB = sceneData:GetDummyPoint(3, "Q998Pos2"),
	PosC = sceneData:GetDummyPoint(3, "Q998Pos3"),
}

QuestClientData.FollowData = {
	Follow1 = {
		pos = sceneData:GetDummyPoint(3, "Q998Pos3").pos,
		beFollowLen = 10,
		beFollowFailed = 20
	},
	FollowLock1 = {
		pos = sceneData:GetDummyPoint(3, "Q998Pos3").pos,
		beFollowLen = 10,
		beFollowTrans = 30,
		transOffset = 1,
	}
}

QuestClientData.NarratorData = {
	NarratorOnly1 = {
		{dialogID = 3510008, duration = 2},
		{dialogID = 3510009, duration = 3},
		{dialogID = 3510010, duration = 2},
		{dialogID = 3510011, duration = 3},
		{dialogID = 3510012, duration = 3},
	},
	NarratorFollow1 = {
		pauseLen = 10,
		resumeLen = 6,
		dialogList = {
			{dialogID = 3510008, duration = 2},
			{dialogID = 3510009, duration = 3},
			{dialogID = 3510010, duration = 2},
			{dialogID = 3510011, duration = 3},
			{dialogID = 3510012, duration = 3},
		}
	},
	NarratorWarning1 = {
		warningLen = 15,
		stopLen = 25,
		dialogList = {
			{dialogID = 3510008, duration = 2},
			{dialogID = 3510009, duration = 3},
			{dialogID = 3510010, duration = 2},
			{dialogID = 3510011, duration = 3},
			{dialogID = 3510012, duration = 3},
		}
	}
}

QuestClientData.InterData = {
	Cutscene1 = {
		type = CutsceneType.TIME_LINE_PREFAB,
		canSkip = true,
		resPath = "ART/Cutscene/Cs_Opening_CutScene1",
		startPosType = CutsceneInitPosType.FREE,
		startOffset = {0, 0, 0},
		keepCamera = true
	},
	AmborNoReplyInter = {
		{
			{
				type = InteractionType.DIALOG,
				dialogType = DialogType.LOCK_FRAME,
				dialogID = 3122401,
			}
		},
	}
}

return QuestClientData