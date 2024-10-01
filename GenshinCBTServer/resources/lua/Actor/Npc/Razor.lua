require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Razor = class("Razor", npcActorProxy)

Razor.defaultAlias = "Razor"

-- local config begin
local q451Cfg = require('Quest/Client/Q451ClientConfig')
local q452Cfg = require('Quest/Client/Q452ClientConfig')
local q453Cfg = require('Quest/Client/Q453ClientConfig')
local q454Cfg = require('Quest/Client/Q454ClientConfig')
-- local config end

function Razor:Start()
	print("start!Razor")
	
end

function Razor:OnDestroy()
	print("Razor " .. self.configID .. " destroied")
end

return Razor