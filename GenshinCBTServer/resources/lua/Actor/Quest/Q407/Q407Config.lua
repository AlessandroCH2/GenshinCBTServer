require('Actor/ActorCommon')

local Q407Config = {}

Q407Config.MainID = 407
Q407Config.ActorAlias = "407"

Q407Config.SubIDs = 
{
	q40701 = 40701,
	q40702 = 40702,
	q40703 = 40703,
	q40704 = 40704,
	q40705 = 40705,
	q40706 = 40706,
}
Q407Config.GotCricket = false
Q407Config.GameRunning = false
Q407Config.CricketItemID = {100120, 100121, 100122, 100123, 100124}
Q407Config.SoundGadgetID = {70300021, 70300022, 70300023, 70300024}
Q407Config.HoleNum = 15
Q407Config.CricketNum = 4
Q407Config.HolePos =
{
	sceneData:GetDummyPoint(3,"Q407HolePos1").pos,
	sceneData:GetDummyPoint(3,"Q407HolePos2").pos,
	sceneData:GetDummyPoint(3,"Q407HolePos3").pos,
	sceneData:GetDummyPoint(3,"Q407HolePos4").pos,
	sceneData:GetDummyPoint(3,"Q407HolePos5").pos,
	sceneData:GetDummyPoint(3,"Q407HolePos6").pos,
	sceneData:GetDummyPoint(3,"Q407HolePos7").pos,
	sceneData:GetDummyPoint(3,"Q407HolePos8").pos,
	sceneData:GetDummyPoint(3,"Q407HolePos9").pos,
	sceneData:GetDummyPoint(3,"Q407HolePos10").pos,
	sceneData:GetDummyPoint(3,"Q407HolePos11").pos,
	sceneData:GetDummyPoint(3,"Q407HolePos12").pos,
	sceneData:GetDummyPoint(3,"Q407HolePos13").pos,
	sceneData:GetDummyPoint(3,"Q407HolePos14").pos,
	sceneData:GetDummyPoint(3,"Q407HolePos15").pos,		
}
Q407Config.MatchTime = 30
Q407Config.JudgeData = 
{
	Judge = "CricketJudge",
	JudgeScript = "Actor/Quest/Q407/CricketJudge",
	JudgeID = 1105,

	JudgePos = sceneData:GetDummyPoint(3,"Q407Judge").pos,
	JudgeDir = sceneData:GetDummyPoint(3,"Q407Judge").rot,	
}

return Q407Config