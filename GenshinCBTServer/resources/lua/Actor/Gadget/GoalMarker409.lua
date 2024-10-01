require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local GoalMarker409 = class("GoalMarker409", gadgetActorProxy)

GoalMarker409.defaultAlias = "GoalMarker409"

GoalMarker409.shapeData = 
{
	shapeName = "CircleR2",
	shapePosOffset = {x = 0, y = 0, z = 0},
	shapeEulerOffset = {x = 0, y = 0, z = 0},
	shapeHeight = 0.0,
	campID = campHelper.CAMP_PLAYER,
	targetType = TargetType.AllExceptSelf,
	liftType = TimerLimitType.Infinite,
	liftTime = 0.0,
	triggerType = TimerLimitType.Infinite,
	checkCD = 0.15,
}

local inCnt = 0
local outCnt = 0
local q409Cfg = require('Actor/Quest/Q409/Q409Config')

function GoalMarker409:OnPostDataPrepare()
	inCnt = 0
	outCnt = 0
end

function GoalMarker409:OnPostComponentPrepare()
	self:AddCommonTrigger(self.shapeData, self.TriggerIn, self.TriggerOut, self.TriggerTick)
end

function GoalMarker409:TriggerIn(configID, alias)
	print("**************GoalMarker409:TriggerIn")
	if configID == q409Cfg.BallMonsterID then
		q409Cfg.Score = q409Cfg.Score + 1
		self:CountNumUIUpdate(q409Cfg.Score)
		local effctPos = self:GetPos()
		self:PlayEffect("FlyRace_Goal_Marker_AS", effctPos)
	end
end

function GoalMarker409:TriggerOut(configID, alias)
    print("TriggerOut")
end

function GoalMarker409:TriggerTick(configID, alias)
	print("TriggerTick")
end

return GoalMarker409