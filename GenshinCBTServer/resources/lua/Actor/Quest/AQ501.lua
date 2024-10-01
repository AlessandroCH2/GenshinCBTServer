require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest501 = class("Quest501", questActorProxy)

Quest501.defaultAlias = "Quest501"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest501:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest501:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q501Cfg = require('Actor/Quest/Q501/Q501Config')
local subIDs = q501Cfg.SubIDs
local clueID = q501Cfg.ClueID
local cluePos1 = q501Cfg.CluePos1
local cluePos2 = q501Cfg.CluePos2
local cluePos3 = q501Cfg.CluePos3
local sealPos = q501Cfg.SealPos
local clueGadgetID = q501Cfg.ClueGadgetID

local q504Cfg = require('Actor/Quest/Q504/Q504Config')
local wendyData = q504Cfg.WendyData
local qinData = q504Cfg.QinData
local dilucData = q504Cfg.DilucData

-- local config end

function Quest501:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

function Quest501:ClueaNarrtor()
	local q50101state = this:GetSubQuestState(50101)
	local q50102state = this:GetSubQuestState(50102)
	local q50103state = this:GetSubQuestState(50103)
	local q501state = q50101state + q50102state + q50103state

	if q501state == 7 then
		return this:NarratorOnlyTask(q501Cfg.NarratorData.Storyclue1)
	elseif q501state == 8 then
		return this:NarratorOnlyTask(q501Cfg.NarratorData.Storyclue2)
	-- elseif q501state == 9 then
	-- 	return this:NarratorOnlyTask(q501Cfg.NarratorData.Storyclue3)
	end
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers
local function OnStart50101()
  print("50101 start: Clue1 Create")
	--globalActor:SpawnItem(q501Cfg.Clue1ID, q501Cfg.CluePos1, 0, "q501Clue1")
end

local function OnStart50102()
	print("50102 start: Clue2 Create")
	--globalActor:SpawnItem(q501Cfg.Clue2ID, q501Cfg.CluePos2, 0, "q501Clue2")
end

local function OnStart50103()
	print("50103 start: Clue3 Create")
	--globalActor:SpawnItem(q501Cfg.Clue3ID, q501Cfg.CluePos3, 0, "q501Clue3")
end

local function OnStart50104()
	print("50104 Start:......")
end

local function OnStart50105()
	print("50105 Start: Finish Quest & Play CutScene 1")
	this:PlayCutscene(q501Cfg.SealAppearTimeCfg,this:NarratorOnlyTask(q501Cfg.NarratorData.Storyclue3))
	local quest = actorMgr:GetActor(q501Cfg.ActorAlias)
	if quest ~= nil then
	  quest:FinishQuest(false, nil)
	end
end

local function OnStart50106()
	print("50106 Start: Finish Quest & Play CutScene2")
	this:PlayCutscene(q501Cfg.SealOpenTimeCfg,
	function (this)
		local quest = actorMgr:GetActor(q501Cfg.ActorAlias)
		if quest ~= nil then
			quest:FinishQuest(false, nil)
		end
	end
  )
end
--@endregion

--@region sub finish handlers
local function OnFinished50101()
	print("50101 finish: Clue1 UnSpawn")
	--globalActor:UnSpawn("q501Clue1")
	this:ClueNarrator()
end

local function OnFinished50102()
	print("50102 finish: Clue2 UnSpawn")
	--globalActor:UnSpawn("q501Clue2")
	this:ClueNarrator()
end

local function OnFinished50103()
	print("50103 finish: Clue3 UnSpawn")
	--globalActor:UnSpawn("q501Clue3")
	this:ClueNarrator()
end

local function OnFinished50104()
	print("50104 finish:......")
end

local function OnFinished50105()
	print("50105 finish:......")
	-- this:PlayCutscene(q501Cfg.SealAppearTimeCfg)
end

local function OnFinished50106()
	print("50106 finish:......")
end
--@endregion

--@region sub rewind handlers
local function OnRewind50104()
	print("50104 rewind: Creat NPC")
  actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)
  actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)
  actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true)
end

local function OnRewind50105()
	print("50105 rewind: Creat NPC")
	actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)
	actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)
	actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true)
end

local function OnRewind50106()
	print("50106 rewind: Creat NPC")
	actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)
	actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)
	actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true)
end
--@endregion
-- local method end

function Quest501:OnMainStart(quest)
end

function Quest501:OnSubStart(quest)
    local questID = quest.QuestId
	if questID == subIDs.q50101 then
		OnStart50101()
 	elseif questID == subIDs.q50102 then
		OnStart50102()
	elseif questID == subIDs.q50103 then
    OnStart50103()
	elseif questID == subIDs.q50104 then
		OnStart50104()
	elseif questID == subIDs.q50105 then
		OnStart50105()
	elseif questID == subIDs.q50106 then
		OnStart50106()
	end
end

function Quest501:OnSubFinished(quest)
    local questID = quest.QuestId
	if questID == subIDs.q50101 then
		OnFinished50101()
	elseif questID == subIDs.q50102 then
		OnFinished50102()
	elseif questID == subIDs.q50103 then
		OnFinished50103()
	elseif questID == subIDs.q50104 then
		OnFinished50104()
	elseif questID == subIDs.q50105 then
		OnFinished50105()
	elseif questID == subIDs.q50106 then
		OnFinished50106()
    end
end

function Quest501:OnRewind(quest)
	local questID = quest.QuestId
	if questID == subIDs.q50104 then
		OnRewind50104()
	elseif questID == subIDs.q50105 then
		OnRewind50105()
	elseif questID == subIDs.q50106 then
		OnRewind50106()
	end
end

function Quest501:OnMainFinished(quest)
	print("50104 finish: Seal Opened")
end

function Quest501:Start()
end

function Quest501:OnDestroy()
end

return Quest501
