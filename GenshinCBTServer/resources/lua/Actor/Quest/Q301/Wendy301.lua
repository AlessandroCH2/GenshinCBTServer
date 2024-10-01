require('Actor/ActorCommon')
local quest301 = require('Actor/Quest/MQ301')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Wendy301 = class("Wendy301", npcActorProxy)

Wendy301.defaultAlias = "Wendy301"

-- local config begin
local q301Cfg = require('Actor/Quest/Q301/Config/Q301Config')
local wendyData = q301Cfg.WendyData
local audienceInter = q301Cfg.AudienceInter
local extrasData = q301Cfg.ExtrasData

function Wendy301:PreGetAlias()
	local wendy = wendyData.Wendy
	return wendy
end
-- local config end

-- local method
function Wendy301:StartDance()
	self:TurnTo(M.Euler2DirXZ(wendyData.bornDir))
	self:DoFreeStyle(1)
end
function Wendy301:FinishDance(...)
	print("finish dance))))))))))))))))))")
	for i=1, #extrasData.ExtrasIDs do
		local alias = extrasData.Extras .. tostring(i)
		self:NotifyTo(alias, wendyData.EvtFinishDance)
	end
	self:Standby()
	local quest = actorMgr:GetActor(q301Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
	end
	--self:Destroy(false)
end

function Wendy301:Vanish()
	print("Wendy Vanish")
	local quest = actorMgr:GetActor(q301Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
	end
	globalActor:UnSpawn(wendyData.Wendy)
	self:Destroy(false)
end

function Wendy301:Escape()
	print("escape begin")
	self:RunToTask(wendyData.vanishPos, nil)
	self:CallDelay(5, self.Vanish)
	for i=1, #extrasData.ExtrasIDs do
		local alias = extrasData.Extras .. tostring(i)
		self:NotifyTo(alias, wendyData.EvtFinishDance)
	end
end
-- local method end

function Wendy301:Start()
	print("start!wendy301")
	--self:SetPos(wendyData.bornPos)
	-- self:StartDance()
	-- self:CallDelay(10, self.FinishDance)
end

function Wendy301:OnDestroy()
	print("wendy " .. wendyData.WendyID .. " destroied")
end

return Wendy301