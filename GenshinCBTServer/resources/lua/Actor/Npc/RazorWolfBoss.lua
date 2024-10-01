require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local RazorWolfBoss = class("RazorWolfBoss", npcActorProxy)

RazorWolfBoss.defaultAlias = "RazorWolfBoss"

-- local config begin
local q451Cfg = require('Quest/Client/Q451ClientConfig')
local q452Cfg = require('Quest/Client/Q452ClientConfig')
local q453Cfg = require('Quest/Client/Q453ClientConfig')
local q454Cfg = require('Quest/Client/Q454ClientConfig')
-- local config end

function RazorWolfBoss:Start()
	print("start!RazorWolfBoss")
	
end

function RazorWolfBoss:OnDestroy()
	print("RazorWolfBoss " .. self.configID .. " destroied")
end

return RazorWolfBoss