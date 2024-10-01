require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local WendyTrackTriggersp2 = class("WendyTrackTriggersp2", gadgetActorProxy)

WendyTrackTriggersp2.defaultAlias = "WendyTrackTriggersp2"

local inCnt = 0
local outCnt = 0
local q371Cfg = require('Quest/Client/Q371ClientConfig')

function WendyTrackTriggersp2:OnPostDataPrepare()
	inCnt = 0
	outCnt = 0
end

function WendyTrackTriggersp2:OnPostComponentPrepare()
	self:AddComponentTrigger(12, DistType.EULER_XZ, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function WendyTrackTriggersp2:TriggerIn()
    print("Exit 37111")
	local quest = actorMgr:GetActor(q371Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuestID(false, 37111)
	end
	self:DestroySelf()
end

function WendyTrackTriggersp2:TriggerOut()
	-- outCnt = outCnt + 1
	--print("Exit " .. tostring(outCnt))
	--self:DestroySelf()
end

return WendyTrackTriggersp2