require('Actor/ActorCommon')
local quest410 = require('Actor/Quest/SQ410')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Qiuqiu = class("Qiuqiu", npcActorProxy)

Qiuqiu.defaultAlias = "Qiuqiu"

-- local config begin
local q410Cfg = require('Actor/Quest/Q410/Q410Config')
local QiuqiuData = q410Cfg.QiuqiuData

function Qiuqiu:PreGetAlias()
	local Qiuqiu = QiuqiuData.Qiuqiu
	return Qiuqiu
end
-- local config end

-- local param begin
-- local param end

-- local method

-- local method end

function Qiuqiu:Start()
	print("start!Qiuqiu")	
end

function Qiuqiu:OnDestroy()
	print("Qiuqiu " .. QiuqiuData.QiuqiuID .. " destroied")
end

return Qiuqiu