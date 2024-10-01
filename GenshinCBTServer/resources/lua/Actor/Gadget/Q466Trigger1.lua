require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q466Trigger1 = class("Q466Trigger1", gadgetActorProxy)

Q466Trigger1.defaultAlias = "Q466Trigger1"

local q466Cfg = require('Quest/Client/Q466ClientConfig')

function Q466Trigger1:OnPostDataPrepare()
end

function Q466Trigger1:OnPostComponentPrepare()
	self:AddComponentTrigger(60, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q466Trigger1:TriggerIn()
end

function Q466Trigger1:TriggerOut()
	--print("Exit " .. tostring(outCnt))
    --self:DestroySelf()
    print("Out Q466Trigger1")
	local quest = actorMgr:GetActor(q466Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(true, nil)
	end
end

return Q466Trigger1