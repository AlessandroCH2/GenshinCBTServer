require('Actor/ActorCommon')

local Q413Config = {}

Q413Config.MainID = 413
Q413Config.ActorAlias = "413"

Q413Config.ItemPoisonID = 100107

Q413Config.SubIDs = 
{
	q41300 = 41300,
	q41301 = 41301,
	q41302 = 41302,
	q41303 = 41303,
	q41304 = 41304,
	q41305 = 41305,
	q41306 = 41306,
	q41307 = 41307,
	q41308 = 41308,
	q41309 = 41309,
	q41310 = 41310,
	q41311 = 41311,
	q41312 = 41312,
	q41313 = 41313,
	q41314 = 41314,
	q41315 = 41315,
	q41316 = 41316,
	q41317 = 41317,
	q41318 = 41318,
}

Q413Config.LisaData = 
{
	Lisa = "Lisa",
	LisaScript = "Actor/Quest/Q411/Lisa",
	LisaID = 1007,
	bornPos = sceneData:GetDummyPoint(3, "Q411LisaBorn").pos,
	bornDir = sceneData:GetDummyPoint(3, "Q411LisaBorn").rot,
}

Q413Config.PaimonData = 
{
	Paimon = "Paimon",
	PaimonScript = "Actor/Quest/Q352/Paimon",
	PaimonID = 1005,
}

Q413Config.BarbaraData = 
{
	Barbara = "Barbara",
	BarbaraScript = "Actor/Quest/Q413/Barbara",
	BarbaraID = 1008,
	bornPos = sceneData:GetDummyPoint(3, "Q413BarbaraBorn").pos,
	bornDir = sceneData:GetDummyPoint(3, "Q413BarbaraBorn").rot,
	hidePos = sceneData:GetDummyPoint(3, "Q413BarbaraHide").pos,
	hideDir = sceneData:GetDummyPoint(3, "Q413BarbaraHide").rot,
	livePos = sceneData:GetDummyPoint(20006, "Q413BabaraLive").pos,
	liveDir = sceneData:GetDummyPoint(20006, "Q413BabaraLive").rot,
	vanishPos = sceneData:GetDummyPoint(20006, "Q413BabaraVanish").pos,
	BeFollowLen = 10,
	BeFollowFailedLen = 50,
}
Q413Config.PastorData = 
{
	Pastor = "Pastor",
	PastorScript = "Actor/Quest/Q413/Pastor",
	PastorID = 1108,
	bornPos = sceneData:GetDummyPoint(3, "Q413PastorBorn").pos,
	bornDir = sceneData:GetDummyPoint(3, "Q413PastorBorn").rot,
	showPos = sceneData:GetDummyPoint(3, "Q413PastorReport").pos,
	showDir = sceneData:GetDummyPoint(3, "Q413PastorReport").rot,
}
Q413Config.CaptainData = 
{
	Captain = "Captain",
	CaptainScript = "Actor/Quest/Q413/Captain",
	CaptainID = 1109,
	CaptainPos = sceneData:GetDummyPoint(20006,"Q413Captain").pos,
	CaptainDir = sceneData:GetDummyPoint(20006,"Q413Captain").rot,
}
Q413Config.SoldierData = 
{
	Soldier = "Soldier",
	SoldierScript = "Actor/Quest/Q413/Soldier",
	SoldierIDs =
	{
		1110,
		1111,
		1112,
		1113,
		1114,
		1115
	},
	SoldierPos =
	{
		sceneData:GetDummyPoint(20006,"Q413InjurySoldier1").pos,
		sceneData:GetDummyPoint(20006,"Q413InjurySoldier2").pos,
		sceneData:GetDummyPoint(20006,"Q413InjurySoldier3").pos,
		sceneData:GetDummyPoint(20006,"Q413WaitSoldier1").pos,
		sceneData:GetDummyPoint(20006,"Q413WaitSoldier2").pos,
		sceneData:GetDummyPoint(20006,"Q413WaitSoldier3").pos,
	},
	SoldierDir =
	{
		sceneData:GetDummyPoint(20006,"Q413InjurySoldier1").rot,
		sceneData:GetDummyPoint(20006,"Q413InjurySoldier2").rot,
		sceneData:GetDummyPoint(20006,"Q413InjurySoldier3").rot,
		sceneData:GetDummyPoint(20006,"Q413WaitSoldier1").rot,
		sceneData:GetDummyPoint(20006,"Q413WaitSoldier2").rot,
		sceneData:GetDummyPoint(20006,"Q413WaitSoldier3").rot,
	},
}

Q413Config.NarratorFlow1 =
{
	{dialogID = 4130501, audioEvtName = "", duration = 4},
	{dialogID = 4130502, audioEvtName = "", duration = 4},
}

Q413Config.NarratorFlow2 =
{
	{dialogID = 4132501, audioEvtName = "", duration = 4},
	{dialogID = 4132502, audioEvtName = "", duration = 4},
	{dialogID = 4132503, audioEvtName = "", duration = 4},
}
Q413Config.NoReplyInter = 
{
	{
		{
			type = InteractionType.DIALOG,
			dialogType = DialogType.LOCK_FRAME,
			talkerName = "芭芭拉",
			content = "我先去了，你也快来"
		}
	},
}

return Q413Config