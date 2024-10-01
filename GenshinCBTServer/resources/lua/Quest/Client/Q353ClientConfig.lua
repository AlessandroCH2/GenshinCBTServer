local QuestClientData = {}

QuestClientData.MainID = 353
QuestClientData.ActorAlias = "353"
QuestClientData.SubIDs = 
{
    --q35300 = 35300,
    q35301 = 35301,
    q35302 = 35302,
    q35303 = 35303,
    q35304 = 35304,
    --q35305 = 35305,
    --q35306 = 35306,
    --q35307 = 35307,
    --q35308 = 35308,
    q35309 = 35309,
    q35310 = 35310,
    q35311 = 35311,
    q35312 = 35312,
}

QuestClientData.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1005,

	Pos1 = sceneData:GetDummyPoint(3,"Q353Teach1").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q353Teach1").rot,	
    Pos2 = sceneData:GetDummyPoint(3,"Q353Monster1").pos,
	Dir2 = sceneData:GetDummyPoint(3,"Q353Monster1").rot,	
	Pos3 = sceneData:GetDummyPoint(3,"Q353Monster2").pos,
	Dir3 = sceneData:GetDummyPoint(3,"Q353Monster2").rot,
	Pos4 = sceneData:GetDummyPoint(3,"Q353PaimonAfterCs").pos,
	Dir4 = sceneData:GetDummyPoint(3,"Q353PaimonAfterCs").rot,
	Pos5 = sceneData:GetDummyPoint(3,"Q353Monster3").pos,
	Dir5 = sceneData:GetDummyPoint(3,"Q353Monster3").rot,
--[[ 	Pos6 = sceneData:GetDummyPoint(3,"Q352Queen").pos,
	Dir6 = sceneData:GetDummyPoint(3,"Q352Queen").rot,	 ]]
}

QuestClientData.NarratorData = {
	Story1 = {
        {dialogID = 3530301, audioEvtName = "", duration = 10},
    },
    Story2 = {
        {dialogID = 3530401, audioEvtName = "", duration = 6},
    },
    Story3 = {
        {dialogID = 3530501, audioEvtName = "", duration = 6},
    },
    Story4 = {
        {dialogID = 3530502, audioEvtName = "", duration = 6},
    },
    Story5 = {
        {dialogID = 3530503, audioEvtName = "", duration = 6},
        {dialogID = 3530504, audioEvtName = "", duration = 6},
    },
}

QuestClientData.BallData = {
	Ball = "Ball",
	BallID = 2025,
	BallPos = sceneData:GetDummyPoint(3,"Q353Monster3").pos,
    BallDir = sceneData:GetDummyPoint(3,"Q353Monster3").rot,
}

QuestClientData.MonsterData = {
	Monster = "Monster",
	MonsterID = 20011202,
	Pos1 = sceneData:GetDummyPoint(3,"Q353Monster1").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q353Monster1").rot,
}

QuestClientData.TargetData = {
    Target1 = "Target1",
    Target2 = "Target2",
    Target3 = "Target3",
    TargetID = 70900201,
    
	Pos1 = sceneData:GetDummyPoint(3,"Q353Monster1").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q353Monster1").rot,
    Pos2 = sceneData:GetDummyPoint(3,"Q353Monster2").pos,
    Dir2 = sceneData:GetDummyPoint(3,"Q353Monster2").rot,
    Pos3 = sceneData:GetDummyPoint(3,"Q353Monster3").pos,
    Dir3 = sceneData:GetDummyPoint(3,"Q353Monster3").rot,
}

QuestClientData.InterData = {
    Cutscene1 = {
        type = CutsceneType.TIME_LINE_PREFAB,
        roleSheetPath = "",
        castListPath = "Cs_CastList_Paimon",
        resPath = "ART/Cutscene/Cs_MdGoddess_Lite01_CamMove_Convert",
        canSkip = false,
        startPosType = CutsceneInitPosType.FREE,
        startOffset = {0, 0, 0}
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