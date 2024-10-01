local QuestClientData = {}

QuestClientData.MainID = 352
QuestClientData.ActorAlias = "352"
QuestClientData.SubIDs = 
{	
    q35200 = 35200,
	q35201 = 35201,
	q35202 = 35202,
	q35203 = 35203,
	q35204 = 35204,
	q35205 = 35205,
}

QuestClientData.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1005,

	Pos1 = sceneData:GetDummyPoint(3,"Q352PaimontoNPC").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q352PaimontoNPC").rot,	
    Pos2 = sceneData:GetDummyPoint(3,"Q352PaimonWait").pos,
	Dir2 = sceneData:GetDummyPoint(3,"Q352PaimonWait").rot,	
	Pos3 = sceneData:GetDummyPoint(3,"Q352View").pos,
	Dir3 = sceneData:GetDummyPoint(3,"Q352View").rot,
	Pos4 = sceneData:GetDummyPoint(3,"Q352PaimonName").pos,
	Dir4 = sceneData:GetDummyPoint(3,"Q352PaimonName").rot,
	Pos5 = sceneData:GetDummyPoint(3,"Q352ByWater").pos,
	Dir5 = sceneData:GetDummyPoint(3,"Q352ByWater").rot,
	Pos6 = sceneData:GetDummyPoint(3,"Q352Queen").pos,
	Dir6 = sceneData:GetDummyPoint(3,"Q352Queen").rot,	
}

QuestClientData.RoutePoints = 
{
	sceneData:GetDummyPoint(3,"Q352PaimonFollow1").pos,
	sceneData:GetDummyPoint(3,"Q352PaimonFollow4").pos,
	sceneData:GetDummyPoint(3,"Q352PaimonFollow5").pos,
	sceneData:GetDummyPoint(3,"Q352PaimonFollow2").pos,
	sceneData:GetDummyPoint(3,"Q352PaimonFollow6").pos,
	sceneData:GetDummyPoint(3,"Q352PaimonFollow7").pos,
	sceneData:GetDummyPoint(3,"Q352PaimonFollow3").pos,
	sceneData:GetDummyPoint(3,"Q352PaimonFollow8").pos,
	sceneData:GetDummyPoint(3,"Q352ByWater").pos
}

QuestClientData.NarratorData = {
	Story1 = {
        {dialogID = 3520001, audioEvtName = "", duration = 3},
	}
}

QuestClientData.NarratorFlow =
{
	{dialogID = 3521701, audioEvtName = "", duration = 4},
	{dialogID = 3521702, audioEvtName = "", duration = 5},
	{dialogID = 3521703, audioEvtName = "", duration = 5},
	{dialogID = 3521704, audioEvtName = "", duration = 3},
}

QuestClientData.NarratorWarning =
{
	--{dialogID = 3520501, audioEvtName = "", duration = 3},
	--{dialogID = 3520601, audioEvtName = "", duration = 3},
	{dialogID = 3520701, audioEvtName = "", duration = 2},
	{dialogID = 3500201, audioEvtName = "", duration = 28},
}

QuestClientData.NarratorStayWarning =
{
	{dialogID = 3520501, audioEvtName = "", duration = 4},
	{dialogID = 3500201, audioEvtName = "", duration = 26},
	{dialogID = 3520601, audioEvtName = "", duration = 2},
	{dialogID = 3500201, audioEvtName = "", duration = 28},}

QuestClientData.NarratorFlow2 =
{
	{dialogID = 3520301, duration = 3},
}

QuestClientData.FollowLen = 10
QuestClientData.FollowTransLen = 45

QuestClientData.InterData = {
	Cutscene1 = {
        type = CutsceneType.TIME_LINE_PREFAB,
        castListPath = "Cs_CastList_Paimon",
        resPath = "ART/Cutscene/Cs_BigWorldShow_Cutscene",
        canSkip = false,
        startPosType = CutsceneInitPosType.FREE,
        startOffset = {0, 0, 0},
        keepCamera = true
	},
	Cutscene2 = {
		type = CutsceneType.TIME_LINE_PREFAB,
		roleSheetPath = "",
		castListPath = "Cs_CastList_Paimon",
		resPath = "ART/Cutscene/Cs_MDAQ010_UnlockSkill_Convert",
		startPosType = CutsceneInitPosType.FREE,
		startOffset = {0, 0, 0},
		fadeOutDuration = 2.0
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

QuestClientData.PlayerBackInter = 
{
	{
		{
			type = InteractionType.DIALOG,
			dialogType = DialogType.LOCK_FRAME,
			dialogID = 3521001
		},
		{
			type = InteractionType.DIALOG_SELECT,
			dialogIDList = {3521002}
		},
	},
}

return QuestClientData