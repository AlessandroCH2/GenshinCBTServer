require('Actor/ActorCommon')

local Q402Config = {}

Q402Config.MainID = 402
Q402Config.ActorAlias = "402"

Q402Config.SubIDs = 
{
	q40201 = 40201,
	q40202 = 40202,
	q40203 = 40203,
	q40204 = 40204,
	q40205 = 40205,
	q40206 = 40206,
}
Q402Config.KeyID = 100006
Q402Config.KeyPos = sceneData:GetDummyPoint(3,"Q402Key").pos
Q402Config.Folk2Data = 
{
	Folk1 = "Extras2",
	Folk1Script = "Actor/Quest/Q301/WendyAudience",
	Folk1ID = 1102,
}
Q402Config.HostagePos = sceneData:GetDummyPoint(3,"Q402Hostage").pos
Q402Config.HostageDir = sceneData:GetDummyPoint(3,"Q402Hostage").rot
Q402Config.Follow1Pos = sceneData:GetDummyPoint(3,"Q402Follow1").pos
Q402Config.Follow2Pos = sceneData:GetDummyPoint(3,"Q402Follow2").pos
Q402Config.Follow3Pos = sceneData:GetDummyPoint(3,"Q402Follow3").pos
Q402Config.Follow4Pos = sceneData:GetDummyPoint(3,"Q402Follow4").pos
Q402Config.Hostage = 
{
	Hostage = "Hostage",
	HostageScript = "Actor/Quest/Q402/Hostage",
	HostageID = 1151,
}
Q402Config.MonsterData = 
{
	MonsterIDs = {21010301, 21010301, 21010301, 21010301},
}

return Q402Config