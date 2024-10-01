require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local WendyTrackTrigger = class("WendyTrackTrigger", gadgetActorProxy)

WendyTrackTrigger.defaultAlias = "WendyTrackTrigger"

local inCnt = 0
local outCnt = 0
local q371Cfg = require('Quest/Client/Q371ClientConfig')

function WendyTrackTrigger:OnPostDataPrepare()
	inCnt = 0
	outCnt = 0
end

function WendyTrackTrigger:OnPostComponentPrepare()
	self:AddComponentTrigger(12, DistType.EULER_XZ, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function WendyTrackTrigger:TriggerIn()
	local quest = actorMgr:GetActor(q371Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
	end
	self:DestroySelf()
end

function WendyTrackTrigger:TriggerOut()
	-- outCnt = outCnt + 1
	--print("Exit " .. tostring(outCnt))
	--self:DestroySelf()
end

return WendyTrackTrigger