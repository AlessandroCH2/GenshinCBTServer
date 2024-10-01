local QuestClientData = {}

QuestClientData.MainID = 461
QuestClientData.ActorAlias = "461"
QuestClientData.SubIDs = 
{
    q46100 = 46100,
    q46101 = 46101,
    q46102 = 46102,
    q46103 = 46103,
    q46104 = 46104,
	q46107 = 46107,
	q46109 = 46109
}

QuestClientData.KaeyaData = 
{
	Kaeya = "Gaia",
	KaeyaScript = "Actor/Quest/Q301/Gaia301",
	KaeyaID = 1004,

	InPos = sceneData:GetDummyPoint(1004,"Q461KaeyaIn").pos,
	InDir = sceneData:GetDummyPoint(1004,"Q461KaeyaIn").rot,
	InPos2 = sceneData:GetDummyPoint(1004,"Q461KaeyaTo").pos,
	InDir2 = sceneData:GetDummyPoint(1004,"Q461KaeyaTo").rot,
	OutPos = sceneData:GetDummyPoint(3,"Q46102Kaeya").pos,
	OutDir = sceneData:GetDummyPoint(3,"Q46102Kaeya").rot,
	Out2Pos = sceneData:GetDummyPoint(3,"Q461KaeyaOut2").pos,
	Out2Dir = sceneData:GetDummyPoint(3,"Q461KaeyaOut2").rot,
	LeavePos= sceneData:GetDummyPoint(3,"Q46102KaeyaLeave").pos,
	LeavePos2= sceneData:GetDummyPoint(3,"Q46107KaeyaLeave").pos,
}

QuestClientData.KaeyaNPCBossData = 
{
	NpcBoss = "KaeyaNpcBoss",
	NpcBossScript = "Actor/Npc/TempNPC",
	NpcBossID = 1214,

	BornPos = sceneData:GetDummyPoint(3,"Q46104NPCBorn").pos,
	BornDir = sceneData:GetDummyPoint(3,"Q46104NPCBorn").rot,
	ToPos = sceneData:GetDummyPoint(3,"Q46104NPCTo").pos,
	ToDir = sceneData:GetDummyPoint(3,"Q46104NPCTo").rot,
	To0Pos = sceneData:GetDummyPoint(3,"Q46104NPCTo0").pos,
	To0Dir = sceneData:GetDummyPoint(3,"Q46104NPCTo0").rot,
}

QuestClientData.NarratorData = {
	Story1 = {
		{dialogID = 4610701, audioEvtName = "", duration = 3},
		{dialogID = 4610702, audioEvtName = "", duration = 3},
		{dialogID = 4610703, audioEvtName = "", duration = 5},
	}
}

QuestClientData.PaimonData = 
{
	Alias = "Paimon",
	Script = "Actor/Quest/Q352/Paimon",
	ID = 1005,
	Pos = sceneData:GetDummyPoint(3,"Q46102Paimon").pos,
	Dir = sceneData:GetDummyPoint(3,"Q46102Paimon").rot,
}


QuestClientData.NPCData = 
{
	Invisible="Q461Invisible",
	Npc1 = "461TempNpc1",
	Npc2 = "461TempNpc2",
	Npc3 = "461TempNpc3",
	NpcScript = "Actor/Npc/TempNPC",
	Npc1ID = 1210,
	Npc2ID = 1211,
	Npc3ID = 1212,
	InvisibleID=1260,
	Npc1Pos = sceneData:GetDummyPoint(3,"Q461NPC1").pos,
	Npc1Dir = sceneData:GetDummyPoint(3,"Q461NPC1").rot,
	Npc2Pos = sceneData:GetDummyPoint(3,"Q461NPC2").pos,
	Npc2Dir = sceneData:GetDummyPoint(3,"Q461NPC2").rot,
	Npc3Pos = sceneData:GetDummyPoint(3,"Q461NPC3").pos,
	Npc3Dir = sceneData:GetDummyPoint(3,"Q461NPC3").rot,
	InvisiblePos = sceneData:GetDummyPoint(3,"Q461KaeyaOut").pos,
	InvisibleDir = sceneData:GetDummyPoint(3,"Q461KaeyaOut").rot,
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