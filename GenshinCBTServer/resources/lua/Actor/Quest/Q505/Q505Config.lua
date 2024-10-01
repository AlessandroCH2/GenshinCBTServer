require('Actor/ActorCommon')

local Q505Config = {}

Q505Config.MainID = 505
Q505Config.ActorAlias = "505"

Q505Config.SubIDs =
{
	q50501 = 50501,
}

Q505Config.SealID = 100149

Q505Config.SealPos = sceneData:GetDummyPoint(3,"Q504SealPos").pos
Q505Config.SealRot = sceneData:GetDummyPoint(3,"Q504SealPos").rot


return Q505Config
