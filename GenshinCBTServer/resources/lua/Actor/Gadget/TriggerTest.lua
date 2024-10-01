require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local TriggerTest = class("TriggerTest", gadgetActorProxy)

TriggerTest.defaultAlias = "TriggerTest"

TriggerTest.shapeData = 
{
	shapeName = "CircleR5",
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

function TriggerTest:OnPostDataPrepare()

end

function TriggerTest:OnPostComponentPrepare()
	self:AddCommonTrigger(self.shapeData, self.TriggerIn, self.TriggerOut, self.TriggerTick)
end

function TriggerTest:TriggerIn(configID, alias)
	print("TriggerIn")
end

function TriggerTest:TriggerOut(configID, alias)
	print("TriggerOut")
end

function TriggerTest:TriggerTick(configID, alias)
	print("TriggerTick")
end

return TriggerTest