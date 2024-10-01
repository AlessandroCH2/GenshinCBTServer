require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest468 = class("Quest468", questActorProxy)

Quest468.defaultAlias = "Quest468"

local q468Cfg = require('Quest/Client/Q468ClientConfig')
local LynnData = q468Cfg.LynnData
local guardData = q468Cfg.GuardData

-- Generated
function Quest468:OnSubStartHandlerBuild()
	self.subStartHandlers = {}
	self.subStartHandlers["46801"] = self.OnSubStart46801
	self.subStartHandlers["46802"] = self.OnSubStart46802
	self.subStartHandlers["46803"] = self.OnSubStart46803
end

function Quest468:OnSubFinishHandlerBuild()
	self.subFinishHandlers = {}
	self.subFinishHandlers["46801"] = self.OnSubFinish46801
	self.subFinishHandlers["46802"] = self.OnSubFinish46802
	self.subFinishHandlers["46803"] = self.OnSubFinish46803
end

---sub start & finish 内调用的函数
function Quest468:PaimonVanish()
end

--@region sub start & finish handlers
---按流程触发顺序
function Quest468:OnSubStart46801(quest)
    print("46801 Start : Creat Lynn")
    --actorMgr:CreateActorWithPos(LynnData.Lynn, LynnData.LynnScript, LynnData.LynnID, 0, LynnData.Pos1, LynnData.Dir1, true, false, 3)
    --actorMgr:CreateActorWithPos(guardData.Guard, guardData.GuardScript, guardData.GuardID, 0, guardData.Pos1, guardData.Dir1, true, false, 3)    
end

function Quest468:OnSubFinish46801(quest)
    print("46801 Start : Creat Lynn")
	self:NarratorOnlyTask(self.clientData.NarratorData.Story1)
	self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q468Lynn1").pos, 1.5, 3, true)
	globalActor:StopLocalAvatar()	
	globalActor:EnablePlayerInput(false)	
	self:CallDelay(3, self.OnEnableInput)
end
function Quest468:OnEnableInput()
	print("468 Finish: Enable Player Input")	
	globalActor:EnablePlayerInput(true)
end

--@endregion

function Quest468:Start()
end

function Quest468:OnDestroy()
end

return Quest468