require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q384TriggerSP = class("Q384TriggerSP", gadgetActorProxy)

Q384TriggerSP.defaultAlias = "Q384TriggerSP"

local q384Cfg = require('Quest/Client/Q384ClientConfig')

-- local questActorProxy = require('Actor/Quest/QuestActorProxy')
-- local Questnew = class("Questnew", questActorProxy)
-- Questnew.defaultAlias = "Questnew"
-- local Quest384 = require('Quest/MQ384')

function Q384TriggerSP:OnPostDataPrepare()
end

function Q384TriggerSP:OnPostComponentPrepare()
	self:AddComponentTrigger(6, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q384TriggerSP:TriggerIn()
    print("Out Q384TriggerSP")
	local quest = actorMgr:GetActor(q384Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
    end
    self:DestroySelf()
end

function Q384TriggerSP:TriggerOut()
	--print("Exit " .. tostring(outCnt))
    --self:DestroySelf()
end

return Q384TriggerSP