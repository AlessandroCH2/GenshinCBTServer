require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q466Trigger2 = class("Q466Trigger2", gadgetActorProxy)

Q466Trigger2.defaultAlias = "Q466Trigger2"

local q466Cfg = require('Quest/Client/Q466ClientConfig')

function Q466Trigger2:OnPostDataPrepare()
end

function Q466Trigger2:OnPostComponentPrepare()
	self:AddComponentTrigger(65, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q466Trigger2:TriggerIn()
end

function Q466Trigger2:TriggerOut()
	--print("Exit " .. tostring(outCnt))
    --self:DestroySelf()
    print("Out Q466Trigger2")
	local quest = actorMgr:GetActor(q466Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(true, nil)
	end
end

return Q466Trigger2