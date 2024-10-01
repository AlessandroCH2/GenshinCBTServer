require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local GoalMarkerAS = class("GoalMarkerAS", gadgetActorProxy)

GoalMarkerAS.defaultAlias = "GoalMarkerAS"

local inCnt = 0
local outCnt = 0

function GoalMarkerAS:OnPostDataPrepare()
	inCnt = 0
	outCnt = 0
end

function GoalMarkerAS:OnPostComponentPrepare()
	self:AddComponentTrigger(2, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function GoalMarkerAS:TriggerIn()
	--inCnt = inCnt + 1
	-- q406Cfg.CoinNum = q406Cfg.CoinNum + 1
	-- self:CountNumUIUpdate(q406Cfg.CoinNum)
	-- self:DestroySelf()
	--print("Enter " .. tostring(inCnt))
end

function GoalMarkerAS:TriggerOut()
	outCnt = outCnt + 1
	--print("Exit " .. tostring(outCnt))
	--self:DestroySelf()
end

return GoalMarkerAS