require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local WalkArea = class("WalkArea", gadgetActorProxy)

WalkArea.defaultAlias = "WalkArea"

WalkArea.shapeData = 
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

function WalkArea:OnPostDataPrepare()

end

function WalkArea:OnPostComponentPrepare()
	self:AddCommonTrigger(self.shapeData, self.TriggerIn, self.TriggerOut, self.TriggerTick)
end

function WalkArea:TriggerIn(configID, alias)
	self:TryShowMoveToggle(true)
end

function WalkArea:TriggerOut(configID, alias)
	self:TryShowMoveToggle(false)
end

function WalkArea:TriggerTick(configID, alias)

end

return WalkArea