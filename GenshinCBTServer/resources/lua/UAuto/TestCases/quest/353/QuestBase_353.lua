local baseClass = require('UAuto/TestCases/Quest/QuestBase')
local UAutoLuaTestCase = class("QuestBase_353",baseClass)
local self = UAutoLuaTestCase



function self.Step_35301()
	--yield_return(self.base:RunGM("Quest Accept 35201"))
	yield_return(self:WaitCheckQuestState(35201,QuestState.QUEST_STATE_UNFINISHED,QState.ACCEPTED))
	yield_return(self.base:RunGM("Quest Finish 35301"))
	yield_return(self:WaitCheckQuestState(35201,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_35302()
	yield_return(self.base:RunGM("Quest Finish 35302"))
	yield_return(self:WaitCheckQuestState(35202,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_35303()
	yield_return(self.base:RunGM("Quest Finish 35303"))
	yield_return(self:WaitCheckQuestState(35203,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_35304()
	yield_return(self.base:RunGM("Quest Finish 35304"))
	yield_return(self:WaitCheckQuestState(35204,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_35305()
	yield_return(self.base:RunGM("Quest Finish 35305"))
	yield_return(self:WaitCheckQuestState(35205,QuestState.QUEST_STATE_FINISHED,QState.FINISHED))
end

return self