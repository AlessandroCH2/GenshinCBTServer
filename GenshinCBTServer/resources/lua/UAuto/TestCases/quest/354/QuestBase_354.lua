local baseClass = require('UAuto/TestCases/Quest/QuestBase')
local UAutoLuaTestCase = class("QuestBase_354",baseClass)
local self = UAutoLuaTestCase



function self.Step_35401()
	yield_return(self.base:RunGM("Quest Accept 35401"))
	yield_return(self:WaitCheckQuestState(35201,QuestState.QUEST_STATE_UNFINISHED,QState.ACCEPTED))
	yield_return(self.base:RunGM("Quest Finish 35401"))
	yield_return(self:WaitCheckQuestState(35201,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
	yield_return(self:WaitCutScene(true))
end

function self.Step_35402()
	yield_return(self.base:RunGM("Quest Finish 35402"))
	yield_return(self:WaitCheckQuestState(35202,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_35403()
	yield_return(self.base:RunGM("Quest Finish 35403"))
	yield_return(self:WaitCheckQuestState(35203,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
	yield_return(self.base:ChooseGeneralDialog(false))
end

function self.Step_35404()
	yield_return(self.base:RunGM("Quest Finish 35404"))
	yield_return(self:WaitCheckQuestState(35204,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end


return self