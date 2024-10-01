require('Actor/ActorCommon')
local subGlobalActorProxy = require('Actor/SubGlobal/SubGlobalActorProxy')
local WindTestGlobalActor = class("WindTestGlobalActor", subGlobalActorProxy)

WindTestGlobalActor.defaultAlias = "WindTestGlobal"

WindTestGlobalActor.SpeedFieldDir = { x = 2.71, y = -9, z = -26.08 }
WindTestGlobalActor.SpeedFieldPos =
{
	{x=1600.12, y=330, z=-6262.65},
	{x=1602.83, y=324, z=-6288.73},
	{x=1605.54, y=318, z=-6314.81},
	{x=1608.24, y=312, z=-6340.89},
	{x=1610.95, y=306, z=-6366.97},
	{x=1613.66, y=300, z=-6393.05},
	{x=1616.37, y=294, z=-6419.13},
	{x=1619.08, y=288, z=-6445.21},
	{x=1621.79, y=282, z=-6471.29},
	{x=1624.49, y=276, z=-6497.36},
	{x=1627.2, y=270, z=-6523.44},
	{x=1629.91, y=264, z=-6549.52},
	-- {x=1632.62, y=258, z=-6575.6},
	-- {x=1635.33, y=252, z=-6601.68},
	-- {x=1638.04, y=246, z=-6627.76},
	-- {x=1640.74, y=240, z=-6653.84},
	-- {x=1643.45, y=234, z=-6679.92},
	-- {x=1646.16, y=228, z=-6706},					
}



WindTestGlobalActor.StartSpeedField = function()
	-- print("StartSpeedField")
	-- for i=1, #WindTestGlobalActor.SpeedFieldPos do
	-- 	globalActor:SpawnGadget(70690002, WindTestGlobalActor.SpeedFieldPos[i], M.Dir2Euler(WindTestGlobalActor.SpeedFieldDir), "MuskSpeedField" .. tostring(i))
	-- end
end

WindTestGlobalActor.EndSpeedField = function()
	-- print("EndSpeedField")
  --   for i=1, #WindTestGlobalActor.SpeedFieldPos do
	-- 	globalActor:UnSpawn("MuskSpeedField" .. tostring(i))
  --   end
end

WindTestGlobalActor.DoTestHour = function(hour)
	-- print("Do Test test" .. tostring(hour))
	-- if hour == 6 then
	-- 	print("StartSpeedField")
	-- 	for i=1, #WindTestGlobalActor.SpeedFieldPos do
	-- 		globalActor:SpawnGadget(70690002, WindTestGlobalActor.SpeedFieldPos[i], M.Dir2Euler(WindTestGlobalActor.SpeedFieldDir), "MuskSpeedField" .. tostring(i))
	-- 	end
	-- elseif hour == 9 then
	-- 	print("EndSpeedField")
	-- 	for i=1, #WindTestGlobalActor.SpeedFieldPos do
	-- 		globalActor:UnSpawn("MuskSpeedField" .. tostring(i))
	-- 	end
	-- end		
end

function WindTestGlobalActor:Register()
	-- self:RegisterDayCallback(self.StartSpeedField)
	-- self:RegisterNightCallback(self.EndSpeedField)
	self:RegisterHourCallback(self.DoTestHour)
end

function WindTestGlobalActor:Unregister()
	-- self:UnregisterDayCallback(self.StartSpeedField)
	-- self:UnregisterNightCallback(self.EndSpeedField)
	self:UnregisterHourCallback(self.DoTestHour)
end

function WindTestGlobalActor:Start()
end

return WindTestGlobalActor