require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')
local Quest406 = class("Quest406", questActorProxy)
Quest406.defaultAlias = "Quest406"

local this = nil
local super = nil
local uActor = nil
local questID = 0
local success = false


function Quest406:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest406:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q406Cfg = require('Actor/Quest/Q406/Q406Config')
local subIDs = q406Cfg.SubIDs
local amborData = q406Cfg.AmborData


-- local config end

function Quest406:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

local function ModifyY(AccDir)
    if AccDir.y >= 7 then
        AccDir.y = AccDir.y + 3
    elseif AccDir.y >= 5 and AccDir.y < 7 then
        AccDir.y = AccDir.y + 2
    elseif AccDir.y >= 3 and AccDir.y < 5 then
        AccDir.y = AccDir.y + 1
    elseif AccDir.y >= -5 and AccDir.y < -3 then
        AccDir.y = AccDir.y - 0
    elseif AccDir.y >= -7 and AccDir.y < -5 then
        AccDir.y = AccDir.y - 0
    elseif AccDir.y < -7 then
        AccDir.y = AccDir.y - 0
    end
end

local function MengdeFlyPrepare()
    print("MengdeFlyPrepare")
    local j = 0
    for i=1, #q406Cfg.CoinPos do
        if i%13==1 or i%13==5 or i%13==9 then
            j = j+1
            local SpeedFieldDir = { x = q406Cfg.CoinPos[i+1].x-q406Cfg.CoinPos[i].x, y = q406Cfg.CoinPos[i+1].y-q406Cfg.CoinPos[i].y, z = q406Cfg.CoinPos[i+1].z-q406Cfg.CoinPos[i].z } 
            ModifyY(SpeedFieldDir)
            this:SpawnGadget(70690001, q406Cfg.CoinPos[i], M.Dir2Euler(SpeedFieldDir), "SpeedField" .. tostring(j))
        else
            actorMgr:CreateActorWithPos("CoinTest" .. tostring(i), "Actor/Gadget/CoinTest", 70300003, 0, q406Cfg.CoinPos[i], q406Cfg.CoinDir, true, false)
        end
    end
end

local function MengdeFlyDestroy()
    print("MengdeFlyPrepare")
    local j = 0
    for i=1, #q406Cfg.CoinPos do
        if i%13==1 or i%13==5 or i%13==9 then
            j = j+1
            globalActor:UnSpawn("SpeedField" .. tostring(j))
        else
            local coin = actorMgr:GetActor("CoinTest" .. tostring(i))
            if coin ~= nil then
                coin:DestroySelf()
            end
        end
    end
end

function Quest406:CountDown()
    print("CountDown Finished")
    this:CountDownUITerminate()
    this:CountNumUITerminate()
    MengdeFlyDestroy()
    if q406Cfg.CoinNum < q406Cfg.CoinRequireNum then
        success = false
        local quest = actorMgr:GetActor(q406Cfg.ActorAlias)
        if quest ~= nil then
            print("success == false")
            quest:FinishQuest(true, nil)
        end
    elseif q406Cfg.CoinNum >= q406Cfg.CoinRequireNum then
        success = true
        local quest = actorMgr:GetActor(q406Cfg.ActorAlias)
        if quest ~= nil then
            print("success == true")
            quest:FinishQuest(false, nil)
        end
    end
end

-- local param begin
-- local param end

-- local method begin

local function AbleQuit()
    this:ShowQuestQuitUI(subIDs.q40602)
end

local function StartCount(actor)
    this:CountDownUIStart(q406Cfg.MatchTime, 10, 3)
    this:CountNumUIStart()
    this:CallDelay(q406Cfg.MatchTime+4,this.CountDown)
    this:CallDelay(13,AbleQuit)
end

-- local function PreStartCount()
--     this:CountDownUIStart(3, 3)
--     this:CallDelay(3,StartCount)
-- end

local function MovePlayer()
    this:TransmitPlayer(0, M.Pos(2192, 211, -981), amborData.judgeDir)
end

local function FailCount()
    this:HideQuestQuitUI()
    this:CountDownUITerminate()
    this:CountNumUITerminate()
    this:UnCallFunc(this.CountDown)
    MengdeFlyDestroy()
    MovePlayer()
end

local function SuccCount()
    this:HideQuestQuitUI()
    this:CountDownUITerminate()
    this:CountNumUITerminate()
    this:UnCallFunc(this.CountDown)
    MengdeFlyDestroy()
    this:CallDelay(2,MovePlayer)
end

local function AmborToJudgePos(actor)
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.judgePos, amborData.judgeDir, true, false)
end

local function OnStart40601(quest)
    print("40601 start: Ambor Judge Create")
    this:ActionSafeCall(AmborToJudgePos)
end

local function OnStart40602(quest)
    print("40602 start: Coin Create")
    q406Cfg.CoinNum = 0
    MengdeFlyPrepare()
    this:ActionSafeCall(StartCount)
end

local function OnFinished40602()
    print("OnFinished40602")
    SuccCount()
end

local function OnFailed40602()
    print("OnFailed40602")
    FailCount()
end

local function OnStart40605()
    print("40605 start: fail the task")
    local quest = actorMgr:GetActor(q406Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(true, nil)
    end
end

local function OnRewind40601()
    print("OnRewind40601: Ambor Judge Create")
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.judgePos, amborData.judgeDir, true, false)
end
local function OnRewind40604()
    print("OnRewind40601: Ambor Judge Create")
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.judgePos, amborData.judgeDir, true, false)
end

-- local method end

function Quest406:OnMainStart(quest)

end

function Quest406:OnSubStart(quest)
	local questID = quest.QuestId
	if questID == subIDs.q40601 then
        OnStart40601(quest)
    elseif questID == subIDs.q40602 then
        OnStart40602(quest)
    elseif questID == subIDs.q40605 then
        OnStart40605()
	end
end

function Quest406:OnSubFinished(quest)
    local questID = quest.QuestId
	if questID == subIDs.q40602 then
        OnFinished40602()
	end
end

function Quest406:OnSubFailed(quest)
    local questID = quest.QuestId
	if questID == subIDs.q40602 then
        OnFailed40602()
	end
end

function Quest406:OnRewind(quest)
    local questID = quest.QuestId
	if questID == subIDs.q40601 then
        OnRewind40601()
    elseif questID == subIDs.q40604 then
        OnRewind40604()
	end
end

function Quest406:OnMainFinished(quest)
end

function Quest406:Start()
end

function Quest406:OnDestroy()
end

return Quest406