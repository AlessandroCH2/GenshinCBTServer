require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local DragonTrigger = class("DragonTrigger", gadgetActorProxy)

DragonTrigger.defaultAlias = "DragonTrigger"

local q361Cfg = require('Quest/Client/Q361ClientConfig')

function DragonTrigger:OnPostDataPrepare()
end

function DragonTrigger:OnPostComponentPrepare()
	self:AddComponentTrigger(57, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function DragonTrigger:TriggerIn()
end

function DragonTrigger:TriggerOut()
	--print("Exit " .. tostring(outCnt))
    --self:DestroySelf()
    print("Out DragonTrigger")
	local quest = actorMgr:GetActor(q361Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
	end
end

return DragonTrigger