require('Actor/ActorCommon')

local Q409Config = {}

Q409Config.MainID = 409
Q409Config.ActorAlias = "409"

Q409Config.SubIDs = 
{
	q40901 = 40901,
	q40902 = 40902,
	q40903 = 40903,
	q40904 = 40904,
	q40905 = 40905,
    q40906 = 40906,
    q40907 = 40907,
    q40908 = 40908,
    q40909 = 40909,
    q40910 = 40910,
}

Q409Config.KeyPos = sceneData:GetDummyPoint(3,"Q409KeyPos").pos
Q409Config.KeyDir = { x = 0, y = 90, z = 0 }
Q409Config.MatchTime = 90
Q409Config.Score = 0
Q409Config.RequireScore = 10

Q409Config.BallMonsterID = 20011002
Q409Config.BallPos1 = sceneData:GetDummyPoint(3,"Q409BallPos1").pos
Q409Config.BallPos2 = sceneData:GetDummyPoint(3,"Q409BallPos2").pos
Q409Config.BallPos3 = sceneData:GetDummyPoint(3,"Q409BallPos3").pos
Q409Config.BoardDir = { x = 0, y = 50, z = 0 }

Q409Config.JudgeData = 
{
	Judge = "BallJudge",
	JudgeScript = "Actor/Quest/Q409/BallJudge",
	JudgeID = 1117,

	JudgePos = sceneData:GetDummyPoint(3,"Q409Judge").pos,
	JudgeDir = sceneData:GetDummyPoint(3,"Q409Judge").rot,	
}

return Q409Config