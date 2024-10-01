require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local SneakTreasure = class("SneakTreasure", gadgetActorProxy)

SneakTreasure.defaultAlias = "SneakTreasure"

local inCnt = 0
local outCnt = 0
local q424Cfg = require('Quest/Client/Q424ClientConfig')

function SneakTreasure:OnPostDataPrepare()
	inCnt = 0
	outCnt = 0
end

function SneakTreasure:OnPostComponentPrepare()
	self:AddComponentTrigger(1.5, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function SneakTreasure:TriggerIn()
	-- q424Cfg.Score = q424Cfg.Score + 10
    -- self:CountNumUIUpdate(q424Cfg.Score)
    local quest = actorMgr:GetActor(q424Cfg.ActorAlias)
    if quest ~= nil then
        print("Got A Treasure")
        quest:GetTreasure()
    end
	local effctPos = self:GetPos()
	self:PlayEffect("FlyRace_Marker_Active_AS", effctPos)
	self:DestroySelf()
end

function SneakTreasure:TriggerOut()
	outCnt = outCnt + 1
	--print("Exit " .. tostring(outCnt))
	--self:DestroySelf()
end

return SneakTreasure