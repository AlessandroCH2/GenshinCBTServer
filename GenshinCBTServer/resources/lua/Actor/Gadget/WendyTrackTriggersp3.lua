require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local WendyTrackTriggersp3 = class("WendyTrackTriggersp3", gadgetActorProxy)

WendyTrackTriggersp3.defaultAlias = "WendyTrackTriggersp3"

local inCnt = 0
local outCnt = 0
local q371Cfg = require('Quest/Client/Q371ClientConfig')

function WendyTrackTriggersp3:OnPostDataPrepare()
	inCnt = 0
	outCnt = 0
end

function WendyTrackTriggersp3:OnPostComponentPrepare()
	self:AddComponentTrigger(12, DistType.EULER_XZ, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function WendyTrackTriggersp3:TriggerIn()
    print("Exit 37112")
	local quest = actorMgr:GetActor(q371Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuestID(false, 37112)
	end
	self:DestroySelf()
end

function WendyTrackTriggersp3:TriggerOut()
	-- outCnt = outCnt + 1
	--print("Exit " .. tostring(outCnt))
	--self:DestroySelf()
end

return WendyTrackTriggersp3