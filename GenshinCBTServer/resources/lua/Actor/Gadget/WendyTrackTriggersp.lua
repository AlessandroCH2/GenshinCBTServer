require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local WendyTrackTriggersp = class("WendyTrackTriggersp", gadgetActorProxy)

WendyTrackTriggersp.defaultAlias = "WendyTrackTriggersp"

local inCnt = 0
local outCnt = 0
local q371Cfg = require('Quest/Client/Q371ClientConfig')

function WendyTrackTriggersp:OnPostDataPrepare()
	inCnt = 0
	outCnt = 0
end

function WendyTrackTriggersp:OnPostComponentPrepare()
	self:AddComponentTrigger(12, DistType.EULER_XZ, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function WendyTrackTriggersp:TriggerIn()
    print("Exit 37109")
	local quest = actorMgr:GetActor(q371Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuestID(false, 37109)
	end
	self:DestroySelf()
end

function WendyTrackTriggersp:TriggerOut()
	-- outCnt = outCnt + 1
	--print("Exit " .. tostring(outCnt))
	--self:DestroySelf()
end

return WendyTrackTriggersp