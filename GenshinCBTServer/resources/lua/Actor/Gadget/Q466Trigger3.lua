require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q466trigger3 = class("Q466trigger3", gadgetActorProxy)

Q466trigger3.defaultAlias = "Q466trigger3"

local q466Cfg = require('Quest/Client/Q466ClientConfig')

function Q466trigger3:OnPostDataPrepare()
end

function Q466trigger3:OnPostComponentPrepare()
	self:AddComponentTrigger(50, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q466trigger3:TriggerIn()
end

function Q466trigger3:TriggerOut()
	--print("Exit " .. tostring(outCnt))
    --self:DestroySelf()
    print("Out Q466trigger3")
    self:NarratorOnlyTask(q466Cfg.NarratorData.Story6)
--[[ 	local quest = actorMgr:GetActor(q466Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(true, nil)
	end ]]
end

return Q466trigger3