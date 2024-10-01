require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q354Trigger1 = class("Q354Trigger1", gadgetActorProxy)

Q354Trigger1.defaultAlias = "Q354Trigger1"

local q354Cfg = require('Quest/Client/Q354ClientConfig')

function Q354Trigger1:OnPostDataPrepare()
end

function Q354Trigger1:OnPostComponentPrepare()
	self:AddComponentTrigger(2, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q354Trigger1:TriggerIn()
end

function Q354Trigger1:TriggerOut()
	print("Exit " .. tostring(outCnt))
    print("Out Q354Trigger1")
    local quest = actorMgr:GetActor(q354Cfg.ActorAlias)
	if quest ~= nil then
        quest:FinishQuestID(false, 35405)
	end
	self:DestroySelf()
end

return Q354Trigger1