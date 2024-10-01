local QuestClientData = {}

QuestClientData.MainID = 463
QuestClientData.ActorAlias = "463"
QuestClientData.SubIDs = 
{
    q46300 = 46300,
    q46301 = 46301,
    q46302 = 46302,
    q46303 = 46303,
    q46304 = 46304,
    q46307 = 46307,
}

QuestClientData.PaimonData = 
{
	Alias = "Paimon",
	Script = "Actor/Quest/Q352/Paimon",
	ID = 1005,
	Pos1 = sceneData:GetDummyPoint(3,"Q462PuzzleEnd").pos,
	Dir1 = sceneData:GetDummyPoint(3,"Q462PuzzleEnd").rot,
	Pos2 = sceneData:GetDummyPoint(3,"Q463Dungeon").pos,
	Dir2 = sceneData:GetDummyPoint(3,"Q463Dungeon").rot,
	Pos3 = sceneData:GetDummyPoint(20016,"Q463Paimon").pos,
	Dir3 = sceneData:GetDummyPoint(20016,"Q463Paimon").rot,
	BornPos = sceneData:GetDummyPoint(20016,"Q463Born").pos,
	BornDir = sceneData:GetDummyPoint(20016,"Q463Born").rot,
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

QuestClientData.NarratorData = {
	Story1 = {
    	{dialogID = 4630339, audioEvtName = "", duration = 3},
		{dialogID = 4630340, audioEvtName = "", duration = 3},
		{dialogID = 4630341, audioEvtName = "", duration = 3},
		{dialogID = 4630342, audioEvtName = "", duration = 3},
		{dialogID = 4630343, audioEvtName = "", duration = 3},
	},
}

QuestClientData.KaeyaData = 
{
	Kaeya = "Gaia",
	KaeyaScript = "Actor/Quest/Q301/Gaia301",
	KaeyaID = 1004,
	InPos = sceneData:GetDummyPoint(20016,"Q463Kaeya").pos,
	InDir = sceneData:GetDummyPoint(20016,"Q463Kaeya").rot,
	BornPos = sceneData:GetDummyPoint(20016,"Q463Born").pos,
	BornDir = sceneData:GetDummyPoint(20016,"Q463Born").rot,	
}

QuestClientData.KaeyaNPCBossData = 
{
	NpcBoss = "KaeyaNpcBoss",
	NpcBossScript = "Actor/Npc/TempNPC",
	NpcBossID = 1214,

	NpcBossPos = sceneData:GetDummyPoint(20016,"Q463NPC").pos,
	NpcBossDir = sceneData:GetDummyPoint(20016,"Q463NPC").rot,
	TrapPos = sceneData:GetDummyPoint(20016,"Q463Trap").pos,
	TrapDir = sceneData:GetDummyPoint(20016,"Q463Trap").rot,
	LastPos = sceneData:GetDummyPoint(20016,"Q46303NpcLaste").pos,
	LastDir = sceneData:GetDummyPoint(20016,"Q46303NpcLaste").rot,
}

QuestClientData.Invisible = 
{
	Invisible="Invisible",
	NpcScript = "Actor/Npc/TempNPC",
	InvisibleID= 1234,
	InvisiblePos = sceneData:GetDummyPoint(20016,"Q463Dummy").pos,
	InvisibleDir = sceneData:GetDummyPoint(20016,"Q463Dummy").rot,
}

QuestClientData.DungeonData = 
{
	Alias = "Dungeon",
	DoorID = 70800010,
	Pos = sceneData:GetDummyPoint(3,"Q463DungeonDoorEffect").pos,
	Dir = sceneData:GetDummyPoint(3,"Q463DungeonDoorEffect").rot,
}

QuestClientData.SoldierData = 
{
	Alias1 = "Soldier1",
	Alias2 = "Soldier2",
	ID1 = 1215,
	ID2 = 1240,
	Script = "Actor/Npc/TempNPC",
	BornPos1 = sceneData:GetDummyPoint(20016,"Q463SoldierBorn").pos,
	BornDir1 = sceneData:GetDummyPoint(20016,"Q463SoldierBorn").rot,
	BornPos2 = sceneData:GetDummyPoint(20016,"Q463SoldierBorn2").pos,
	BornDir2 = sceneData:GetDummyPoint(20016,"Q463SoldierBorn2").rot,
	Pos1 = sceneData:GetDummyPoint(20016,"Q463Soldier").pos,
	Dir1 = sceneData:GetDummyPoint(20016,"Q463Soldier").rot,
	Pos2 = sceneData:GetDummyPoint(20016,"Q463Soldier2").pos,
	Dir2 = sceneData:GetDummyPoint(20016,"Q463Soldier2").rot,
	Pos3 = sceneData:GetDummyPoint(20016,"Q463Soldier3").pos,
	Dir3 = sceneData:GetDummyPoint(20016,"Q463Soldier3").rot,
	Pos4 = sceneData:GetDummyPoint(20016,"Q463Soldier4").pos,
	Dir4 = sceneData:GetDummyPoint(20016,"Q463Soldier4").rot,
}

return QuestClientData