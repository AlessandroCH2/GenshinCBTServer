require('Actor/ActorCommon')

local Q403Config = {}

Q403Config.MainID = 403
Q403Config.ActorAlias = "403"

Q403Config.SubIDs = 
{
	q40301 = 40301,
	q40302 = 40302,
	q40303 = 40303,
	q40304 = 40304,
	q40305 = 40305,
	q40306 = 40306,
}
Q403Config.KeyID = 100007
Q403Config.KeyPos = sceneData:GetDummyPoint(3,"Q403Finish").pos
Q403Config.MatchTime = 30

return Q403Config