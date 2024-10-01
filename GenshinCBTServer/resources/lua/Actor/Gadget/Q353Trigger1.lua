require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q353Trigger1 = class("Q353Trigger1", gadgetActorProxy)

Q353Trigger1.defaultAlias = "Q353Trigger1"

local q353Cfg = require('Quest/Client/Q353ClientConfig')

function Q353Trigger1:OnPostDataPrepare()
end

function Q353Trigger1:OnPostComponentPrepare()
	self:AddComponentTrigger(30, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function Q353Trigger1:TriggerIn()
end

function Q353Trigger1:TriggerOut()
	--print("Exit " .. tostring(outCnt))
    --self:DestroySelf()
	print("Out Q353Trigger1")
	-- actorUtils.ShowMessage("已离开任务区域，任务失败")
	self:TransmitPlayer(3, sceneData:GetDummyPoint(3, "Q353SetAvatar").pos, sceneData:GetDummyPoint(3, "Q353SetAvatar").rot)
	-- local quest = actorMgr:GetActor(q353Cfg.ActorAlias)
	-- if quest ~= nil then
    --     quest:FinishQuestID(true, 35312)
	-- end
	--self:DestroySelf()
end

return Q353Trigger1