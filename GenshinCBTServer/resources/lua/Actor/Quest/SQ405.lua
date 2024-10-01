require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')
local Quest405 = class("Quest405", questActorProxy)
Quest405.defaultAlias = "Quest405"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest405:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest405:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q404Cfg = require('Actor/Quest/Q404/Q404Config')
local q405Cfg = require('Actor/Quest/Q405/Q405Config')
local subIDs = q405Cfg.SubIDs
local amborData = q404Cfg.AmborData

-- local config end

function Quest405:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

local function ModifyY(AccDir)
    if AccDir.y >= 8 then
        AccDir.y = AccDir.y + 6
    elseif AccDir.y >= 5 and AccDir.y < 8 then
        AccDir.y = AccDir.y + 2.5
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

local function DrunkFlyPrepare()
    print("DrunkFlyPrepare")
    for i=1, #q405Cfg.AccPos1-1 do
        local AccDir = { x = q405Cfg.AccPos1[i+1].x-q405Cfg.AccPos1[i].x, y = q405Cfg.AccPos1[i+1].y-q405Cfg.AccPos1[i].y, z = q405Cfg.AccPos1[i+1].z-q405Cfg.AccPos1[i].z } 
        ModifyY(AccDir) 
        this:SpawnGadget(70690001, q405Cfg.AccPos1[i], M.Dir2Euler(AccDir), "Acc1" .. tostring(i))
    end
    -- for i=1, #q405Cfg.AccPos2-1 do
    --     if q405Cfg.AccPos2[i].x ~= 0 then
    --         if q405Cfg.AccPos2[i+1].x ~= 0 then
    --             local AccDir = { x = q405Cfg.AccPos2[i+1].x-q405Cfg.AccPos2[i].x, y = q405Cfg.AccPos2[i+1].y-q405Cfg.AccPos2[i].y, z = q405Cfg.AccPos2[i+1].z-q405Cfg.AccPos2[i].z } 
    --             ModifyY(AccDir)
    --             this:SpawnGadget(70690001, q405Cfg.AccPos2[i], M.Dir2Euler(AccDir), "Acc2" .. tostring(i))
    --         else
    --             local AccDir = { x = q405Cfg.AccPos1[i+1].x-q405Cfg.AccPos2[i].x, y = q405Cfg.AccPos1[i+1].y-q405Cfg.AccPos2[i].y, z = q405Cfg.AccPos1[i+1].z-q405Cfg.AccPos2[i].z } 
    --             ModifyY(AccDir)
    --             this:SpawnGadget(70690001, q405Cfg.AccPos2[i], M.Dir2Euler(AccDir), "Acc2" .. tostring(i))
    --         end
    --     end
    -- end
    local RiseDir = {x=0,y=0,z=0}
    this:SpawnGadget(40200001, q405Cfg.RisePos1[1], M.Dir2Euler(RiseDir), "Rise1")
    -- this:SpawnGadget(40200001, q405Cfg.RisePos2[1], M.Dir2Euler(RiseDir), "Rise2")
end

local function DrunkFlyDestroy()
    print("DrunkFlyDestroy")
    for i=1, #q405Cfg.AccPos1-1 do
        globalActor:UnSpawn("Acc1" .. tostring(i))
    end
    for i=1, #q405Cfg.AccPos2-1 do
        if q405Cfg.AccPos2[i].x ~= 0 then
            globalActor:UnSpawn("Acc2" .. tostring(i))                
        end
    end
    local RiseDir = {x=0,y=0,z=0}
    globalActor:UnSpawn("Rise1")
    -- globalActor:UnSpawn("Rise2")
end

function Quest405:CountDown()
    print("CountDown Finished")
    DrunkFlyDestroy()
    if q405Cfg.gotKey == false then
        local GoalMarker405 = actorMgr:GetActor("GoalMarker405")
        if GoalMarker405 ~= nil then
            GoalMarker405:DestroySelf()
        end
        local quest = actorMgr:GetActor(q405Cfg.ActorAlias)
        if quest ~= nil then
            print("isFinished == false")
            quest:FinishQuest(true, nil)
        end
    end
end

-- local param begin
-- local param end

-- local method begin
local function AbleQuit()
    this:ShowQuestQuitUI(subIDs.q40502)
end

local function StartCount(actor)
    this:CountDownUIStart(q405Cfg.MatchTime, 10, 3)
    this:CallDelay(q405Cfg.MatchTime+4,this.CountDown)
    this:CallDelay(13,AbleQuit)
end

