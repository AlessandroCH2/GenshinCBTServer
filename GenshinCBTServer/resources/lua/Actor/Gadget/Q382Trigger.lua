require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q382Trigger = class("Q382Trigger", gadgetActorProxy)

Q382Trigger.defaultAlias = "Q382Trigger"

local q382Cfg = require('Quest/Client/Q382ClientConfig')

function Q382Trigger:OnPostDataPrepare()
end

function Q382Trigger:OnPostComponentPrepare()
	self:AddComponentTrigger(5, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q382Trigger:TriggerIn()
    print("Out Q382Trigger")
	local quest = actorMgr:GetActor(q382Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
    end
    self:DestroySelf()
end

function Q382Trigger:TriggerOut()
	--print("Exit " .. tostring(outCnt))
    --self:DestroySelf()
end

return Q382Trigger