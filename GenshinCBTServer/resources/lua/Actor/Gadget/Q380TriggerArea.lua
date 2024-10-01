require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q380Trigger = class("Q380Trigger", gadgetActorProxy)

Q380Trigger.defaultAlias = "Q380Trigger"

local q380Cfg = require('Quest/Client/Q380ClientConfig')

function Q380Trigger:OnPostDataPrepare()
end

function Q380Trigger:OnPostComponentPrepare()
	self:AddComponentTrigger(70, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q380Trigger:TriggerIn()
    print("Out Q380Trigger")
	local quest = actorMgr:GetActor(q380Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
    end
    self:DestroySelf()
end

function Q380Trigger:TriggerOut()
	--print("Exit " .. tostring(outCnt))
    --self:DestroySelf()
end

return Q380Trigger