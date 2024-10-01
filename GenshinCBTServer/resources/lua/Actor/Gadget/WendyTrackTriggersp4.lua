require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local WendyTrackTriggersp4 = class("WendyTrackTriggersp4", gadgetActorProxy)

WendyTrackTriggersp4.defaultAlias = "WendyTrackTriggersp4"

local inCnt = 0
local outCnt = 0
local q371Cfg = require('Quest/Client/Q371ClientConfig')

function WendyTrackTriggersp4:OnPostDataPrepare()
	inCnt = 0
	outCnt = 0
end

function WendyTrackTriggersp4:OnPostComponentPrepare()
	self:AddComponentTrigger(12, DistType.EULER_XZ, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function WendyTrackTriggersp4:TriggerIn()
    print("Exit 37113")
	local quest = actorMgr:GetActor(q371Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuestID(false, 37113)
	end
	self:DestroySelf()
end

function WendyTrackTriggersp4:TriggerOut()
	-- outCnt = outCnt + 1
	--print("Exit " .. tostring(outCnt))
	--self:DestroySelf()
end

return WendyTrackTriggersp4