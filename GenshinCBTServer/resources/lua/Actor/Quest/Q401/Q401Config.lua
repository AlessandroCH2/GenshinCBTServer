require('Actor/ActorCommon')

local Q401Config = {}

Q401Config.MainID = 401
Q401Config.ActorAlias = "401"

Q401Config.SubIDs = 
{
	q40101 = 40101,
	q40102 = 40102,
	q40103 = 40103,
	q40104 = 40104,
	q40105 = 40105,
	q40106 = 40106,
}
Q401Config.TreasureID = 100004
Q401Config.TreasurePos = sceneData:GetDummyPoint(3,"Q401Treasure").pos
Q401Config.Folk1Data = 
{
	Folk1 = "Extras1",
	Folk1Script = "Actor/Quest/Q301/WendyAudience",
	Folk1ID = 1101,
}
Q401Config.MonsterData = 
{
	MonsterIDs = {20103027, 21010201, 21010301, 21010401},
	BossID = 20011301,
	BossDropID = 201002,
}

return Q401Config