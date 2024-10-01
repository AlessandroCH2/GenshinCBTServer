require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local Q427FlyCoins2 = class("Q427FlyCoins2", gadgetActorProxy)

Q427FlyCoins2.defaultAlias = "Q427FlyCoins2"

-- local q427Cfg = require('Quest/Client/Q427ClientConfig')

-- local function EndGame()

-- end

local function CreateNext()
    if q427Cfg.NowBatchNum2 <= q427Cfg.BatchNum2 then
        for i=1, #q427Cfg.FlyCoins2[q427Cfg.NowBatchNum2] do
            actorMgr:CreateActorWithPos("Q427FlyCoins2" .. tostring(i), "Actor/Gadget/Q427FlyCoins2", 70300064, 0, q427Cfg.FlyCoins2[q427Cfg.NowBatchNum2][i].pos, q427Cfg.FlyCoins2[q427Cfg.NowBatchNum2][i].rot, true, false)
        end
    -- else
    --     for i=1, #q427Cfg.Flyline2-1 do
    --         local AccDir = { x = q427Cfg.Flyline2[i+1].x-q427Cfg.Flyline2[i].x, y = q427Cfg.Flyline2[i+1].y-q427Cfg.Flyline2[i].y, z = q427Cfg.Flyline2[i+1].z-q427Cfg.Flyline2[i].z }  
    --         actorMgr:SpawnGadget(70690001, q427Cfg.Flyline2[i], M.Dir2Euler(AccDir), "Acc6" .. tostring(i))
    --     end
    end
end

function Q427FlyCoins2:OnPostDataPrepare()
end

function Q427FlyCoins2:OnPostComponentPrepare()
	self:AddComponentTrigger(3, DistType.EULER, M.Pos(0, 0, 0), self.TriggerIn, self.TriggerOut)
end

function Q427FlyCoins2:TriggerIn()
    print("TotalGetNum2 is", q427Cfg.TotalGetNum2)
    print("CoinNum2 is", q427Cfg.CoinNum2)
    print("NowBatchNum2 is", q427Cfg.NowBatchNum2)

    q427Cfg.TotalGetNum2 = q427Cfg.TotalGetNum2 +1
    if q427Cfg.TotalGetNum2 == 1 then
        self:CountNumUIStart()
    end
    self:CountNumUIUpdate(q427Cfg.TotalGetNum2)

    local effctPos = self:GetPos()
    if q427Cfg.TotalGetNum2 < q427Cfg.CoinNum2 then
        self:PlayEffect("FlyRace_Marker_Active_AS", effctPos)
    else
        self:PlayEffect("FlyRace_Goal_Marker_AS", effctPos)
        self:CountNumUITerminate()
        local quest = actorMgr:GetActor(q427Cfg.ActorAlias)
        if quest ~= nil then
            quest:FinishQuestID(false, 42705)
        end
        self:DestroySelf()
    end

    self:DestroySelf()    

    q427Cfg.EachGetNum2 = q427Cfg.EachGetNum2 +1
    if q427Cfg.EachGetNum2 == #q427Cfg.FlyCoins2[q427Cfg.NowBatchNum2] then
        q427Cfg.EachGetNum2 = 0
        q427Cfg.NowBatchNum2 = q427Cfg.NowBatchNum2 +1
        CreateNext()
    else
        -- dosth
    end

end

function Q427FlyCoins2:TriggerOut()

end

return Q427FlyCoins2