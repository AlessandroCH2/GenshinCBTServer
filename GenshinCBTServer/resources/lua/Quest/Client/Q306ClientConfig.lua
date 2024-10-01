local QuestClientData = {}

QuestClientData.MainID = 306
QuestClientData.ActorAlias = "306"
QuestClientData.SubIDs = 
{
    q30600 = 30600,
    q30601 = 30601,
    q30602 = 30602,
    q30603 = 30603,
    q30604 = 30604,
    q30607 = 30607,
    q30608 = 30608,
	q30609 = 30609,
	q30610 = 30610,
	q30611 = 30611,
	q30612 = 30612,
}

QuestClientData.AmborData = 
{
	Ambor = "Ambor",
	AmborScript = "Actor/Quest/Q301/Ambor301",
	AmborID = 1002,

	DoorPos = sceneData:GetDummyPoint(3,"Q306DungeonDoor").pos,
    DoorDir = sceneData:GetDummyPoint(3,"Q306DungeonDoor").rot,
    DungeonPos = sceneData:GetDummyPoint(3,"Q306DungeonAmbor").pos,
	DungeonDir = sceneData:GetDummyPoint(3,"Q306DungeonAmbor").rot,
	HiddenPos = sceneData:GetDummyPoint(3,"Q301Hidden").pos,
	HiddenDir = sceneData:GetDummyPoint(3,"Q301Hidden").rot,
	BornPos = sceneData:GetDummyPoint(20009,"Q306Ambor").pos,
	BornDir = sceneData:GetDummyPoint(20009,"Q306Ambor").rot,
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