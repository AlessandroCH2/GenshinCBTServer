require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q377Trigger = class("Q377Trigger", gadgetActorProxy)

Q377Trigger.defaultAlias = "Q377Trigger"

local q377Cfg = require('Quest/Client/Q377ClientConfig')

-- local questActorProxy = require('Actor/Quest/QuestActorProxy')
-- local Questnew = class("Questnew", questActorProxy)
-- Questnew.defaultAlias = "Questnew"
-- local Quest377 = require('Quest/MQ377')

function Q377Trigger:OnPostDataPrepare()
end

function Q377Trigger:OnPostComponentPrepare()
	self:AddComponentTrigger(5, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q377Trigger:TriggerIn()
    print("Out Q377Trigger")
	local quest = actorMgr:GetActor(q377Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
    end
    self:DestroySelf()
end

function Q377Trigger:TriggerOut()
	--print("Exit " .. tostring(outCnt))
    --self:DestroySelf()
end

return Q377Trigger