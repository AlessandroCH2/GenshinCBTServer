require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q371Trigger = class("Q371Trigger", gadgetActorProxy)

Q371Trigger.defaultAlias = "Q371Trigger"


local q371Cfg = require('Quest/Client/Q371ClientConfig')


function Q371Trigger:OnPostDataPrepare()
end

function Q371Trigger:OnPostComponentPrepare()
	self:AddComponentTrigger(8, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q371Trigger:TriggerIn()
	local quest = actorMgr:GetActor(q371Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
	end
	self:DestroySelf()
end

function Q371Trigger:TriggerOut()
end

return Q371Trigger