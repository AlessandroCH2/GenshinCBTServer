require('Actor/ActorCommon')
local quest304 = require('Actor/Quest/MQ304')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Dragon = class("Dragon", npcActorProxy)

Dragon.defaultAlias = "Dragon"
Dragon.pointID = 1

-- local config begin
local q304Cfg = require('Actor/Quest/Q304/Q304Config')
local q361Cfg = require('Quest/Client/Q361ClientConfig')
local DragonData = q304Cfg.DragonData

function Dragon:PreGetAlias()
	local Dragon = DragonData.Dragon
	return Dragon
end
-- local config end

-- local param begin
-- local param end

-- local method
function Dragon:FlyCircle()
	if self.pointID == DragonData.CircleNum then
		self.pointID = 1
	else
		self.pointID = self.pointID + 1
	end
	print("DragonPos"..tostring(self.pointID))
	self:ClearFollowTask()
	self:SwitchAirMode(true)
	self:WalkToTask(DragonData.DragonPos[self.pointID], self.Standby, self.Standby)
	self:CallDelay(5, self.FlyCircle)
end

function Dragon:FlyCircle2()
	if self.pointID == DragonData.CircleNum then
		self.pointID = 1
	else
		self.pointID = self.pointID + 1
	end
	print("DragonPos"..tostring(self.pointID))
	self:ClearFollowTask()
	self:SwitchAirMode(true)
	self:WalkToTask(DragonData.DragonPos[self.pointID], self.FlyCircle, self.Standby)
end

-- local method end

function Dragon:Start()
	print("start!Dragon")	
end

function Dragon:OnDestroy()
	print("Dragon " .. DragonData.DragonID .. " destroied")
end

return Dragon