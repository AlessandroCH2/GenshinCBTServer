require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest465 = class("Quest465", questActorProxy)

Quest465.defaultAlias = "Quest465"

local q465Cfg = require('Quest/Client/Q465ClientConfig')
local dilucData = q465Cfg.DilucData
local hoffmanData = q465Cfg.HoffmanData
local kaeyaData = q465Cfg.KaeyaData
local abyssWaterData = q465Cfg.AbyssWaterData
local SAN = 100
local ESCAPE = 0
local WIN = 0

-- Generated
function Quest465:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    self.subStartHandlers["46501"] = self.OnSubStart46501
    self.subStartHandlers["46502"] = self.OnSubStart46502
    self.subStartHandlers["46503"] = self.OnSubStart46503
    self.subStartHandlers["46504"] = self.OnSubStart46504
    self.subStartHandlers["46505"] = self.OnSubStart46505
    self.subStartHandlers["46506"] = self.OnSubStart46506
    self.subStartHandlers["46507"] = self.OnSubStart46507
    self.subStartHandlers["46508"] = self.OnSubStart46508
    self.subStartHandlers["46509"] = self.OnSubStart46509
    self.subStartHandlers["46510"] = self.OnSubStart46510
    self.subStartHandlers["46511"] = self.OnSubStart46511
    self.subStartHandlers["46512"] = self.OnSubStart46512
    self.subStartHandlers["46513"] = self.OnSubStart46513
    self.subStartHandlers["46514"] = self.OnSubStart46514
    self.subStartHandlers["46515"] = self.OnSubStart46515
end

function Quest465:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    self.subFinishHandlers["46501"] = self.OnSubFinish46501
    self.subFinishHandlers["46502"] = self.OnSubFinish46502
    self.subFinishHandlers["46503"] = self.OnSubFinish46503
    self.subFinishHandlers["46504"] = self.OnSubFinish46504
    self.subFinishHandlers["46505"] = self.OnSubFinish46505
    self.subFinishHandlers["46506"] = self.OnSubFinish46506
    self.subFinishHandlers["46507"] = self.OnSubFinish46507
    self.subFinishHandlers["46508"] = self.OnSubFinish46508
    self.subFinishHandlers["46509"] = self.OnSubFinish46509
    self.subFinishHandlers["46510"] = self.OnSubFinish46510
    self.subFinishHandlers["46511"] = self.OnSubFinish46511
    self.subFinishHandlers["46512"] = self.OnSubFinish46512
    self.subFinishHandlers["46513"] = self.OnSubFinish46513
    self.subFinishHandlers["46514"] = self.OnSubFinish46514
    self.subFinishHandlers["46515"] = self.OnSubFinish46515
    self.subFinishHandlers["46516"] = self.OnSubFinish46516
    self.subFinishHandlers["46517"] = self.OnSubFinish46517
    self.subFinishHandlers["46518"] = self.OnSubFinish46518
    self.subFinishHandlers["46519"] = self.OnSubFinish46519
end

-- local method begin
-- local method end

--@region sub start & finish handlers
function Quest465:OnSubFinish46502(quest)
    print("46502 Finish: Creat NPC")
    self:NarratorOnlyTask(self.clientData.NarratorData.Story1)
    actorMgr:CreateActorWithPos(hoffmanData.Hoffman, hoffmanData.HoffmanScript, hoffmanData.HoffmanID, 0, hoffmanData.Pos1, hoffmanData.Dir1, true, false, 1004)
end

function Quest465:OnSubFinish46503(quest)
    print("46503 Finish: Creat NPC")
    self:NarratorOnlyTask(self.clientData.NarratorData.Story2)
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.Pos1, dilucData.Dir1, true)
end

function Quest465:OnSubFinish46505(quest)
    print("46505 Finish: Move NPC")
    self:ActionSafeCall(self.Finish46505Do)
    --actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.Pos2, dilucData.Dir2, true)
