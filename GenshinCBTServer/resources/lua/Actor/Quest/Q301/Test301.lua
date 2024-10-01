require('Actor/ActorCommon')
local quest301 = require('Actor/Quest/MQ301')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Test301 = class("Test301", npcActorProxy)

Test301.defaultAlias = "Test301"

-- local config begin
local q301Cfg = require('Actor/Quest/Q301/Config/Q301Config')
local testData = q301Cfg.TestData
-- local config end

-- local param begin
-- local param end

-- local method

-- local method end

function Test301:Start()
	print("start!Test301")
	self:SetPos(testData.bornPos)
	print(testData.bornPos)
	self:TurnTo(M.Euler2DirXZ(self.bornDir))
	self:Standby()
end

function Test301:OnDestroy()
	print("test " .. self.configID .. " destroied")
end

return Test301