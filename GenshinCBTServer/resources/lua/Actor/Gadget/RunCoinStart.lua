require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local RunCoinStart = class("RunCoinStart", gadgetActorProxy)

RunCoinStart.defaultAlias = "RunCoinStart"

local q416Cfg = require('Quest/Client/Q416ClientConfig')

local function EndGame()
    globalActor:CountNumUITerminate()
    local currentCoin = actorMgr:GetActor("RunCoinStart")
    if currentCoin ~= nil then
        currentCoin:DestroySelf()
    end
    local quest = actorMgr:GetActor(q416Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
    end
    q416Cfg.NextNum = 1
end

local function CreateNext()
    if q416Cfg.NextNum < q416Cfg.CoinNum +1 then
        actorMgr:CreateActorWithPos("RunCoinStart", "Actor/Gadget/RunCoinStart", 70300004, 0, q416Cfg.CoinPos[q416Cfg.NextNum].pos, q416Cfg.CoinPos[q416Cfg.NextNum].rot, true, false)
        local currentCoin = actorMgr:GetActor("RunCoinStart")
        if currentCoin ~= nil then
            currentCoin:CallDelay(3, EndGame)
        end
    else
        -- local quest = actorMgr:GetActor(q416Cfg.ActorAlias)
        -- if quest ~= nil then
        --     quest:FinishQuest(false, nil)
        -- end
        for i=1, q416Cfg.CoinNum do
            globalActor:SpawnItem(104011, q416Cfg.CoinPos[i].pos, nil, "BigApple" .. tostring(i))
        end
        
    end
end

function RunCoinStart:OnPostDataPrepare()
end

function RunCoinStart:OnPostComponentPrepare()
	self:AddComponentTrigger(1, DistType.EULER, M.Pos(0, 0, 0), self.TriggerIn, self.TriggerOut)
end

function RunCoinStart:TriggerIn()
	-- local quest = actorMgr:GetActor(q416Cfg.ActorAlias)
	-- if quest ~= nil then
	-- 	quest:FinishQuest(false, nil)
    -- end
    if q416Cfg.NextNum == 1 then
        local quest = actorMgr:GetActor(q416Cfg.ActorAlias)
        if quest ~= nil then
            quest:FinishQuest(false, nil)
        end

        self:CountNumUIStart()
    else
        self:UnCallFunc(EndGame)
    end

    local effctPos = self:GetPos()
    if q416Cfg.NextNum < q416Cfg.CoinNum then
        self:PlayEffect("FlyRace_Marker_Active_AS", effctPos)
    else
        self:PlayEffect("FlyRace_Goal_Marker_AS", effctPos)
        self:CountNumUITerminate()
    end

    self:CountNumUIUpdate(q416Cfg.NextNum)
    q416Cfg.NextNum = q416Cfg.NextNum + 1
    self:DestroySelf()
    CreateNext()
end

function RunCoinStart:TriggerOut()
	-- outCnt = outCnt + 1
	--print("Exit " .. tostring(outCnt))
	--self:DestroySelf()
end

return RunCoinStart