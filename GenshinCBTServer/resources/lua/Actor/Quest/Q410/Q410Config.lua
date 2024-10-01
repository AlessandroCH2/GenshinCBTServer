require('Actor/ActorCommon')

local Q410Config = {}

Q410Config.MainID = 410
Q410Config.ActorAlias = "410"

Q410Config.SubIDs = 
{
	q41001 = 41001,
	q41002 = 41002,
	q41003 = 41003,
	q41004 = 41004,
	q41005 = 41005,
    q41006 = 41006,
    q41007 = 41007,
    q41008 = 41008,
    q41009 = 41009,
    q41010 = 41010,
}

Q410Config.QiuqiuData = 
{
	Qiuqiu = "Qiuqiu",
	QiuqiuScript = "Actor/Quest/Q410/Qiuqiu",
	QiuqiuID = 1118,
	QiuqiuPos = sceneData:GetDummyPoint(3,"Q410QQ").pos,
	QiuqiuDir = sceneData:GetDummyPoint(3,"Q410QQ").rot,	
}

Q410Config.SoldierData = 
{
	Soldier = "Soldier",
	SoldierScript = "Actor/Quest/Q410/Soldier",
	SoldierID = 1119,
	SoldierPos = sceneData:GetDummyPoint(3,"Q410QQ").pos,
    SoldierDir = sceneData:GetDummyPoint(3,"Q410QQ").rot,
    RunPos = sceneData:GetDummyPoint(3,"Q410Run").pos,	
}

Q410Config.MedicinePos = sceneData:GetDummyPoint(3,"Q410Medicine").pos
Q410Config.MedicineDir = { x = 0, y = 90, z = 0 }
Q410Config.MedicineID = 100114

return Q410Config