end
function Quest465:Finish46505Do(quest)
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.Pos2, dilucData.Dir2, true)
end

function Quest465:OnSubFinish46507(quest)
    print("46507 Finish: TempDungeon")
    local TempDungeonData = self.clientData.TempDungeonData
    globalActor:SpawnItem(TempDungeonData.TempDungeonID, TempDungeonData.TempDungeonPos,nil,"TempDungeonData")
end

function Quest465:OnSubFinish46508(quest)
    print("46508 Finish: Monster")
    self:SpawnMonster(22010201, 1, sceneData:GetDummyPoint(3,"Q465DilucDungeon").pos)
end

function Quest465:OnSubFinish46509(quest)
    print("46509 Finish: NPC")
    actorMgr:CreateActorWithPos(abyssWaterData.AbyssWater, abyssWaterData.AbyssWaterScript, abyssWaterData.AbyssWaterID, 0, abyssWaterData.Pos1, abyssWaterData.Dir1, true, false, 3)
end
function Quest465:InvokeOnInteraction(param)
    if param == 1 then
        print("SAN-10/30,ESCAPE+20")
        self:SANMinusi()
        -- self:ShowMessage("SAN：" .. SAN)
        -- self:ShowMessage("ESCAPE：" .. ESCAPE)
	elseif param == 2 then
		print("SAN-30/60,ESCAPE+20")
        self:SANMinusj()
        -- self:ShowMessage("SAN：" .. SAN)
        -- self:ShowMessage("ESCAPE：" .. ESCAPE)
    elseif param == 3 then
		print("SAN-0,ESCAPE+20")
        self:SANMinusk()
        -- self:ShowMessage("SAN：" .. SAN)
        -- self:ShowMessage("ESCAPE：" .. ESCAPE)
	end
end
function Quest465:SANMinusi()
    local i = math.random(10,30)
    SAN = SAN-i
    ESCAPE = ESCAPE+20
    WIN = 100 - SAN
    self:PlayEffect("Eff_Diluc_FireCross_Aoe", abyssWaterData.Pos1)
    local quest = actorMgr:GetActor(q465Cfg.ActorAlias)
	if quest ~= nil and SAN<=0 then
        quest:FinishQuestID(false, 46517)

        local AbyssWater = actorMgr:GetActor("AbyssWater")
        AbyssWater:DoFreeStyle(302)
        self:ShowMessage("犯人晕过去了！")
    elseif quest ~= nil and SAN>0 then
        self:ESC()
	end
end
function Quest465:SANMinusj()
    local j = math.random(30,60)
    SAN = SAN-j
    ESCAPE = ESCAPE+20
    WIN = 100 - SAN
    self:PlayEffect("Eff_Diluc_FireCross_Aoe", abyssWaterData.Pos1)
    local quest = actorMgr:GetActor(q465Cfg.ActorAlias)
	if quest ~= nil and SAN<=0 then
        quest:FinishQuestID(false, 46517)

        local AbyssWater = actorMgr:GetActor("AbyssWater")
        AbyssWater:DoFreeStyle(302)
        self:ShowMessage("犯人晕过去了！")
    elseif quest ~= nil and SAN>0 then
        self:ESC()
	end
end
function Quest465:SANMinusk()
    SAN = SAN    
    ESCAPE = ESCAPE+20
    WIN = 100 - SAN
    local quest = actorMgr:GetActor(q465Cfg.ActorAlias)
	if quest ~= nil and SAN<=0 then
        quest:FinishQuestID(false, 46517)

        local AbyssWater = actorMgr:GetActor("AbyssWater")
        AbyssWater:DoFreeStyle(302)
        self:ShowMessage("犯人晕过去了！")
    elseif quest ~= nil and SAN>0 then
        self:SUC()
	end
