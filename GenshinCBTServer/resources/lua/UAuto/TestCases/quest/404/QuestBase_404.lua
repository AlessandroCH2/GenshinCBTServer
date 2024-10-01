local baseClass = require('UAuto/TestCases/Quest/QuestBase')
local UAutoLuaTestCase = class("QuestBase_404",baseClass)
local self = UAutoLuaTestCase



function self.Step_40400()
	yield_return(self.base:RunGM("Quest Accept 40400"))
	yield_return(self:WaitCheckQuestState(40400,QuestState.QUEST_STATE_UNFINISHED,QState.ACCEPTED))
	yield_return(self.base:RunGM("Quest Finish 40400"))
	yield_return(self:WaitCheckQuestState(40400,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_40401()
	yield_return(self.base:RunGM("Quest Finish 40401"))
	yield_return(self:WaitCheckQuestState(40401,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_40402()
	yield_return(self.base:RunGM("Quest Finish 40402"))
	yield_return(self:WaitCheckQuestState(40402,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_40403()
	yield_return(self.base:RunGM("Quest Finish 40403"))
	yield_return(self:WaitCheckQuestState(40403,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_40404()
	yield_return(self.base:RunGM("Quest Finish 40404"))
	yield_return(self:WaitCheckQuestState(40404,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_40405()
	yield_return(self.base:RunGM("Quest Finish 40405"))
	yield_return(self:WaitCheckQuestState(40405,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_40406()
	yield_return(self.base:RunGM("Quest Finish 40406"))
	yield_return(self:WaitCheckQuestState(40406,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_40407()
	yield_return(self.base:RunGM("Quest Finish 40407"))
	yield_return(self:WaitCheckQuestState(40407,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_40408()
	yield_return(self.base:RunGM("Quest Finish 40408"))
	yield_return(self:WaitCheckQuestState(40408,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end


function self.Step_40409()
	yield_return(self.base:RunGM("Quest Finish 40409"))
	yield_return(self:WaitCheckQuestState(40409,QuestState.QUEST_STATE_FINISHED,QState.FINISHED))
end

function self.Step_40410()
	yield_return(self.base:RunGM("Quest Finish 40410"))
	yield_return(self:WaitCheckQuestState(40409,QuestState.QUEST_STATE_FINISHED,QState.FINISHED))
end

return self