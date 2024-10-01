require('Actor/ActorCommon')
local NpcActorProxy = require('Actor/Npc/NpcActorProxy')
local MengdeSample02 = class("MengdeSample02", NpcActorProxy)

MengdeSample02.defaultAlias = "MengdeSample02"
MengdeSample02.currWeather = WeatherType.ClearSky

function MengdeSample02:Start()
	self:StartDaily()
end

function MengdeSample02:DoAppear()
	self:ShowSelf()
	self:PerformDither(true, 2)
end

function MengdeSample02:DoDisappear()
	self:PerformDither(false, 2, self.HideSelf)
end

function MengdeSample02:StartDaily()
	self:RegisterSelfDayTime(self.StartDay)
	self:RegisterSelfNightTime(self.StartNight)
	self:RegisterActorEvent(self.OnEvent)
	if globalActor.isDay then
		self:StartDay()
	else
		self:StartNight()
	end
end
	
function MengdeSample02:StartDay()
	self:ShowSelf()
	self:PerformDither(true, 2, self.Play)
end

function MengdeSample02:ShowBubble()
	self:TriggerNpcSpeechBubble(916, 4016510)
	self:BubbleTime()
end

function MengdeSample02:BubbleTime()
	self:CallDelay(5, self.CloseBubble)
end

function MengdeSample02:CloseBubble()
	self:ClearNpcSpeechBubble(916)
	self:NotifyTo("MengdeSample04", 4016509)
end

function MengdeSample02:StartNight()
	self:PerformDither(false, 2, self.Home)
end

function MengdeSample02:Play()
	self:ShowSelf()
end

function MengdeSample02:Home()
	self:HideSelf()
end

function MengdeSample02:OnEvent(evt)
	if evt.evtType == 35701 then
		self:ClearAllTask()
		self:UnregisterSelfDayTime(self.StartDay)
		self:UnregisterSelfHour(self.HourBehave)
		self:UnregisterSelfNightTime(self.StartNight)
		self:UnregisterActorEvent(self.OnEvent)
		self:HideSelf()
	elseif evt.evtType == 35702 then
		self:StartDaily()
	elseif evt.evtType == 4016510 then
		self:ShowBubble()
	end
end

return MengdeSample02