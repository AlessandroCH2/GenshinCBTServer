local QuestClientData = {}

QuestClientData.MainID = 356
QuestClientData.ActorAlias = "356"
QuestClientData.SubIDs = 
{
	q35601 = 35601,
	q35602 = 35602,
	q35603 = 35603,
	q35604 = 35604,
	q35605 = 35605,
	q35606 = 35606,
}

QuestClientData.FollowData = {
	Follow1 = {
		pos = sceneData:GetDummyPoint(3, "Q356Ambor3").pos,
		beFollowLen = 10,
		beFollowFailed = -1
	}
}

QuestClientData.AmborRouteData = {
	routeConfig = {
		sceneData:GetDummyPoint(3,"Q356AmborRoute1").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute2").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute3").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute4").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute5").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute6").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute7").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute8").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute9").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute10").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute11").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute12").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute13").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute14").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute15").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute16").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute17").pos,
		sceneData:GetDummyPoint(3,"Q356AmborRoute18").pos,
		sceneData:GetDummyPoint(3,"Q356Ambor4").pos
	},
	beFollowLen = 10,
	beFollowFailed = 45
}

QuestClientData.AmborData = 
{
	Ambor = "Ambor",
	AmborScript = "Actor/Quest/Q301/Ambor301",
	AmborID = 1002,

	Pos1 = sceneData:GetDummyPoint(3,"Q356Ambor1").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q356Ambor1").rot,	
    Pos2 = sceneData:GetDummyPoint(3,"Q356Ambor2").pos,
	Dir2 = sceneData:GetDummyPoint(3,"Q356Ambor2").rot,	
	Pos3 = sceneData:GetDummyPoint(3,"Q356Ambor3").pos,
	Dir3 = sceneData:GetDummyPoint(3,"Q356Ambor3").rot,
	born4Pos = sceneData:GetDummyPoint(3,"Q356Ambor4").pos,
	born4Dir = sceneData:GetDummyPoint(3,"Q356Ambor4").rot,
	born5Pos = sceneData:GetDummyPoint(3,"Q356Target2").pos,
	born5Dir = sceneData:GetDummyPoint(3,"Q356Target2").rot,
}

QuestClientData.StoneData = {
	Stone = "Stone",
	StoneID = 70300013,
	StonePos = sceneData:GetDummyPoint(3,"Q356Stone1").pos,
    StoneDir = sceneData:GetDummyPoint(3,"Q356Stone1").rot,
}

QuestClientData.FlyTrainData = {
	StartPos = sceneData:GetDummyPoint(3,"Q356Player").pos,
	StartDir = sceneData:GetDummyPoint(3,"Q356Player").rot,
}

QuestClientData.NarratorData = {
	Story1 = {
		dialogList = {
        {dialogID = 3560202, duration = 8},
		{dialogID = 3560203, duration = 6},
		},
		pauseLen = 10,
		resumeLen = 10,
		tag = "Story"
	},
	CutsceneTemp = {
	},
}

QuestClientData.InterData = {
    Cutscene1 = {
		type = CutsceneType.TIME_LINE_PREFAB,
		canSkip = true,
		castListPath = "Cs_CastList_Q354",
		roleSheetPath = "",
		resPath = "ART/Cutscene/Cs_DragonInMDCity_CutScene_Convert",
		startPosType = CutsceneInitPosType.FREE,
		startOffset = {x = 0, y = 0, z = 0}
	},
	Cutscene2 = {
		type = CutsceneType.TIME_LINE_PREFAB,
		canSkip = true,
		--castListPath = "Cs_CastList_Q354",
		roleSheetPath = "",
		resPath = "ART/Cutscene/Cs_MDAQ018_MDCityShow_Convert",
		startPosType = CutsceneInitPosType.FREE,
		startOffset = {x = 0, y = 0, z = 0}
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