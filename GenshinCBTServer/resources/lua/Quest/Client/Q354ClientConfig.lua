local QuestClientData = {}

QuestClientData.MainID = 354
QuestClientData.ActorAlias = "354"
QuestClientData.SubIDs = 
{
	q35401 = 35401,
    q35403 = 35403,
    q35404 = 35404,
    q35405 = 35405,
	q35402 = 35402,
}

QuestClientData.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
    PaimonID = 1005,

	Pos1 = sceneData:GetDummyPoint(3,"Q301Hidden").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q301Hidden").rot,	    		
}

QuestClientData.AmborData = 
{
	Ambor = "Ambor",
	AmborScript = "Actor/Quest/Q301/Ambor301",
	AmborID = 1002,

	Pos1 = sceneData:GetDummyPoint(3,"Q354AmborBorn").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q354AmborBorn").rot,	
    Pos2 = sceneData:GetDummyPoint(3,"Q301Hidden").pos,
	Dir2 = sceneData:GetDummyPoint(3,"Q301Hidden").rot,	
	Pos3 = sceneData:GetDummyPoint(3,"Q356Ambor2").pos,
	Dir3 = sceneData:GetDummyPoint(3,"Q356Ambor2").rot,	
}

QuestClientData.NarratorData = {
	Story1 = {
        -- {dialogID = 3540217, audioEvtName = "", duration = 4},
        -- {dialogID = 3540218, audioEvtName = "", duration = 5},
        -- {dialogID = 3540219, audioEvtName = "", duration = 4},
        -- {dialogID = 3540220, audioEvtName = "", duration = 3},
        -- {dialogID = 3540221, audioEvtName = "", duration = 2},
        -- {dialogID = 3540222, audioEvtName = "", duration = 5},
        -- {dialogID = 3540223, audioEvtName = "", duration = 3},
        -- {dialogID = 3540224, audioEvtName = "", duration = 4},
        -- {dialogID = 3540225, audioEvtName = "", duration = 2},
        -- {dialogID = 3540226, audioEvtName = "", duration = 7},
        -- {dialogID = 3540227, audioEvtName = "", duration = 2},
        -- {dialogID = 3540228, audioEvtName = "", duration = 5},
        -- {dialogID = 3540229, audioEvtName = "", duration = 4},
        -- {dialogID = 3540230, audioEvtName = "", duration = 5},
        -- {dialogID = 3540231, audioEvtName = "", duration = 4},
        -- {dialogID = 3540232, audioEvtName = "", duration = 2},
        -- {dialogID = 3540233, audioEvtName = "", duration = 6},
        -- {dialogID = 3540234, audioEvtName = "", duration = 3},	
    },
    Story2 = {
        {dialogID = 3540217, audioEvtName = "", duration = 4},
        {dialogID = 3540218, audioEvtName = "", duration = 5},
        {dialogID = 3540219, audioEvtName = "", duration = 4},
        {dialogID = 3540220, audioEvtName = "", duration = 3},
        {dialogID = 3540221, audioEvtName = "", duration = 2},
        {dialogID = 3540222, audioEvtName = "", duration = 5},
        {dialogID = 3540223, audioEvtName = "", duration = 3},
        {dialogID = 3540224, audioEvtName = "", duration = 4},
    },
    Story3 = {
		{dialogID = 3600001, duration = 3},
		{dialogID = 3600004, duration = 3},
    },
}

QuestClientData.InterData = {
    Cutscene1 = {
        type = CutsceneType.TIME_LINE_PREFAB,
        roleSheetPath = "",
        castListPath = "Cs_CastList_Q354",
        canSkip = false,
        resPath = "ART/Cutscene/Cs_AM_FirstArrive_CutScene2_Convert",
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