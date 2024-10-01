require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest416 = class("Quest416", questActorProxy)

Quest416.defaultAlias = "Quest416"

local q416Cfg = require('Quest/Client/Q416ClientConfig')
local subIDs = q416Cfg.SubIDs

-- Generated
function Quest416:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
	self.subStartHandlers["41601"] = self.OnSubStart41601
	self.subStartHandlers["41602"] = self.OnSubStart41602
end

function Quest416:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
	self.subFinishHandlers["41601"] = self.OnSubFinish41601
	self.subFinishHandlers["41602"] = self.OnSubFinish41602
end

--@region sub start handlers
function Quest416:OnSubStart41601(quest)
    local currentCoin = actorMgr:GetActor("RunCoinStart")
    if currentCoin ~= nil then
        currentCoin:DestroySelf()
    end
    for i=1, q416Cfg.CoinNum do
        globalActor:UnSpawn("BigApple" .. tostring(i))
    end
    q416Cfg.NextNum = 1
    actorMgr:CreateActorWithPos("RunCoinStart", "Actor/Gadget/RunCoinStart", 70210101, 0, q416Cfg.CoinPos[q416Cfg.NextNum].pos, q416Cfg.CoinPos[q416Cfg.NextNum].rot, true, false)
end

function Quest416:OnSubStart41602(quest)   
end

--@endregion

--@region sub finish handlers

function Quest416:OnSubFinish41601(quest)
	
end

function Quest416:OnSubFinish41602(quest)
    
end

--@endregion

function Quest416:Start()
end

function Quest416:OnDestroy()
end

return Quest416