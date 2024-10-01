local baseClass = require('UAuto/TestCases/Quest/QuestBase')
local UAutoLuaTestCase = class("QuestBase_351",baseClass)
local self = UAutoLuaTestCase


local cameraData = TestCaseBaseClass.CameraData()
local clickPos = CS.UnityEngine.Vector2( 0, 0 )
local endPos = CS.UnityEngine.Vector3( 0, 0, 0 )
local initPos = CS.UnityEngine.Vector3( 2679 , 194.4493 , -5761.996 )
local initForward = CS.UnityEngine.Vector3( -0.7993239 , 1 , 0.6009004 )
function self.Step_35100()
	yield_return(self:WaitCheckQuestState(35100,QuestState.QUEST_STATE_UNFINISHED,QState.ACCEPTED))
	yield_return(self.base:RunGM("Quest Finish 35100"))
	yield_return(self:WaitCutScene(true))
	yield_return(self:WaitCheckQuestState(35100,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_35101()

	yield_return(self.base:RunGM("Quest Finish 35101"))
	yield_return(self:WaitCheckQuestState(35101,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_35103()
	yield_return(self.base:RunGM("Quest Finish 35103"))
	yield_return(self:WaitCheckQuestState(35103,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

function self.Step_35102()
	yield_return(self.base:RunGM("Quest Finish 35102"))
	yield_return(self:WaitCheckQuestState(35102,QuestState.QUEST_STATE_FINISHED,QState.UPDATED))
end

return self