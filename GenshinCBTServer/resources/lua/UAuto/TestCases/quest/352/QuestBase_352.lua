local baseClass = require('UAuto/TestCases/Quest/QuestBase')
local UAutoLuaTestCase = class("QuestBase_352",baseClass)
local self = UAutoLuaTestCase



function self.Step_35201()
	--yield_return(self.base:RunGM("Quest Accept 35201"))
	yield_return(self:WaitCheckQuestState(35201,QuestState.QUEST_STATE_UNFINISHED,QState.ACCEPTED))
	yield_return(self.base:RunGM("Quest Finish 35201"))
	yield_return(self:WaitCheckQuestState(35201,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
	yield_return(self:WaitCutScene(true))
end

function self.Step_35202()
	yield_return(self.base:RunGM("Quest Finish 35202"))
	yield_return(self:WaitCheckQuestState(35202,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_35203()
	yield_return(self.base:RunGM("Quest Finish 35203"))
	yield_return(self:WaitCheckQuestState(35203,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
	yield_return(self:WaitCutScene(true))
end

function self.Step_35204()
	yield_return(self.base:RunGM("Quest Finish 35204"))
	yield_return(self:WaitCheckQuestState(35204,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_35205()
	yield_return(self.base:RunGM("Quest Finish 35205"))
	yield_return(self:WaitCheckQuestState(35205,QuestState.QUEST_STATE_FINISHED,QState.FINISHED))
end

return self