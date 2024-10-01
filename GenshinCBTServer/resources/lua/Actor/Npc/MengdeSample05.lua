require('Actor/ActorCommon')
local NpcActorProxy = require('Actor/Npc/NpcActorProxy')
local MengdeSample05 = class("MengdeSample05", NpcActorProxy)

MengdeSample05.defaultAlias = "MengdeSample05"
MengdeSample05.currWeather = WeatherType.ClearSky

function MengdeSample05:Start()
	self:HideSelf()
	self:SitOnChair()
	self:CallDelay(3, self.StartDaily)
end

function MengdeSample05:DoAppear()
	self:ShowSelf()
	self:PerformDither(true, 2)
end

function MengdeSample05:DoDisappear()
	self:PerformDither(false, 2, self.HideSelf)
end

function MengdeSample05:StartDaily()
	self:RegisterSelfDayTime(self.StartDay)
	self:RegisterSelfNightTime(self.StartNight)
	self:RegisterActorEvent(self.OnEvent)
	if globalActor.isDay then
		self:StartDay()
	else
		self:StartNight()
	end
end

function MengdeSample05:StartNight()
	self:ShowSelf()
	self:PerformDither(true, 2, self.Play)

end

function MengdeSample05:StartDay()
	self:PerformDither(false, 2, self.Home)
end

function MengdeSample05:Play()
end

function MengdeSample05:Home()
	self:HideSelf()
end

function MengdeSample05:OnEvent(evt)
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

return MengdeSample05