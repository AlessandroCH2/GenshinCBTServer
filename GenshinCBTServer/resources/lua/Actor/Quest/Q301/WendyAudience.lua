require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local WendyAudience = class("WendyAudience", npcActorProxy)

WendyAudience.defaultAlias = "WendyAudience"

WendyAudience.seatPos = nil
WendyAudience.seatDir = nil
WendyAudience.bornPos = nil
WendyAudience.bornDir = nil
WendyAudience.returnCallback = nil
WendyAudience.pointID = 1
WendyAudience.currWeather = WeatherType.ClearSky

-- local config begin
local q301Cfg = require('Actor/Quest/Q301/Config/Q301Config')
local q401Cfg = require('Actor/Quest/Q401/Q401Config')
local wendyData = q301Cfg.WendyData
local audienceInter = q301Cfg.AudienceInter
local extrasData = q301Cfg.ExtrasData

function WendyAudience:PreGetAlias()
	local extraAlias = extrasData.Extras .. tostring(self.dataIndex)
	return extraAlias
end

-- local config end

function WendyAudience:MoveToSeat()
	print("move to seat ")
	self:AddPriorityInter(InterTimingType.BTN, audienceInter)
	self:RunToTask(self.seatPos, 
		function(self, task)
			self:TurnTo(M.Euler2DirXZ(self.seatDir))
			self:Standby()
		end,
		function(self, task)
			self:Standby()
		end
	)
end

function WendyAudience:ReturnToNormal()
	--print("ai return " .. tostring(self.configID))
	self:ClearPriorityInter(InterTimingType.BTN)
	self:WalkToTask(extrasData.ExtrasOriginPos[self.extrasIndex],
		function(self, task)
			self:TurnTo(M.Euler2DirXZ(extrasData.ExtrasOriginDir[self.extrasIndex]))
			self:Standby()
			if self.returnCallback ~= nil then
				self:returnCallback()
			end
		end,
		function(self, task)
			self:Standby()
		end
	)
end

-- local method begin
function WendyAudience:OnEvent(evt)
	if evt.evtType == wendyData.EvtFinishDance then
		self:ReturnToNormal()
	end
end

function WendyAudience:IsRaining()
	if self.currWeather == WeatherType.Rain or
	self.currWeather == WeatherType.Storm then
		return true
	end
	return false
end

function WendyAudience:FinishBehave()
	if self.pointID == 1 then
		self.pointID = 2
		self:ClearFollowTask()
		self:WalkToTask(extrasData.ExtrasDaily2Pos[self.extrasIndex],self.Behave,self.Standby)
	elseif self.pointID == 2 then
		self.pointID =3 
		self:ClearFollowTask()
		self:WalkToTask(extrasData.ExtrasDaily3Pos[self.extrasIndex],self.Behave,self.Standby)
	elseif self.pointID == 3 then
		self.pointID = 4
		self:ClearFollowTask()
		self:WalkToTask(extrasData.ExtrasDaily4Pos[self.extrasIndex],self.Behave,self.Standby)
	elseif self.pointID == 4 then
		self.pointID = 1
		self:ClearFollowTask()
		self:WalkToTask(extrasData.ExtrasDaily1Pos[self.extrasIndex],self.Behave,self.Standby)
	end
end

function WendyAudience:Behave()
	if self.pointID == 1 or self.pointID == 3 then
		self:DoFreeStyle(1)
		self:CallDelay(5,self.FinishBehave)
	else
		self:DoFreeStyle(0)
		self:CallDelay(5,self.FinishBehave)
	end
end
	
function WendyAudience:StartDay()
	--print("audience StartDay")
	-- if IsRaining() then
	-- 	return
	-- end
	self.pointID = 1
	self:ClearFollowTask()
	self:WalkToTask(extrasData.ExtrasDaily1Pos[self.extrasIndex],self.Behave,self.Standby)
end

function WendyAudience:StartNight()
	--print("audience StartNight")
	-- if IsRaining() then
	-- 	return
	-- end
	--print("天黑了，回家")
	self:ClearFollowTask()
	self:WalkToTask(extrasData.ExtrasHomePos[self.extrasIndex],self.Standby,self.Standby)
end

function WendyAudience:OnWeather(weatherType)
	--print("OnWeather")
	--本来就在下雨
	if self:IsRaining() then 
		--现在不下了
		if weatherType ~= WeatherType.Rain and
	 	weatherType ~= WeatherType.Storm then
	 		--是白天,就跑出来
	 		if globalActor.isDay then
	 			self.currWeather = weatherType
	 			print("雨停了，是白天，跑出来")
	 			self:StartDay()
	 		end
	 	end
		self.currWeather = weatherType
		return
	end

	self.currWeather = weatherType

	--本来没下雨，现在也不下雨了
	if weatherType ~= WeatherType.Rain and
	 weatherType ~= WeatherType.Storm then
		return
	end

	--本来没下雨，现在下雨了,而且是白天
	if globalActor.isDay then
		--print("下雨了，躲雨")
		self:ClearFollowTask()
		self:WalkToTask(extrasData.ExtrasOriginPos[self.extrasIndex],self.Standby,self.Standby)
	end
end

function WendyAudience:MoveHome()
	--print("任务401，回家")
	self:ClearFollowTask()
	self:WalkToTask(extrasData.ExtrasHomePos[self.extrasIndex],
	function(self,task)
		local quest = actorMgr:GetActor(q401Cfg.ActorAlias)
		if quest ~= nil then
			quest:FinishQuest(false, nil)
		end
	end
	)
end

function WendyAudience:StartDaily()
	--print("audience StartDaily")
	self:RegisterSelfDayTime(self.StartDay)
	self:RegisterSelfNightTime(self.StartNight)
	self:RegisterSelfWeatherChange(self.OnWeather)
	if globalActor.isDay then
		self:StartDay()
	else
		self:StartNight()
	end
end

function WendyAudience:ShowStart()
	print("audience ShowStart")
	self:SetPos(self.bornPos)
	self:RegisterActorEvent(self.OnEvent)
	self:MoveToSeat()
end

-- local method end

function WendyAudience:OnPostDataPrepare()
	self.extrasIndex = self.dataIndex
	self.seatPos = extrasData.ExtrasSeatPos[self.extrasIndex]
	self.seatDir = extrasData.ExtrasSeatDir[self.extrasIndex]
	self.bornPos = extrasData.ExtrasOriginPos[self.extrasIndex]
	self.bornDir = extrasData.ExtrasOriginDir[self.extrasIndex]
	self.returnCallback = extrasData.ExtrasReturnCallback[self.extrasIndex]
end

function WendyAudience:Start()
	--print("start!wendy audience " .. self.configID)
	self:StartDaily()
end

function WendyAudience:OnDestroy()
	--print("wendy audience " .. self.configID .. " destroied")
	-- self:UnregisterSelfNightTime(self.StartDay)
	-- self:UnregisterSelfNightTime(self.StartNight)
	-- self:UnregisterSelfWeatherChange(self.OnWeather)
end

return WendyAudience