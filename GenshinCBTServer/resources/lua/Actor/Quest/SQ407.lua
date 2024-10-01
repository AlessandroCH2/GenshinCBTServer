require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')
local Quest407 = class("Quest407", questActorProxy)
Quest407.defaultAlias = "Quest407"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest407:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest407:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q407Cfg = require('Actor/Quest/Q407/Q407Config')
local subIDs = q407Cfg.SubIDs
local JudgeData = q407Cfg.JudgeData

-- local config end

function Quest407:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end


-- local method begin
local function CricketDestroy(i)
    print("CricketDestroy" .. tostring(i))
    globalActor:UnSpawn("Sound" .. tostring(i))
    globalActor:UnSpawn("Cricket" .. tostring(i))
end

local function CricketStart(self, i)
    print(i)
    CricketDestroy(i)
    math.randomseed(os.time())
    if q407Cfg.GameRunning == true then
        print("CricketStart" .. tostring(i))
        local RandomHole = math.random(1, q407Cfg.HoleNum)
        local RandomDuration = math.random(1, 4)
        local RandomSound = math.random(1, 100)
        local RandomDir = { x = 0, y = 0, z = 0 }
        if RandomSound >= 1 and RandomSound < 20 then
            globalActor:SpawnGadget(q407Cfg.SoundGadgetID[1], q407Cfg.HolePos[RandomHole], M.Dir2Euler(RandomDir), "Sound" .. tostring(i))
            globalActor:SpawnItem(q407Cfg.CricketItemID[1], q407Cfg.HolePos[RandomHole], nil, "Cricket" .. tostring(i))
        elseif  RandomSound >= 20 and RandomSound < 30 then
            globalActor:SpawnGadget(q407Cfg.SoundGadgetID[1], q407Cfg.HolePos[RandomHole], M.Dir2Euler(RandomDir), "Sound" .. tostring(i))
            globalActor:SpawnItem(q407Cfg.CricketItemID[2], q407Cfg.HolePos[RandomHole], nil, "Cricket" .. tostring(i))
        elseif  RandomSound >= 30 and RandomSound < 40 then
            globalActor:SpawnGadget(q407Cfg.SoundGadgetID[1], q407Cfg.HolePos[RandomHole], M.Dir2Euler(RandomDir), "Sound" .. tostring(i))
            globalActor:SpawnItem(q407Cfg.CricketItemID[3], q407Cfg.HolePos[RandomHole], nil, "Cricket" .. tostring(i))
        elseif  RandomSound >= 40 and RandomSound < 50 then
            globalActor:SpawnGadget(q407Cfg.SoundGadgetID[2], q407Cfg.HolePos[RandomHole], M.Dir2Euler(RandomDir), "Sound" .. tostring(i))
            globalActor:SpawnItem(q407Cfg.CricketItemID[1], q407Cfg.HolePos[RandomHole], nil, "Cricket" .. tostring(i))
        elseif  RandomSound >= 50 and RandomSound < 60 then
            globalActor:SpawnGadget(q407Cfg.SoundGadgetID[2], q407Cfg.HolePos[RandomHole], M.Dir2Euler(RandomDir), "Sound" .. tostring(i))
            globalActor:SpawnItem(q407Cfg.CricketItemID[3], q407Cfg.HolePos[RandomHole], nil, "Cricket" .. tostring(i))
        elseif  RandomSound >= 60 and RandomSound < 70 then
            globalActor:SpawnGadget(q407Cfg.SoundGadgetID[2], q407Cfg.HolePos[RandomHole], M.Dir2Euler(RandomDir), "Sound" .. tostring(i))
            globalActor:SpawnItem(q407Cfg.CricketItemID[4], q407Cfg.HolePos[RandomHole], nil, "Cricket" .. tostring(i))
        elseif  RandomSound >= 70 and RandomSound < 80 then
            globalActor:SpawnGadget(q407Cfg.SoundGadgetID[3], q407Cfg.HolePos[RandomHole], M.Dir2Euler(RandomDir), "Sound" .. tostring(i))
            globalActor:SpawnItem(q407Cfg.CricketItemID[1], q407Cfg.HolePos[RandomHole], nil, "Cricket" .. tostring(i))
        elseif  RandomSound >= 80 and RandomSound < 87 then
            globalActor:SpawnGadget(q407Cfg.SoundGadgetID[3], q407Cfg.HolePos[RandomHole], M.Dir2Euler(RandomDir), "Sound" .. tostring(i))
            globalActor:SpawnItem(q407Cfg.CricketItemID[4], q407Cfg.HolePos[RandomHole], nil, "Cricket" .. tostring(i))
        elseif  RandomSound >= 87 and RandomSound < 93 then
            globalActor:SpawnGadget(q407Cfg.SoundGadgetID[3], q407Cfg.HolePos[RandomHole], M.Dir2Euler(RandomDir), "Sound" .. tostring(i))
            globalActor:SpawnItem(q407Cfg.CricketItemID[5], q407Cfg.HolePos[RandomHole], nil, "Cricket" .. tostring(i))
        elseif  RandomSound >= 93 and RandomSound < 97 then
            globalActor:SpawnGadget(q407Cfg.SoundGadgetID[4], q407Cfg.HolePos[RandomHole], M.Dir2Euler(RandomDir), "Sound" .. tostring(i))
            globalActor:SpawnItem(q407Cfg.CricketItemID[1], q407Cfg.HolePos[RandomHole], nil, "Cricket" .. tostring(i))
        elseif  RandomSound >= 97 and RandomSound <= 100 then
            globalActor:SpawnGadget(q407Cfg.SoundGadgetID[4], q407Cfg.HolePos[RandomHole], M.Dir2Euler(RandomDir), "Sound" .. tostring(i))
            globalActor:SpawnItem(q407Cfg.CricketItemID[5], q407Cfg.HolePos[RandomHole], nil, "Cricket" .. tostring(i))
        end
        print("$$$$$$$$$$" .. tostring(i))
        this:CallDelay(RandomDuration, CricketStart, i)
    end
