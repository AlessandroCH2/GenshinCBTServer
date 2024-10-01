require('Actor/ActorCommon')
local NpcActorProxy = require('Actor/Npc/NpcActorProxy')
local MengdeSample01 = class("MengdeSample01", NpcActorProxy)

MengdeSample01.defaultAlias = "MengdeSample01"
MengdeSample01.currWeather = WeatherType.ClearSky

function MengdeSample01:Start()
	self:StartDaily()
end

function MengdeSample01:DoAppear()
	self:ShowSelf()
	self:PerformDither(true, 2)
end

function MengdeSample01:DoDisappear()
	self:PerformDither(false, 2, self.HideSelf)
end

function MengdeSample01:StartDaily()
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
	
function MengdeSample01:StartNight()
	self:ShowSelf()
	self:PerformDither(true, 2, self.Play)
end

function MengdeSample01:ShowBubble()
	self:TriggerNpcSpeechBubble(915, 4016412)
	self:BubbleTime()
end

function MengdeSample01:BubbleTime()
	self:CallDelay(5, self.CloseBubble)
end

function MengdeSample01:CloseBubble()
	self:ClearNpcSpeechBubble(915)
	self:BubbleGap()
end

function MengdeSample01:BubbleGap()
	self:CallDelay(5, self.ShowBubble)
end

function MengdeSample01:StartDay()
	self:PerformDither(false, 2, self.Home)
end

function MengdeSample01:Play()
	self:ShowSelf()
end

function MengdeSample01:Home()
	self:HideSelf()
end

function MengdeSample01:OnEvent(evt)
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

return MengdeSample01