require('Actor/ActorCommon')
local NpcActorProxy = require('Actor/Npc/NpcActorProxy')
local MengdeSample03 = class("MengdeSample03", NpcActorProxy)

MengdeSample03.defaultAlias = "MengdeSample03"
MengdeSample03.currWeather = WeatherType.ClearSky

function MengdeSample03:Start()
	self:StartDaily()
end

function MengdeSample03:DoAppear()
	self:ShowSelf()
	self:PerformDither(true, 2)
end

function MengdeSample03:DoDisappear()
	self:PerformDither(false, 2, self.HideSelf)
end

function MengdeSample03:StartDaily()
	self:RegisterSelfDayTime(self.StartDay)
	self:RegisterSelfNightTime(self.StartNight)
	self:RegisterActorEvent(self.OnEvent)
	if globalActor.isDay then
		self:StartDay()
	else
		self:StartNight()
	end
end
	
function MengdeSample03:StartDay()
	self:ShowSelf()
	self:PerformDither(true, 2, self.Play)
end

function MengdeSample03:StartNight()
	self:PerformDither(false, 2, self.Home)
end

function MengdeSample03:Play()
	self:ShowSelf()
end

function MengdeSample03:Home()
	self:HideSelf()
end

function MengdeSample03:OnEvent(evt)
	if evt.evtType == 35701 then
		self:ClearAllTask()
		self:UnregisterSelfDayTime(self.StartDay)
		self:UnregisterSelfHour(self.HourBehave)
		self:UnregisterSelfNightTime(self.StartNight)
		self:UnregisterActorEvent(self.OnEvent)
		self:HideSelf()
	elseif evt.evtType == 35702 then
		self:StartDaily()
	end
end

return MengdeSample03