end
function Quest465:ESC()
    local esc = math.random(1,100)
    local quest = actorMgr:GetActor(q465Cfg.ActorAlias)
    if quest ~= nil and esc < ESCAPE then
        self:ShowMessage("犯人要逃走了！" .. esc..ESCAPE)
        quest:FinishQuestID(false, 46516)
    else
        self:ShowMessage("犯人尝试逃走，但失败了！")
        self:ShowMessage("犯人坚强度%：" .. SAN)
        self:ShowMessage("犯人逃跑概率%：" .. ESCAPE)
        self:ShowMessage("拷问成功概率%：" .. WIN)
    end
end
function Quest465:SUC()
    local suc = math.random(1,100)
    local quest = actorMgr:GetActor(q465Cfg.ActorAlias)
    if quest ~= nil and suc > SAN then
        self:ShowMessage("拷问成功！" .. suc)
        quest:FinishQuestID(false, 46515)
    else
        self:ESC()
    end
end

function Quest465:OnSubStart46510(quest)
    print("46510 Start: Clear data")
    actorMgr:CreateActorWithPos(abyssWaterData.AbyssWater, abyssWaterData.AbyssWaterScript, abyssWaterData.AbyssWaterID, 0, abyssWaterData.Pos1, abyssWaterData.Dir1, true, false, 3)
    SAN = 100
    ESCAPE = 0
    WIN = 0
end

function Quest465:OnSubStart46514(quest)
    print("46514 Start: Show UI")
    self:ShowMessage("犯人坚强度%：" .. SAN)
    self:ShowMessage("犯人逃跑概率%：" .. ESCAPE)
    self:ShowMessage("拷问成功概率%：" .. WIN)
end

function Quest465:OnSubFinish46518(quest)
    print("46516 Finish: prisoner disappear")
    self:ActionSafeCall(
        function(self)
            local AbyssWater = actorMgr:GetActor("AbyssWater")
            if AbyssWater ~= nil then
                AbyssWater:Destroy(false)
            end
        end
    )
end


function Quest465:OnSubFinish46514(quest)
    print("46514 Finish: Hide NPC")
    self:ActionSafeCall(self.Finish46514Do)
    --actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.hiddenPos, dilucData.hiddenDir, true)
end
function Quest465:Finish46514Do(quest)
    actorMgr:CreateActorWithPos(abyssWaterData.AbyssWater, abyssWaterData.AbyssWaterScript, abyssWaterData.AbyssWaterID, 0, abyssWaterData.hiddenPos, abyssWaterData.hiddenDir, true, false, 3)
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.hiddenPos, dilucData.hiddenDir, true)
    local TempDungeonData = self.clientData.TempDungeonData
    globalActor:SpawnItem(TempDungeonData.TempDungeonID, TempDungeonData.TempDungeonPos,nil,"TempDungeonData")
end

function Quest465:OnSubFinish46512(quest)
    print("46512 Finish: Creat NPC")
    actorMgr:CreateActorWithPos(hoffmanData.Hoffman, hoffmanData.HoffmanScript, hoffmanData.HoffmanID, 0, hoffmanData.Pos1, hoffmanData.Dir1, true, false, 1004)
end

function Quest465:OnSubFinish46513(quest)
    print("46513 Finish: Hide NPC")
    self:ActionSafeCall(self.Finish46513Do)
    --actorMgr:CreateActorWithPos(hoffmanData.Hoffman, hoffmanData.HoffmanScript, hoffmanData.HoffmanID, 0, hoffmanData.hiddenPos, hoffmanData.hiddenDir, true)
end
function Quest465:Finish46513Do(quest)
    actorMgr:CreateActorWithPos(hoffmanData.Hoffman, hoffmanData.HoffmanScript, hoffmanData.HoffmanID, 0, hoffmanData.hiddenPos, hoffmanData.hiddenDir, true)
end
--@endregion

function Quest465:Start()
end

function Quest465:OnDestroy()
end

return Quest465