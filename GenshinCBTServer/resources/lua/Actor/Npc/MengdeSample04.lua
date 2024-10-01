require('Actor/ActorCommon')
local NpcActorProxy = require('Actor/Npc/NpcActorProxy')
local MengdeSample04 = class("MengdeSample04", NpcActorProxy)

MengdeSample04.defaultAlias = "MengdeSample04"
MengdeSample04.currWeather = WeatherType.ClearSky

function MengdeSample04:Start()
	self:StartDaily()
	self:RegisterActorEvent(self.OnEvent)
end

function MengdeSample04:DoAppear()
	self:ShowSelf()
	self:PerformDither(true, 2)
end

function MengdeSample04:DoDisappear()
	self:PerformDither(false, 2, self.HideSelf)
end

function MengdeSample04:StartDaily()
	self:RegisterSelfDayTime(self.StartDay)
	self:RegisterSelfNightTime(self.StartNight)
	self:RegisterActorEvent(self.OnEvent)
	if globalActor.isDay then
		self:StartDay()
	else
		self:StartNight()
	end
	self:ShowBubble()
end
	
function MengdeSample04:StartDay()
	self:ShowSelf()
	self:PerformDither(true, 2, self.Play)
end

function MengdeSample04:ShowBubble()
	self:TriggerNpcSpeechBubble(918, 4016509)
	self:BubbleTime()
end

function MengdeSample04:BubbleTime()
	self:CallDelay(5, self.CloseBubble)
end

function MengdeSample04:CloseBubble()
	self:ClearNpcSpeechBubble(918)
	self:NotifyTo("MengdeSample02", 4016510)
end

function MengdeSample04:StartNight()
	self:PerformDither(false, 2, self.Home)
end

function MengdeSample04:Play()
	self:ShowSelf()
end

function MengdeSample04:Home()
	self:HideSelf()
end

function MengdeSample04:OnEvent(evt)
	if evt.evtType == 35701 then
		self:ClearAllTask()
		self:UnregisterSelfDayTime(self.StartDay)
		self:UnregisterSelfHour(self.HourBehave)
		self:UnregisterSelfNightTime(self.StartNight)
		self:UnregisterActorEvent(self.OnEvent)
		self:HideSelf()
	elseif evt.evtType == 35702 then
		self:StartDaily()
	elseif evt.evtType == 4016509 then
		self:ShowBubble()
	end
end

return MengdeSample04