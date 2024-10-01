local QuestClientData = {}

QuestClientData.MainID = 464
QuestClientData.ActorAlias = "464"
QuestClientData.SubIDs = 
{
    q46400 = 46400,
    q46401 = 46401,
    q46402 = 46402,
    q46403 = 46403,
    q46404 = 46404,
    q46407 = 46407,
}

QuestClientData.PaimonData = 
{
	Alias = "Paimon",
	Script = "Actor/Quest/Q352/Paimon",
	ID = 1005,
	Pos = sceneData:GetDummyPoint(3,"Q464Paimon1").pos,
	Dir = sceneData:GetDummyPoint(3,"Q464Paimon1").rot,
	hiddenPos = sceneData:GetDummyPoint(3,"Q301Hidden").pos,
	hiddenDir = sceneData:GetDummyPoint(3,"Q301Hidden").rot,	
}

QuestClientData.DilucData = 
{
	Diluc = "Diluc",
	DilucScript = "Actor/Quest/Q376/Diluc",
	DilucID = 1009,
    Pos1 = sceneData:GetDummyPoint(3,"Q464Diluc1").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q464Diluc1").rot,
    hiddenPos = sceneData:GetDummyPoint(3,"Q301Hidden").pos,
	hiddenDir = sceneData:GetDummyPoint(3,"Q301Hidden").rot,		
}

QuestClientData.HoffmanData = 
{
	Hoffman = "Hoffman",
	HoffmanScript = "Actor/Quest/Q376/Soldier",
	HoffmanID = 1218,
    Pos1 = sceneData:GetDummyPoint(3,"Q464Hoffman1").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q464Hoffman1").rot,
    hiddenPos = sceneData:GetDummyPoint(3,"Q301Hidden").pos,
	hiddenDir = sceneData:GetDummyPoint(3,"Q301Hidden").rot,		
}

--[[ QuestClientData.GateGuardData = 
{
	GateGuard = "GateGuard",
	GateGuardScript = "Actor/Quest/Q376/Soldier",
	GateGuardID = 1217,
    Pos1 = sceneData:GetDummyPoint(3,"Q464GateGuard1").pos,
	Dir1 = sceneData:GetDummyPoint(3,"Q464GateGuard1").rot,		
} ]]

QuestClientData.NarratorData = {
	Story1 = {
    	{dialogID = 4640001, audioEvtName = "", duration = 4},
    },
    CutsceneTemp = {
    	{dialogID = 4640002, audioEvtName = "", duration = 6},
	},
}

QuestClientData.InterData = {
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