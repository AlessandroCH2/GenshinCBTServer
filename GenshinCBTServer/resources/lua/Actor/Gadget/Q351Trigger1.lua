require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q351Trigger1 = class("Q351Trigger1", gadgetActorProxy)

Q351Trigger1.defaultAlias = "Q351Trigger1"

local q351Cfg = require('Quest/Client/Q351ClientConfig')

function Q351Trigger1:OnPostDataPrepare()
end

function Q351Trigger1:OnPostComponentPrepare()
	self:AddComponentTrigger(2, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q351Trigger1:TriggerIn()
end

function Q351Trigger1:TriggerOut()
	print("Exit " .. tostring(outCnt))
	print("Out Q351Trigger1")
	local quest = actorMgr:GetActor(q351Cfg.ActorAlias)
	if quest ~= nil then
        quest:FinishQuestID(false, 35100)
	end
	self:DestroySelf()
end

return Q351Trigger1