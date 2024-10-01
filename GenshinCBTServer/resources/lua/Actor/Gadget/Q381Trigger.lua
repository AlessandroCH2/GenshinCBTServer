require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q381Trigger = class("Q381Trigger", gadgetActorProxy)

Q381Trigger.defaultAlias = "Q381Trigger"

local q381Cfg = require('Quest/Client/Q381ClientConfig')

function Q381Trigger:OnPostDataPrepare()
end

function Q381Trigger:OnPostComponentPrepare()
	self:AddComponentTrigger(5, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q381Trigger:TriggerIn()
    print("Out Q381Trigger")
	local quest = actorMgr:GetActor(q381Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
    end
    self:DestroySelf()
end

function Q381Trigger:TriggerOut()
	--print("Exit " .. tostring(outCnt))
    --self:DestroySelf()
end

return Q381Trigger