end



local function CountDown()
    print("CountDown Finished")
    q407Cfg.GameRunning = false
    for i=1, q407Cfg.CricketNum do
        CricketDestroy(i)
    end
    if q407Cfg.GotCricket == false then
        local quest = actorMgr:GetActor(q407Cfg.ActorAlias)
        if quest ~= nil then
            print("isFinished == false")
            quest:FinishQuest(true, nil)
        end
    end
end

local function StartCount(actor)
    print("StartCount")
    this:CountDownUIStart(q407Cfg.MatchTime, 10, 3)
    CricketStart(this, 1)
    this:CallDelay(15, CricketStart, 2)
    -- this:CallDelay(14, CricketStart, 3)
    -- this:CallDelay(21, CricketStart, 4)
    this:CallDelay(q407Cfg.MatchTime+4, CountDown)
end

local function OnStart40701(quest)
    this:ActionSafeCall(
        function (this)
            actorMgr:CreateActorWithPos(JudgeData.Judge, JudgeData.JudgeScript, JudgeData.JudgeID, 0, JudgeData.JudgePos, JudgeData.JudgeDir, true, false)
        end
    )
end

local function OnStart40702(quest)
    print("OnStart40702")
    q407Cfg.GameRunning = true
    q407Cfg.GotCricket = false
    this:ActionSafeCall(StartCount)
end

local function OnFinished40702()
    q407Cfg.GameRunning = false
    q407Cfg.GotCricket = true
    this:CountDownUITerminate()
    this:UnCallFunc(CountDown)
    this:UnCallFunc(CricketStart)
    for i=1, q407Cfg.CricketNum do
        CricketDestroy(i)
    end
end

local function OnStart40705()
    print("40705 start: fail the task")
    local quest = actorMgr:GetActor(q407Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(true, nil)
    end
end


-- local method end

function Quest407:OnMainStart(quest)

end

function Quest407:OnSubStart(quest)
	local questID = quest.QuestId
	if questID == subIDs.q40701 then
        OnStart40701(quest)
    elseif questID == subIDs.q40702 then
        OnStart40702(quest)
    elseif questID == subIDs.q40705 then
        OnStart40705(quest)
	end
end

function Quest407:OnSubFinished(quest)
    local questID = quest.QuestId
	if questID == subIDs.q40702 then
        OnFinished40702(quest)
	end
end

function Quest407:OnRewind(quest)
end

function Quest407:OnMainFinished(quest)
end

function Quest407:Start()
end

function Quest407:OnDestroy()
end

return Quest407