require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')
local Quest403 = class("Quest403", questActorProxy)
Quest403.defaultAlias = "Quest403"

local this = nil
local super = nil
local uActor = nil
local questID = 0
local gotKey = false

function Quest403:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest403:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q403Cfg = require('Actor/Quest/Q403/Q403Config')
local subIDs = q403Cfg.SubIDs

-- local config end

function Quest403:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

function Quest403:CountDown()
    print("CountDown Finished")
    if gotKey == false then
        globalActor:UnSpawn("Key")
        local quest = actorMgr:GetActor(q403Cfg.ActorAlias)
        if quest ~= nil then
            print("isFinished == false")
            quest:FinishQuest(true, nil)
        end
    end
end

-- local param begin
-- local param end

-- local method begin
local function StartCount(actor)
    this:CountDownUIStart(q403Cfg.MatchTime, 10)
    this:CallDelay(q403Cfg.MatchTime+1,this.CountDown)
end

local function OnStart40302(quest)
    print("40302 start: Spawn Key")
    gotKey = false
    globalActor:SpawnItem(q403Cfg.KeyID, q403Cfg.KeyPos,nil,"Key")
    this:ActionSafeCall(StartCount)

    --actorMgr:CreateActorWithPos("test ball", "Actor/Gadget/CoinTest", 70300003, 0, q403Cfg.KeyPos, q403Cfg.KeyPos, false, false)
end

local function OnFinished40302()
    print("40302 finish: get the key")
    gotKey = true
    this:CountDownUITerminate()
end

local function OnStart40305()
    print("40305 start: fail the task")
    local quest = actorMgr:GetActor(q403Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(true, nil)
    end
end

-- local method end

function Quest403:OnMainStart(quest)

end

function Quest403:OnSubStart(quest)
	local questID = quest.QuestId
	if questID == subIDs.q40302 then
        OnStart40302(quest)
    elseif questID == subIDs.q40305 then
        OnStart40305()
	end
end

function Quest403:OnSubFinished(quest)
    local questID = quest.QuestId
	if questID == subIDs.q40302 then
        OnFinished40302()
	end

end

function Quest403:OnMainFinished(quest)
end

function Quest403:Start()
end

function Quest403:OnDestroy()
end

return Quest403