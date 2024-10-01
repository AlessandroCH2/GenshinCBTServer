require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest467 = class("Quest467", questActorProxy)

Quest467.defaultAlias = "Quest467"

local q467Cfg = require('Quest/Client/Q467ClientConfig')
local LynnData = q467Cfg.LynnData
local guardData = q467Cfg.GuardData

-- Generated
function Quest467:OnSubStartHandlerBuild()
	self.subStartHandlers = {}
	self.subStartHandlers["46701"] = self.OnSubStart46701
	self.subStartHandlers["46702"] = self.OnSubStart46702
	self.subStartHandlers["46703"] = self.OnSubStart46703
end

function Quest467:OnSubFinishHandlerBuild()
	self.subFinishHandlers = {}
	self.subFinishHandlers["46701"] = self.OnSubFinish46701
	self.subFinishHandlers["46702"] = self.OnSubFinish46702
	self.subFinishHandlers["46703"] = self.OnSubFinish46703
end

---sub start & finish 内调用的函数
function Quest467:PaimonVanish()
end

--@region sub start & finish handlers
---按流程触发顺序
function Quest467:OnSubStart46701(quest)
    print("46701 Start : Creat Lynn")
    --actorMgr:CreateActorWithPos(LynnData.Lynn, LynnData.LynnScript, LynnData.LynnID, 0, LynnData.Pos1, LynnData.Dir1, true, false, 3)
    --actorMgr:CreateActorWithPos(guardData.Guard, guardData.GuardScript, guardData.GuardID, 0, guardData.Pos1, guardData.Dir1, true, false, 3)    
end

function Quest467:OnSubFinish46701(quest)
    print("46701 Start : Creat Lynn")
	self:NarratorOnlyTask(self.clientData.NarratorData.Story1)
	self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q467Lynn1").pos, 1.5, 1.5, true)
	globalActor:StopLocalAvatar()	
	globalActor:EnablePlayerInput(false)	
	self:CallDelay(1.5, self.OnEnableInput)
end
function Quest467:OnEnableInput()
	print("467 Finish: Enable Player Input")	
	globalActor:EnablePlayerInput(true)
end

--@endregion

function Quest467:Start()
end

function Quest467:OnDestroy()
end

return Quest467