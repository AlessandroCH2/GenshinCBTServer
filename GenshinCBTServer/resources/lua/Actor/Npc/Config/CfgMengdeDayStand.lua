require('Actor/ActorCommon')

local CfgMengdeDayStand = {}

CfgMengdeDayStand.DummyPointData =
{
	Npc = "MengdeDayStand",
	BornDir =
	{
		sceneData:GetDummyPoint(3, "NpcFemaleDayStand01Born").rot,
		sceneData:GetDummyPoint(3, "NpcMaleDayStand01Born").rot,
		sceneData:GetDummyPoint(3, "NpcFemaleDayStand02Born").rot,
		sceneData:GetDummyPoint(3, "NpcMaleDayStand03Born").rot,
		sceneData:GetDummyPoint(3, "NpcMaleDayStand04Born").rot,
		sceneData:GetDummyPoint(3, "NpcMaleDayStand05Born").rot,
		sceneData:GetDummyPoint(3, "NpcFemaleDayStand08Born").rot,
		sceneData:GetDummyPoint(3, "NpcFemaleDayStand09Born").rot,
		sceneData:GetDummyPoint(3, "NpcMaleDayStand15Born").rot,
		sceneData:GetDummyPoint(3, "NpcFemaleDayStand12Born").rot,
	},
	BornPos =
	{
		sceneData:GetDummyPoint(3, "NpcFemaleDayStand01Born").pos,
		sceneData:GetDummyPoint(3, "NpcMaleDayStand01Born").pos,
		sceneData:GetDummyPoint(3, "NpcFemaleDayStand02Born").pos,
		sceneData:GetDummyPoint(3, "NpcMaleDayStand03Born").pos,
		sceneData:GetDummyPoint(3, "NpcMaleDayStand04Born").pos,
		sceneData:GetDummyPoint(3, "NpcMaleDayStand05Born").pos,
		sceneData:GetDummyPoint(3, "NpcFemaleDayStand08Born").pos,
		sceneData:GetDummyPoint(3, "NpcFemaleDayStand09Born").pos,
		sceneData:GetDummyPoint(3, "NpcMaleDayStand15Born").pos,
		sceneData:GetDummyPoint(3, "NpcFemaleDayStand12Born").pos,
	},
	NpcID =
	{
		1401,
		1403,
		1405,
		1409,
		1411,
		1413,
		1427,
		1429,
		1451,
		1453,
		1453,
	},
	DialogID =
	{
		4015140199,
		4015140399,
		4015140599,
		4015140999,
		4015141199,
		4015141399,
		4015142799,
		4015142999,
		4015145199,
		4015145399,
	},
}

return CfgMengdeDayStand