require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')
local Quest408 = class("Quest408", questActorProxy)
Quest408.defaultAlias = "Quest408"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest408:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest408:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q408Cfg = require('Actor/Quest/Q408/Q408Config')
local subIDs = q408Cfg.SubIDs
local JudgeData = q408Cfg.JudgeData
-- local config end

function Quest408:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

local function BoardSeperatePrepare()
    print("BoardSeperatePrepare")
    this:SpawnGadget(q408Cfg.BoardSeperateGadgetID, q408Cfg.BoardPos, q408Cfg.BoardDir, "BoardSeperate")
end

local function BoardTogetherPrepare()
    print("BoardTogetherPrepare")
    this:SpawnGadget(q408Cfg.BoardTogetherGadgetID, q408Cfg.BoardPos, q408Cfg.BoardDir, "BoardTogether")
end

local function BoardDestroy()
    print("BoardDestroy")
    globalActor:UnSpawn("BoardSeperate")
    globalActor:UnSpawn("BoardTogether")
end

local function CountDown()
    print("CountDown Finished")
    -- BoardDestroy()
    if q408Cfg.gotKey == false then
        local GoalMarker408 = actorMgr:GetActor("GoalMarker408")
        if GoalMarker408 ~= nil then
            GoalMarker408:DestroySelf()
        end
        local quest = actorMgr:GetActor(q408Cfg.ActorAlias)
        if quest ~= nil then
            print("isFinished == false")
            quest:FinishQuest(true, nil)
        end
        this:ActionSafeCall(
            function (this)
                this:TransmitPlayer(0, q408Cfg.PlayerPos, q408Cfg.PlayerDir)
            end
        )
    end
end

local function StartCount(actor)
    this:CountDownUIStart(q408Cfg.MatchTime, 5, 3)
    this:CallDelay(q408Cfg.MatchTime+4, CountDown)
end

local function FailCount()
    this:CountDownUITerminate()
    this:UnCallFunc(this.CountDown)
    BoardDestroy()
    local GoalMarker408 = actorMgr:GetActor("GoalMarker408")
    if GoalMarker408 ~= nil then
        GoalMarker408:DestroySelf()
    end
end

local function SuccCount()
    this:CountDownUITerminate()
    this:UnCallFunc(this.CountDown)
    BoardDestroy()
    local GoalMarker408 = actorMgr:GetActor("GoalMarker408")
    if GoalMarker408 ~= nil then
        GoalMarker408:DestroySelf()
    end
end

local function OnStart40801(quest)
    this:ActionSafeCall(
        function (this)
            actorMgr:CreateActorWithPos(JudgeData.Judge, JudgeData.JudgeScript, JudgeData.JudgeID, 0, JudgeData.JudgePos, JudgeData.JudgeDir, true, false)
        end
    )
end

local function OnFinished40801()
end

local function OnStart40802(quest)
end

local function OnFinished40802()
    BoardTogetherPrepare()
end

local function OnFinished40803()
    BoardSeperatePrepare()
end

local function OnFinished40804()
    BoardDestroy()
end

local function OnStart40805()
    print("40805 start: fail the task")
    local quest = actorMgr:GetActor(q408Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(true, nil)
    end
end

local function OnStart40807(quest)
    print("40807 start: Spawn Key") 
    q408Cfg.gotKey = false
    actorMgr:CreateActorWithPos("GoalMarker408", "Actor/Gadget/GoalMarker408", 70300004, 0, q408Cfg.KeyPos, q408Cfg.KeyDir, true, false)
    this:ActionSafeCall(StartCount)
end

local function OnFinished40807()
    q408Cfg.gotKey = true
    this:CountDownUITerminate()
    this:UnCallFunc(CountDown)
    BoardDestroy()
end

local function OnFinished40808()
    BoardDestroy()
end

local function OnStart40810()
    print("40810 start: fail the task")
    local quest = actorMgr:GetActor(q408Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(true, nil)
    end
end

local function OnRewind40801()
end

local function OnRewind40804()
end


-- local method end

function Quest408:OnMainStart(quest)

end

function Quest408:OnSubStart(quest)
	local questID = quest.QuestId
	if questID == subIDs.q40807 then
        OnStart40807(quest)
    elseif questID == subIDs.q40805 then
        OnStart40805()
    elseif questID == subIDs.q40810 then
        OnStart40810()
    elseif questID == subIDs.q40801 then
        OnStart40801()
	end
end

function Quest408:OnSubFinished(quest)
    local questID = quest.QuestId
	if questID == subIDs.q40802 then
        OnFinished40802()
    elseif questID == subIDs.q40803 then
        OnFinished40803()
    elseif questID == subIDs.q40804 then
        OnFinished40804()
    elseif questID == subIDs.q40807 then
        OnFinished40807()
    elseif questID == subIDs.q40808 then
        OnFinished40808()
	end
end

-- Quest408.OnSubFailed(quest)
--     local questID = quest.QuestId
--     if questID == subIDs.q40802 then
--         OnFailed40802()
--     end
-- end

function Quest408:OnRewind(quest)
    local questID = quest.QuestId
	if questID == subIDs.q40801 then
        OnRewind40801()
    elseif questID == subIDs.q40804 then
        OnRewind40804()
	end
end

function Quest408:OnMainFinished(quest)
end

function Quest408:Start()
end

function Quest408:OnDestroy()
end

return Quest408