-- local function PreStartCount()
--     this:CountDownUIStart(3, 3)
--     this:CallDelay(3,StartCount)
-- end

local function MovePlayer()
    this:TransmitPlayer(0, M.Pos(1916, 220, -693), sceneData:GetDummyPoint(3,"Q405DrunkJudge").rot)
end

local function FailCount()
    this:HideQuestQuitUI()
    this:CountDownUITerminate()
    this:UnCallFunc(this.CountDown)
    DrunkFlyDestroy()
    MovePlayer()
    local GoalMarker405 = actorMgr:GetActor("GoalMarker405")
    if GoalMarker405 ~= nil then
        GoalMarker405:DestroySelf()
    end
end

local function SuccCount()
    this:HideQuestQuitUI()
    this:CountDownUITerminate()
    this:UnCallFunc(this.CountDown)
    DrunkFlyDestroy()
    local GoalMarker405 = actorMgr:GetActor("GoalMarker405")
    if GoalMarker405 ~= nil then
        GoalMarker405:DestroySelf()
    end
end

local function AmborToJudgePos(actor)
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, sceneData:GetDummyPoint(3,"Q405DrunkJudge").pos, sceneData:GetDummyPoint(3,"Q405DrunkJudge").rot, true, false)
end

local function OnStart40501(quest)
    print("OnStart40501")
    this:ActionSafeCall(AmborToJudgePos)
    -- DrunkFlyDestroy()
    -- DrunkFlyPrepare()
    -- local GoalMarkerFake405 = actorMgr:GetActor("GoalMarkerFake405")
    -- if GoalMarkerFake405 ~= nil then
    --     GoalMarkerFake405:DestroySelf()
    -- end
    -- actorMgr:CreateActorWithPos("GoalMarkerFake405", "Actor/Gadget/GoalMarkerAS", 70300004, 0, q405Cfg.KeyPos, q405Cfg.KeyDir, true, false)
end

local function OnFinished40501()
    -- print("40501 finish: UnSpawn fake Key")
    -- local GoalMarkerFake405 = actorMgr:GetActor("GoalMarkerFake405")
    -- if GoalMarkerFake405 ~= nil then
    --     GoalMarkerFake405:DestroySelf()
    -- end
end

local function OnStart40502(quest)
    print("40502 start: Spawn Key") 
    DrunkFlyPrepare()  
    q405Cfg.gotKey = false
    actorMgr:CreateActorWithPos("GoalMarker405", "Actor/Gadget/GoalMarker405", 70300004, 0, q405Cfg.KeyPos, q405Cfg.KeyDir, true, false)
    this:ActionSafeCall(StartCount)
end

local function OnFinished40502()
    print("OnFinished40502")
    SuccCount()
end

local function OnStart40503()
    print("OnStart40503")
    FailCount()
end

local function OnStart40505()
    print("40505 start: fail the task")
    local quest = actorMgr:GetActor(q405Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(true, nil)
    end
end

local function OnRewind40501()
    print("OnRewind40501: Ambor Create")
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, sceneData:GetDummyPoint(3,"Q405DrunkJudge").pos, sceneData:GetDummyPoint(3,"Q405DrunkJudge").rot, true, false)
end

local function OnRewind40504()
    print("OnRewind40504: Ambor Create")
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, sceneData:GetDummyPoint(3,"Q405DrunkJudge").pos, sceneData:GetDummyPoint(3,"Q405DrunkJudge").rot, true, false)
end


-- local method end

function Quest405:OnMainStart(quest)

end

function Quest405:OnSubStart(quest)
	local questID = quest.QuestId
	if questID == subIDs.q40502 then
        OnStart40502(quest)
    elseif questID == subIDs.q40505 then
        OnStart40505()
    elseif questID == subIDs.q40501 then
        OnStart40501(quest)
    elseif questID == subIDs.q40503 then
        OnStart40503()
	end
end

function Quest405:OnSubFinished(quest)
    local questID = quest.QuestId
	if questID == subIDs.q40502 then
        OnFinished40502()
    elseif questID == subIDs.q40501 then
        OnFinished40501()
	end
end

-- Quest405.OnSubFailed(quest)
--     local questID = quest.QuestId
--     if questID == subIDs.q40502 then
--         OnFailed40502()
--     end
-- end

function Quest405:OnRewind(quest)
    local questID = quest.QuestId
	if questID == subIDs.q40501 then
        OnRewind40501()
    elseif questID == subIDs.q40504 then
        OnRewind40504()
	end
end

function Quest405:OnMainFinished(quest)
end

function Quest405:Start()
end

function Quest405:OnDestroy()
end

return Quest405