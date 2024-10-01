require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Captain = class("Captain", npcActorProxy)

Captain.defaultAlias = "Captain"

-- local config begin
local q413Cfg = require('Actor/Quest/Q413/Q413Config')
local captainData = q413Cfg.CaptainData

function Captain:PreGetAlias()
	local Captain = captainData.Captain
	return Captain
end

-- local config end



-- local method begin

-- local method end

function Captain:OnPostDataPrepare()
end

function Captain:Start()
end

function Captain:OnDestroy()
end

return Captain