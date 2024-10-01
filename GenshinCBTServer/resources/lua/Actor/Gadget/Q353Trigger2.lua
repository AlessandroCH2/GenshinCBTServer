require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q353Trigger2 = class("Q353Trigger2", gadgetActorProxy)

Q353Trigger2.defaultAlias = "Q353Trigger2"

local q353Cfg = require('Quest/Client/Q353ClientConfig')

function Q353Trigger2:OnPostDataPrepare()
end

function Q353Trigger2:OnPostComponentPrepare()
	self:AddComponentTrigger(25, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q353Trigger2:TriggerIn()
end

function Q353Trigger2:TriggerOut()
	--print("Exit " .. tostring(outCnt))
    --self:DestroySelf()
    print("Out Q353Trigger2")
    --actorUtils.ShowMessage("正在离开任务区域，请尽快返回")
    --self:DestroySelf()
end

return Q353Trigger2