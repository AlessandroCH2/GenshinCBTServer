require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local CoinTest = class("CoinTest", gadgetActorProxy)

CoinTest.defaultAlias = "CoinTest"

local inCnt = 0
local outCnt = 0
local q406Cfg = require('Actor/Quest/Q406/Q406Config')

function CoinTest:OnPostDataPrepare()
	inCnt = 0
	outCnt = 0
end

function CoinTest:OnPostComponentPrepare()
	self:AddComponentTrigger(3, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function CoinTest:TriggerIn()
	q406Cfg.CoinNum = q406Cfg.CoinNum + 1
	self:CountNumUIUpdate(q406Cfg.CoinNum)
	local effctPos = self:GetPos()
	self:PlayEffect("FlyRace_Marker_Active_AS", effctPos)
	self:DestroySelf()
end

function CoinTest:TriggerOut()
	outCnt = outCnt + 1
	--print("Exit " .. tostring(outCnt))
	--self:DestroySelf()
end

return CoinTest