local QuestClientData = {}

QuestClientData.MainID = 462
QuestClientData.ActorAlias = "462"
QuestClientData.SubIDs = 
{
    q46200 = 46200,
    q46201 = 46201,
    q46202 = 46202,
    q46203 = 46203,
    q46204 = 46204,
    q46207 = 46207,
}

QuestClientData.PaimonData = 
{
	Alias = "Paimon",
	Script = "Actor/Quest/Q352/Paimon",
	ID = 1005,
	Pos = sceneData:GetDummyPoint(3,"Q46204Paimon").pos,
	Dir = sceneData:GetDummyPoint(3,"Q46204Paimon").rot,
}

QuestClientData.TreasureData = 
{
	Alias1 = "Treasure1",
	Alias2 = "Treasure2",
	Treasure1ID = 100172,
	Treasure2ID = 100173,
	Treasure1Pos = sceneData:GetDummyPoint(3,"Q462Treasure1").pos,
	Treasure1Dir = sceneData:GetDummyPoint(3,"Q462Treasure1").rot,
	Treasure2Pos = sceneData:GetDummyPoint(3,"Q462Treasure2").pos,
    Treasure2Dir = sceneData:GetDummyPoint(3,"Q462Treasure2").rot,	
}

QuestClientData.NPCData = 
{
	Npc = "KaeyaNpc",
	NPCScript = "Actor/Npc/TempNPC",
	NpcID = 1213,
	bubble = 4611001,
	NPCPos = sceneData:GetDummyPoint(3,"Q462NPC").pos,
	NPCDir = sceneData:GetDummyPoint(3,"Q462NPC").rot,
	NPCBornPos = sceneData:GetDummyPoint(3,"Q462NPCBorn").pos,
	NPCBornDir = sceneData:GetDummyPoint(3,"Q462NPCBorn").rot,
	NPCToPos = sceneData:GetDummyPoint(3,"Q462NPCTo").pos,
	NPCToDir = sceneData:GetDummyPoint(3,"Q462NPCTo").rot,
	cameraPos = sceneData:GetDummyPoint(3,"Q462Cam").pos,
	cameraDir = sceneData:GetDummyPoint(3,"Q462Cam").rot,
	
}

QuestClientData.RoutePoints = 
{
	sceneData:GetDummyPoint(3,"Q462NPCRun1").pos,
	sceneData:GetDummyPoint(3,"Q462NPCRun2").pos,
	sceneData:GetDummyPoint(3,"Q462NPCTo").pos,
}

QuestClientData.KaeyaData = 
{
	Kaeya = "Gaia",
	KaeyaScript = "Actor/Quest/Q301/Gaia301",
	KaeyaID = 1004,
	


	InPos = sceneData:GetDummyPoint(1004,"Q461KaeyaIn").pos,
	InDir = sceneData:GetDummyPoint(1004,"Q461KaeyaIn").rot,
	OutPos = sceneData:GetDummyPoint(3,"Q461KaeyaOut").pos,
    OutDir = sceneData:GetDummyPoint(3,"Q461KaeyaOut").rot,
	
}

QuestClientData.NarratorData = {
	Story1 = {
    	{dialogID = 4620801, audioEvtName = "", duration = 4},
		{dialogID = 4620802, audioEvtName = "", duration = 4},
	},
	Story2 = {
    	{dialogID = 4620401, audioEvtName = "", duration = 4},
	},
	Story3 = {
    	{dialogID = 4620601, audioEvtName = "", duration = 4},
	},
	Story4 = {
    	{dialogID = 4620101, audioEvtName = "", duration = 4},
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