local baseClass = require('UAuto/TestCases/Quest/QuestBase')
local UAutoLuaTestCase = class("QuestBase_405",baseClass)
local self = UAutoLuaTestCase


function self.Step_40501()
	yield_return(self.base:RunGM("Quest Accept 40501"))
	yield_return(self:WaitCheckQuestState(40501,QuestState.QUEST_STATE_UNFINISHED,QState.ACCEPTED))
	--yield_return(self:CheckQuestPromtOnMiniMap())
	yield_return(self.base:RunGM("Quest Finish 40501"))
	yield_return(self:WaitCheckQuestState(40501,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
	--yield_return(self:CheckQuestPromtOnMiniMap())
end

function self.Step_40502()
	yield_return(self.base:RunGM("Quest Finish 40502"))
	yield_return(self:WaitCheckQuestState(40502,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
	--yield_return(self:CheckQuestPromtOnMiniMap())
end

function self.Step_40503()
	yield_return(self.base:RunGM("Quest Finish 40503"))
	yield_return(self:WaitCheckQuestState(40503,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
	--yield_return(self:CheckQuestPromtOnMiniMap())
end

function self.Step_40504()
	yield_return(self.base:RunGM("Quest Finish 40504"))
	yield_return(self:WaitCheckQuestState(40504,QuestState.QUEST_STATE_FINISHED,QState.FINISHED))
	--yield_return(self:CheckQuestPromtOnMiniMap(false))
end

return self