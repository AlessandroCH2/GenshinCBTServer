require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')
local Quest414 = class("Quest414", questActorProxy)
Quest414.defaultAlias = "Quest414"

local this = nil
local super = nil
local uActor = nil
local questID = 0


function Quest414:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end

function Quest414:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end



-- local config begin
--local q414Cfg = require('Actor/Quest/Q414/Q414Config')
local q414Cfg = require('Actor/Quest/Q414/Q414Config')
local subIDs = q414Cfg.SubIDs
local wendyData = q414Cfg.WendyData
local paimonData = q414Cfg.PaimonData

-- local config end

function Quest414:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

local function ActorCreat(actor)
	--actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, paimonData.bornPos, paimonData.bornDir, true, false)
	actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false)
--[[ 	globalActor:SpawnItem(q414Cfg.Poem1ID, sceneData:GetDummyPoint(3,"Q414Poem1").pos,nil,"Poem1")
    globalActor:SpawnItem(q414Cfg.Poem2ID, sceneData:GetDummyPoint(3,"Q414Poem2").pos,nil,"Poem2")
    globalActor:SpawnItem(q414Cfg.Poem3ID, sceneData:GetDummyPoint(3,"Q414Poem3").pos,nil,"Poem3") ]]
end

-- local param begin
-- local param end

-- local method begin
local function OnStart41400(quest)
	print("41400 start: Wendy Create Poem1 Create")
	this:ActionSafeCall(ActorCreat)
	--[[ actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, paimonData.bornPos, paimonData.bornDir, true, false)
	actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false)
 ]]--[[ 	globalActor:UnSpawn("Poem1")
	globalActor:SpawnItem(q414Cfg.Poem1ID, sceneData:GetDummyPoint(3,"Q414Poem1").pos,nil,"Poem1") ]]
end

local function OnFinished41400()
	print("41400 finish : Poem1 Create")
	globalActor:UnSpawn("Poem1")
	globalActor:UnSpawn("Poem2")
	globalActor:UnSpawn("Poem3")
	globalActor:SpawnItem(q414Cfg.Poem1ID, sceneData:GetDummyPoint(3,"Q414Poem1").pos,nil,"Poem1")
end

local function OnFinished41404()
	print("41404 finish : Poem2 Create")
	globalActor:UnSpawn("Poem2")
    globalActor:SpawnItem(q414Cfg.Poem2ID, sceneData:GetDummyPoint(3,"Q414Poem2").pos,nil,"Poem2")
end

local function OnFinished41408()
	print("41408 finish : Poem3 Create")
	globalActor:UnSpawn("Poem3")
    globalActor:SpawnItem(q414Cfg.Poem3ID, sceneData:GetDummyPoint(3,"Q414Poem3").pos,nil,"Poem3")
end

local function OnRewind41400(quest)
	print("OnRewind41400: Wendy Create")
	this:ActionSafeCall(ActorCreat)
	--[[ actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, paimonData.bornPos, paimonData.bornDir, true, false)
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false)
 ]]--[[ 	globalActor:UnSpawn("Poem1")
	globalActor:SpawnItem(q414Cfg.Poem1ID, sceneData:GetDummyPoint(3,"Q414Poem1").pos,nil,"Poem1") ]]
end

--[[ local function OnRewind41403()
    print("OnRewind41403: Wendy Create")
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false)
end ]]

local function OnRewind41404()
    print("OnRewind41404: Wendy Create")
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false)
--[[ 	globalActor:UnSpawn("Poem2")
    globalActor:SpawnItem(q414Cfg.Poem2ID, sceneData:GetDummyPoint(3,"Q414Poem2").pos,nil,"Poem2") ]]
end

--[[ local function OnRewind41407()
    print("OnRewind41407: Wendy Create")
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false)
end ]]

local function OnRewind41408()
    print("OnRewind41408: Wendy Create")
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false)
--[[ 	globalActor:UnSpawn("Poem3")
    globalActor:SpawnItem(q414Cfg.Poem3ID, sceneData:GetDummyPoint(3,"Q414Poem3").pos,nil,"Poem3") ]]
end

--[[ local function OnRewind41411()
    print("OnRewind41411: Wendy Create")
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false)
end]]

local function OnRewind41412()
    print("OnRewind41412: Wendy Create")
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true, false)
end 

-- local method end

function Quest414:OnMainStart(quest)  
end

function Quest414:OnSubStart(quest)
    local questID = quest.QuestId
	if questID == subIDs.q41400 then
		OnStart41400(quest)
--[[ 	elseif questID == subIDs.q41403 then
		OnStart41403()
	elseif questID == subIDs.q41407 then
        OnStart41407()
    elseif questID == subIDs.q41411 then
		OnStart41411() ]]
	end
end

function Quest414:OnSubFinished(quest)
    local questID = quest.QuestId
	if questID == subIDs.q41400 then
		OnFinished41400()
	elseif questID == subIDs.q41404 then
		OnFinished41404()
	elseif questID == subIDs.q41408 then
		OnFinished41408()
    end
end

function Quest414:OnRewind(quest)
    local questID = quest.QuestId
	if questID == subIDs.q41400 then
        OnRewind41400(quest)
	elseif questID == subIDs.q41404 then
		OnRewind41404()	
	elseif questID == subIDs.q41408 then
		OnRewind41408()
	elseif questID == subIDs.q41412 then
		OnRewind41412()	
	end
end

function Quest414:OnMainFinished(quest)
end

function Quest414:Start()
end

function Quest414:OnDestroy()
end

return Quest414