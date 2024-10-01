require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local RazorFarmer = class("RazorFarmer", npcActorProxy)

RazorFarmer.defaultAlias = "RazorFarmer"

-- local config begin
local q451Cfg = require('Quest/Client/Q451ClientConfig')
local q452Cfg = require('Quest/Client/Q452ClientConfig')
local q453Cfg = require('Quest/Client/Q453ClientConfig')
local q454Cfg = require('Quest/Client/Q454ClientConfig')
-- local config end

function RazorFarmer:Start()
	print("start!RazorFarmer")
	
end

function RazorFarmer:OnDestroy()
	print("RazorFarmer " .. self.configID .. " destroied")
end

return RazorFarmer