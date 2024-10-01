require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q378Trigger = class("Q378Trigger", gadgetActorProxy)

Q378Trigger.defaultAlias = "Q378Trigger"

local q378Cfg = require('Quest/Client/Q378ClientConfig')

-- local questActorProxy = require('Actor/Quest/QuestActorProxy')
-- local Questnew = class("Questnew", questActorProxy)
-- Questnew.defaultAlias = "Questnew"
-- local Quest378 = require('Quest/MQ378')

function Q378Trigger:OnPostDataPrepare()
end

function Q378Trigger:OnPostComponentPrepare()
	self:AddComponentTrigger(8, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q378Trigger:TriggerIn()
    print("Out Q378Trigger")
	local quest = actorMgr:GetActor(q378Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
    end
    self:DestroySelf()
end

function Q378Trigger:TriggerOut()
	--print("Exit " .. tostring(outCnt))
    --self:DestroySelf()
end

return Q378Trigger