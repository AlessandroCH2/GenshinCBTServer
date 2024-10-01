require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q395Trigger = class("Q395Trigger", gadgetActorProxy)

Q395Trigger.defaultAlias = "Q395Trigger"

local q395Cfg = require('Quest/Client/Q395ClientConfig')

-- local questActorProxy = require('Actor/Quest/QuestActorProxy')
-- local Questnew = class("Questnew", questActorProxy)
-- Questnew.defaultAlias = "Questnew"
-- local Quest395 = require('Quest/MQ395')

function Q395Trigger:OnPostDataPrepare()
end

function Q395Trigger:OnPostComponentPrepare()
	self:AddComponentTrigger(8, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q395Trigger:TriggerIn()
    print("Out Q395Trigger")
	local quest = actorMgr:GetActor(q395Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
    end
    self:DestroySelf()
end

function Q395Trigger:TriggerOut()
	--print("Exit " .. tostring(outCnt))
    --self:DestroySelf()
end

return Q395Trigger