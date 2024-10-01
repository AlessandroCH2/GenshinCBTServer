require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest502 = class("Quest502", questActorProxy)

Quest502.defaultAlias = "Quest502"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest502:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest502:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q502Cfg = require('Actor/Quest/Q502/Q502Config')
local subIDs = q502Cfg.SubIDs
local clueID = q502Cfg.ClueID
local cluePos1 = q502Cfg.CluePos1
local cluePos2 = q502Cfg.CluePos2
local cluePos3 = q502Cfg.CluePos3
local sealPos = q502Cfg.SealPos
local clueGadgetID = q502Cfg.ClueGadgetID

local q504Cfg = require('Actor/Quest/Q504/Q504Config')
local wendyData = q504Cfg.WendyData
local qinData = q504Cfg.QinData
local dilucData = q504Cfg.DilucData
-- local config end

function Quest502:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers
local function OnStart50201()
  print("50201 start: Clue1 Create")
	globalActor:SpawnItem(q502Cfg.Clue1ID, q502Cfg.CluePos1, 0, "q502Clue1")
end

local function OnStart50202()
	print("50202 start: Clue2 Create")
	globalActor:SpawnItem(q502Cfg.Clue2ID, q502Cfg.CluePos2, 0, "q502Clue2")
end

local function OnStart50203()
	print("50203 start: Clue3 Create")
	globalActor:SpawnItem(q502Cfg.Clue3ID, q502Cfg.CluePos3, 0, "q502Clue3")
end

local function OnStart50204()
	print("50204 Start:......")
end

local function OnStart50205()
	print("50205 Start: Finish Quest & Play CutScene 1")
	this:PlayCutscene(q502Cfg.SealAppearTimeCfg)
	local quest = actorMgr:GetActor(q502Cfg.ActorAlias)
	if quest ~= nil then
	  quest:FinishQuest(false, nil)
  end
end

local function OnStart50206()
	print("50206 Start: Finish Quest & Play CutScene2")
	this:PlayCutscene(q502Cfg.SealOpenTimeCfg, 
	function (this)
		local quest = actorMgr:GetActor(q502Cfg.ActorAlias)
		if quest ~= nil then
			quest:FinishQuest(false, nil)
		end
	end
  )
end
--@endregion

--@region sub finish handlers
local function OnFinished50201()
	print("50201 finish: Clue1 UnSpawn")
	globalActor:UnSpawn("q502Clue1")
end

local function OnFinished50202()
	print("50202 finish: Clue2 UnSpawn")
	globalActor:UnSpawn("q502Clue2")
end

local function OnFinished50203()
	print("50203 finish: Clue3 UnSpawn")
	globalActor:UnSpawn("q502Clue3")
end

local function OnFinished50204()
	print("50204 finish: Play CutScene2")
	-- this:PlayCutscene(q502Cfg.SealOpenTimeCfg)
end

local function OnFinished50205()
	print("50205 finish: Play CutScene1")
	-- this:PlayCutscene(q502Cfg.SealAppearTimeCfg)
end

local function OnFinished50206()
	print("50206 finish:......")
end
--@endregion

--@region sub rewind handlers
local function OnRewind50204()
	print("50204 rewind: Creat NPC")
  actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)
  actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)
  actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true)
end

local function OnRewind50205()
	print("50205 rewind: Creat NPC")
	actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)
	actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)
	actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true)
end

local function OnRewind50206()
	print("50206 rewind: Creat NPC")
	actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)
	actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)
	actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true)
end
--@endregion
-- local method end

function Quest502:OnMainStart(quest)
end

function Quest502:OnSubStart(quest)
    local questID = quest.QuestId
	if questID == subIDs.q50201 then
		OnStart50201()
 	elseif questID == subIDs.q50202 then
		OnStart50202()
	elseif questID == subIDs.q50203 then
    OnStart50203()
	elseif questID == subIDs.q50204 then
		OnStart50204()
	elseif questID == subIDs.q50205 then
		OnStart50205()
	elseif questID == subIDs.q50206 then
		OnStart50206()
	end
end

function Quest502:OnSubFinished(quest)
    local questID = quest.QuestId
	if questID == subIDs.q50201 then
		OnFinished50201()
	elseif questID == subIDs.q50202 then
		OnFinished50202()
	elseif questID == subIDs.q50203 then
		OnFinished50203()
	elseif questID == subIDs.q50204 then
		OnFinished50204()
	elseif questID == subIDs.q50205 then
		OnFinished50205()
	elseif questID == subIDs.q50206 then
		OnFinished50206()
    end
end

function Quest502:OnRewind(quest)
	local questID = quest.QuestId
	if questID == subIDs.q50204 then
		OnRewind50204()
	elseif questID == subIDs.q50205 then
		OnRewind50205()
	elseif questID == subIDs.q50206 then
		OnRewind50206()
	end
end

function Quest502:OnMainFinished(quest)
	print("50204 finish: Seal Opened")
end

function Quest502:Start()
end

function Quest502:OnDestroy()
end

return Quest502
