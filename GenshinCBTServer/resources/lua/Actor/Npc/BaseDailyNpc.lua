require('Actor/ActorCommon')
local NpcActorProxy = require('Actor/Npc/NpcActorProxy')
local BaseDailyNpc = class("BaseDailyNpc", NpcActorProxy)


--@region Handlers
--- 碰撞反馈回调
BaseDailyNpc.OnCollisionEnter = nil
--- 事件回调
BaseDailyNpc.OnEvent = nil
--- 白天回调
BaseDailyNpc.StartDay = nil
function BaseDailyNpc:CallStartDay()
	if self.StartDay ~= nil then
		self:StartDay()
	end
end
--- 黑夜回调
BaseDailyNpc.StartNight = nil
function BaseDailyNpc:CallStartNight()
	if self.StartNight ~= nil then
		self:StartNight()
	end
end
--- 小时回调
BaseDailyNpc.HourBehave = nil

function BaseDailyNpc:RegisterDailyHandler()
	if self.OnCollisionEnter ~= nil then
		self:CallOnCollisionEnter(self.OnCollisionEnter)
	end
	if self.OnEvent ~= nil then
		self:RegisterActorEvent(self.OnEvent)
	end
	if self.StartDay ~= nil then
		self:RegisterSelfDayTime(self.StartDay)
	end
	if self.StartNight ~= nil then
		self:RegisterSelfNightTime(self.StartNight)
	end
	if self.HourBehave ~= nil then
		self:RegisterSelfHour(self.HourBehave)
	end
end
function BaseDailyNpc:UnregisterDailyHandler()
	if self.OnCollisionEnter ~= nil then
		self:ClearOnCollisionEnter(self.OnCollisionEnter)
	end
	-- don't clear event that can be still notified in any mode
	-- if self.OnEvent ~= nil then
	-- 	self:UnregisterActorEvent(self.OnEvent)
	-- end
	if self.StartDay ~= nil then
		self:UnregisterSelfDayTime(self.StartDay)
	end
	if self.StartNight ~= nil then
		self:UnregisterSelfNightTime(self.StartNight)
	end
	if self.HourBehave ~= nil then
		self:UnregisterSelfHour(self.HourBehave)
	end
end
--@endregion

--@region Default Method
function BaseDailyNpc:DoAppear()
	self:ShowSelf()
	self:PerformDither(true, 2)
end
function BaseDailyNpc:DoDisappear()
	self:PerformDither(false, 2, self.HideSelf)
end
--@endregion

--@region Mode
BaseDailyNpc.modeDic = {}
function BaseDailyNpc:RegisterMode(modeType)
	local mode = npcMode:GetMode(modeType)
	if mode ~= nil then
		self.modeDic[modeType] = mode
	end
end
--@endregion

--@region Default Start
function BaseDailyNpc:Start()
	self:StartDaily()
end

function BaseDailyNpc:StartDaily()
	self:RegisterDailyHandler()
	if globalActor.isDay then
		self:CallStartDay()
	else
		self:CallStartNight()
	end
end

function BaseDailyNpc:ResetDaily()
	self:Stop()
	self:UnregisterDailyHandler()
end

function BaseDailyNpc:SwitchMode(modeType)
	local mode = self.modeDic[modeType]
	local modeFunc = nil
	if mode ~= nil then
		modeFunc = mode[self.alias]
		if modeFunc == nil then
			modeFunc = mode.DefaultAction
		end
	end

	if modeFunc ~= nil then
		self:ResetDaily()
		modeFunc(self)
	end
end
--@endregion

return BaseDailyNpc