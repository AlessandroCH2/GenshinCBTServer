local QuestClientData = {}

QuestClientData.MainID = 308
QuestClientData.ActorAlias = "308"
QuestClientData.SubIDs = 
{
    q30800 = 30800,
    q30801 = 30801,
    q30802 = 30802,
    q30803 = 30803,
    q30804 = 30804,
    q30807 = 30807,
    q30808 = 30808,
    q30809 = 30809,
    q30810 = 30810,
    q30811 = 30811,
    q30812 = 30812,
    q30814 = 30814,
}

QuestClientData.LisaData = 
{
	Lisa = "Lisa",
	LisaScript = "Actor/Quest/Q411/Lisa",
    LisaID = 1007,
    
	DoorPos = sceneData:GetDummyPoint(3,"Q308DungeonDoor").pos,
    DoorDir = sceneData:GetDummyPoint(3,"Q308DungeonDoor").rot,
    DungeonPos = sceneData:GetDummyPoint(3,"Q308DungeonLisa").pos,
	DungeonDir = sceneData:GetDummyPoint(3,"Q308DungeonLisa").rot,
	HiddenPos = sceneData:GetDummyPoint(3,"Q301Hidden").pos,
    HiddenDir = sceneData:GetDummyPoint(3,"Q301Hidden").rot,
    Pos1 = sceneData:GetDummyPoint(20011,"Q308LisaDungeon").pos,
    Dir1 = sceneData:GetDummyPoint(20011,"Q308LisaDungeon").rot,
    BornPos = sceneData:GetDummyPoint(20011,"Q308Lisa").pos,
    BornDir = sceneData:GetDummyPoint(20011,"Q308Lisa").rot,
}

QuestClientData.RoutePoints = 
{
	sceneData:GetDummyPoint(3,"Q308DungeonLisa").pos,
	sceneData:GetDummyPoint(3,"Q308DungeonLisa2").pos,
	sceneData:GetDummyPoint(3,"Q308DungeonLisa3").pos,
	sceneData:GetDummyPoint(3,"Q308DungeonDoor").pos
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