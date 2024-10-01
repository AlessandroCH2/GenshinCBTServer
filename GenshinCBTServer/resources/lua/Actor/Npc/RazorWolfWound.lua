require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local RazorWolfWound = class("RazorWolfWound", npcActorProxy)

RazorWolfWound.defaultAlias = "RazorWolfWound"

-- local config begin
local q451Cfg = require('Quest/Client/Q451ClientConfig')
local q452Cfg = require('Quest/Client/Q452ClientConfig')
local q453Cfg = require('Quest/Client/Q453ClientConfig')
local q454Cfg = require('Quest/Client/Q454ClientConfig')
-- local config end

function RazorWolfWound:Start()
	print("start!RazorWolfWound")
	
end

function RazorWolfWound:OnDestroy()
	print("RazorWolfWound " .. self.configID .. " destroied")
end

return RazorWolfWound