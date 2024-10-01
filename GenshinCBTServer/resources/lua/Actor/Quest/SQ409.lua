require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')
local Quest409 = class("Quest409", questActorProxy)
Quest409.defaultAlias = "Quest409"

local this = nil
local super = nil
local uActor = nil
local questID = 0
local success = false


function Quest409:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest409:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q409Cfg = require('Actor/Quest/Q409/Q409Config')
local subIDs = q409Cfg.SubIDs
local JudgeData = q409Cfg.JudgeData


-- local config end

function Quest409:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

local function ChallengePrepare()
    print("ChallengePrepare")
    actorMgr:CreateActorWithPos("GoalMarker409", "Actor/Gadget/GoalMarker409", 70300004, 0, q409Cfg.KeyPos, q409Cfg.KeyDir, true, false)
    this:SpawnMonster(q409Cfg.BallMonsterID, 1, q409Cfg.BallPos1, nil, nil, nil, "Ball1")
    this:SpawnMonster(q409Cfg.BallMonsterID, 1, q409Cfg.BallPos2, nil, nil, nil, "Ball2")
    this:SpawnMonster(q409Cfg.BallMonsterID, 1, q409Cfg.BallPos3, nil, nil, nil, "Ball3")
end

local function ChallengeDestroy()
    local GoalMarker409 = actorMgr:GetActor("GoalMarker409")
    if GoalMarker409 ~= nil then
        GoalMarker409:DestroySelf()
    end
    this:UnSpawn("Ball1")
    this:UnSpawn("Ball2")
    this:UnSpawn("Ball3")
end

local function CountDown()
    print("CountDown Finished")
    this:CountDownUITerminate()
    this:CountNumUITerminate()
    ChallengeDestroy()
    if q409Cfg.Score < q409Cfg.RequireScore then
        success = false
        local quest = actorMgr:GetActor(q409Cfg.ActorAlias)
        if quest ~= nil then
            print("success == false")
            quest:FinishQuest(true, nil)
        end
    elseif q409Cfg.Score >= q409Cfg.RequireScore then
        success = true
        local quest = actorMgr:GetActor(q409Cfg.ActorAlias)
        if quest ~= nil then
            print("success == true")
            quest:FinishQuest(false, nil)
        end
    end
end

local function StartCount(actor)
    this:CountDownUIStart(q409Cfg.MatchTime, 10, 3)
    this:CountNumUIStart()
    this:CallDelay(q409Cfg.MatchTime+4,CountDown)
end

local function OnStart40901(quest)
    this:ActionSafeCall(
        function (this)
            actorMgr:CreateActorWithPos(JudgeData.Judge, JudgeData.JudgeScript, JudgeData.JudgeID, 0, JudgeData.JudgePos, JudgeData.JudgeDir, true, false)
        end
    )
end

local function OnStart40902(quest)
    print("40902 start: chanllenge start")
    q409Cfg.Score = 0
    ChallengePrepare()
    this:ActionSafeCall(StartCount)
end

local function OnFinished40902()
    print("Chanllenge finish")
    this:CountDownUITerminate()
    this:CountNumUITerminate()
    this:UnCallFunc(CountDown)
    ChallengeDestroy()
end

local function OnFailed40902()
    print("OnFailed40902")
end

local function OnStart40905()
    print("40905 start: fail the task")
    local quest = actorMgr:GetActor(q409Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(true, nil)
    end
end

local function OnRewind40901()
end
local function OnRewind40904()
end

-- local method end

function Quest409:OnMainStart(quest)

end

function Quest409:OnSubStart(quest)
	local questID = quest.QuestId
	if questID == subIDs.q40901 then
        OnStart40901(quest)
    elseif questID == subIDs.q40902 then
        OnStart40902(quest)
    elseif questID == subIDs.q40905 then
        OnStart40905()
	end
end

function Quest409:OnSubFinished(quest)
    local questID = quest.QuestId
	if questID == subIDs.q40902 then
        OnFinished40902()
	end
end

function Quest409:OnSubFailed(quest)
    local questID = quest.QuestId
	if questID == subIDs.q40902 then
        OnFailed40902()
	end
end

function Quest409:OnRewind(quest)
    local questID = quest.QuestId
	if questID == subIDs.q40901 then
        OnRewind40901()
    elseif questID == subIDs.q40904 then
        OnRewind40904()
	end
end

function Quest409:OnMainFinished(quest)
end

function Quest409:Start()
end

function Quest409:OnDestroy()
end

return Quest409