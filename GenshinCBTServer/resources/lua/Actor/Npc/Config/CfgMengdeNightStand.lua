require('Actor/ActorCommon')

local CfgMengdeNightStand = {}

CfgMengdeNightStand.DummyPointData =
{
	Npc = "MengdeNightStand",
	BornDir =
	{
		sceneData:GetDummyPoint(3, "NpcMaleNightStand02Born").rot,
		sceneData:GetDummyPoint(3, "NpcMaleNightStand04Born").rot,
		sceneData:GetDummyPoint(1008, "NpcFemaleNightStand09Born").rot,
	},
	BornPos =
	{
		sceneData:GetDummyPoint(3, "NpcMaleNightStand02Born").pos,
		sceneData:GetDummyPoint(3, "NpcMaleNightStand04Born").pos,
		sceneData:GetDummyPoint(1008, "NpcFemaleNightStand09Born").pos,
	},
	NpcID =
	{
		1408,
		1412,
		1430,
	},
	DialogID =
	{
		4015140899,
		4015141299,
		4015143099,
	},
}

return CfgMengdeNightStand