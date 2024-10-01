require('Actor/ActorCommon')

local Q408Config = {}

Q408Config.MainID = 408
Q408Config.ActorAlias = "408"

Q408Config.SubIDs = 
{
	q40801 = 40801,
	q40802 = 40802,
	q40803 = 40803,
	q40804 = 40804,
	q40805 = 40805,
    q40806 = 40806,
    q40807 = 40807,
    q40808 = 40808,
    q40809 = 40809,
    q40810 = 40810,
}

Q408Config.KeyPos = sceneData:GetDummyPoint(3,"Q408KeyPos").pos
Q408Config.KeyDir = { x = 45, y = 0, z = 0 }
Q408Config.MatchTime = 12
Q408Config.gotKey = false

Q408Config.BoardSeperateGadgetID = 70300031
Q408Config.BoardTogetherGadgetID = 70300032
Q408Config.BoardPos = sceneData:GetDummyPoint(3,"Q408BoardPos").pos
Q408Config.BoardDir = { x = 0, y = 84, z = 0 }

Q408Config.PlayerPos = sceneData:GetDummyPoint(3,"Q408PlayerPos").pos
Q408Config.PlayerDir = sceneData:GetDummyPoint(3,"Q408PlayerPos").rot

Q408Config.JudgeData = 
{
	Judge = "RiverRunJudge",
	JudgeScript = "Actor/Quest/Q408/RiverRunJudge",
	JudgeID = 1116,

	JudgePos = sceneData:GetDummyPoint(3,"Q408JudgePos").pos,
	JudgeDir = sceneData:GetDummyPoint(3,"Q408JudgePos").rot,	
}

return Q408Config