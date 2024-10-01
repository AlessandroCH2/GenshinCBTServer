local QuestClientData = {}

QuestClientData.MainID = 466
QuestClientData.ActorAlias = "466"
QuestClientData.SubIDs = 
{
	q46601 = 46601,
    q46602 = 46602,
	q46603 = 46603,
	q46604 = 46604,
	q46605 = 46605,
	q46606 = 46606,
	q46607 = 46607,
	q46608 = 46608,
	q46609 = 46609,
	q46610 = 46610,
	q46611 = 46611,
	q46612 = 46612,
    q46613 = 46613,
    q46614 = 46614,
	q46615 = 46615,
	q46616 = 46616,
	q46617 = 46617,
	q46618 = 46618,
	q46619 = 46619,
	q46620 = 46620,
	q46621 = 46621,
	q46622 = 46622,
}

QuestClientData.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1005,
}

QuestClientData.DilucData = 
{
	Diluc = "Diluc",
	DilucScript = "Actor/Quest/Q376/Diluc",
	DilucID = 1009,
    Pos1 = sceneData:GetDummyPoint(3,"Q465DilucTemp1").pos,
    Dir1 = sceneData:GetDummyPoint(3,"Q465DilucTemp1").rot,
    Pos2 = sceneData:GetDummyPoint(3,"Q466Diluc1").pos,
    Dir2 = sceneData:GetDummyPoint(3,"Q466Diluc1").rot,
    Pos3 = sceneData:GetDummyPoint(1009,"Q466Diluc2").pos,
	Dir3 = sceneData:GetDummyPoint(1009,"Q466Diluc2").rot,
	Pos4 = sceneData:GetDummyPoint(3,"Q466FrontDoor").pos,
	Dir4 = sceneData:GetDummyPoint(3,"Q466FrontDoor").rot,
    hiddenPos = sceneData:GetDummyPoint(3,"Q301Hidden").pos,
	hiddenDir = sceneData:GetDummyPoint(3,"Q301Hidden").rot,		
}

QuestClientData.KaeyaData = 
{
	Kaeya = "Gaia",
	KaeyaScript = "Actor/Quest/Q301/Gaia301",
	KaeyaID = 1004,
	
}

QuestClientData.HoffmanData = 
{
	Hoffman = "Hoffman",
	HoffmanScript = "Actor/Quest/Q376/Soldier",
	HoffmanID = 1218,
    Pos1 = sceneData:GetDummyPoint(1009,"Q466Hoffman1").pos,
    Dir1 = sceneData:GetDummyPoint(1009,"Q466Hoffman1").rot,
    hiddenPos = sceneData:GetDummyPoint(3,"Q301Hidden").pos,
	hiddenDir = sceneData:GetDummyPoint(3,"Q301Hidden").rot,		
}

QuestClientData.GuardData = 
{
	Guard = "Guard",
	GuardScript = "Actor/Quest/Q376/Soldier",
	GuardID = 1217,
    Pos1 = sceneData:GetDummyPoint(1009,"Q466Guard1").pos,
    Dir1 = sceneData:GetDummyPoint(1009,"Q466Guard1").rot,
    hiddenPos = sceneData:GetDummyPoint(3,"Q301Hidden").pos,
	hiddenDir = sceneData:GetDummyPoint(3,"Q301Hidden").rot,		
}

QuestClientData.BaitData = {
	Bait = "Bait",
	BaitID = 70300053,
	Pos1 = sceneData:GetDummyPoint(3,"Q466Lure1").pos,
	Dir1 = sceneData:GetDummyPoint(3,"Q466Lure1").rot,
	Pos2 = sceneData:GetDummyPoint(3,"Q466Lure2").pos,
    Dir2 = sceneData:GetDummyPoint(3,"Q466Lure2").rot,
}

QuestClientData.LureData = {
	Lure = "Lure",
	LureID = 100177,
	Pos1 = sceneData:GetDummyPoint(3,"Q466Lure1").pos,
	Dir1 = sceneData:GetDummyPoint(3,"Q466Lure1").rot,
	Pos2 = sceneData:GetDummyPoint(3,"Q466Lure2").pos,
    Dir2 = sceneData:GetDummyPoint(3,"Q466Lure2").rot,
}

QuestClientData.NarratorData = {
	Story1 = {
		{dialogID = 4660001, audioEvtName = "", duration = 6},
		{dialogID = 4660008, audioEvtName = "", duration = 4},
		{dialogID = 4660009, audioEvtName = "", duration = 4},

    },
    Story2 = {
    	{dialogID = 4660002, audioEvtName = "", duration = 4},
	},
	Story3 = {
    	{dialogID = 4660003, audioEvtName = "", duration = 5},
    	{dialogID = 4660012, audioEvtName = "", duration = 3},
	},
	Story4 = {
		{dialogID = 4660004, audioEvtName = "", duration = 4},
    	{dialogID = 4660005, audioEvtName = "", duration = 4},
	},
	Story5 = {
    	{dialogID = 4660006, audioEvtName = "", duration = 4},
	},
	Story6 = {
    	{dialogID = 4660007, audioEvtName = "", duration = 4},
	},
	Story7 = {
		{dialogID = 4660010, audioEvtName = "", duration = 3},
		{dialogID = 4660011, audioEvtName = "", duration = 5},
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