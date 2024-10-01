require('Actor/ActorCommon')

local CfgMengdeInsomniaPatrol = {}

CfgMengdeInsomniaPatrol.DummyPointData =
{
	Npc = "MengdeInsomniaPatrol",
	PosData={
		{
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos01").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos02").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos03").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos04").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos05").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos06").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos07").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos08").pos,
		},
		{
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos01").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos02").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos03").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos04").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos05").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos06").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos07").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos08").pos,
		},
		{
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos01").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos02").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos03").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos04").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos05").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos06").pos,
		},
		{
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos01").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos02").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos03").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos04").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos05").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos06").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos07").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos08").pos,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos09").pos,
		},
	},
	DirData={
		{
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos01").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos02").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos03").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos04").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos05").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos06").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos07").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos08").rot,
		},
		{
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos01").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos02").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos03").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos04").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos05").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos06").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos07").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos08").rot,
		},
		{
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos01").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos02").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos03").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos04").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos05").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos06").rot,
		},
		{
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos01").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos02").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos03").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos04").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos05").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos06").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos07").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos08").rot,
			sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos09").rot,
		},
	},
	TimeData={
		{
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
		},
		{
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
		},
		{
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
			0,
		},
		{
			0,
			0,
			0,
			0,
			0,
			0,
		},
	},
	Pos01Pos =
	{
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos01").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos01").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos01").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos01").pos,
	},
	Pos02Pos =
	{
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos02").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos02").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos02").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos02").pos,
	},
	Pos03Pos =
	{
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos03").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos03").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos03").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos03").pos,
	},
	Pos04Pos =
	{
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos04").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos04").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos04").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos04").pos,
	},
	Pos05Pos =
	{
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos05").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos05").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos05").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos05").pos,
	},
	Pos06Pos =
	{
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol07Pos06").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol12Pos06").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol13Pos06").pos,
		sceneData:GetDummyPoint(3, "NpcMaleInsomniaPatrol14Pos06").pos,
	},
	NpcID =
	{
		1433,
		1445,
		1447,
		1449,
	},
	DialogID =
	{
		4015143399,
		4015144599,
		4015144799,
		4015144999,
	},
}

return CfgMengdeInsomniaPatrol