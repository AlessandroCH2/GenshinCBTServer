require('Actor/ActorCommon')
local quest411 = require('Actor/Quest/SQ411')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Merchant = class("Merchant", npcActorProxy)

Merchant.defaultAlias = "Merchant"

-- local config begin
local q411Cfg = require('Actor/Quest/Q411/Q411Config')
local MerchantData = q411Cfg.MerchantData

function Merchant:PreGetAlias()
	local Merchant = MerchantData.Merchant
	return Merchant
end
-- local config end

-- local param begin
-- local param end

-- local method

-- local method end

function Merchant:Start()
	print("start!Merchant")
	--self:SetPos(MerchantData.bornPos)
	-- self:StartDance()
	-- self:CallDelay(10, self.FinishDance)
end

function Merchant:OnDestroy()
	print("Merchant " .. MerchantData.MerchantID .. " destroied")
end

return Merchant