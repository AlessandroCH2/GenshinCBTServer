require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest503 = class("Quest503", questActorProxy)

Quest503.defaultAlias = "Quest503"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest503:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest503:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q503Cfg = require('Actor/Quest/Q503/Q503Config')
local subIDs = q503Cfg.SubIDs
local clueID = q503Cfg.ClueID
local cluePos1 = q503Cfg.CluePos1
local cluePos2 = q503Cfg.CluePos2
local cluePos3 = q503Cfg.CluePos3
local sealPos = q503Cfg.SealPos
local clueGadgetID = q503Cfg.ClueGadgetID

local q504Cfg = require('Actor/Quest/Q504/Q504Config')
local wendyData = q504Cfg.WendyData
local qinData = q504Cfg.QinData
local dilucData = q504Cfg.DilucData

-- local config end

function Quest503:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

-- local param begin
-- local param end

-- local method begin
--@region sub start handlers
local function OnStart50301()
  print("50301 start: Clue7 Create")
	globalActor:SpawnItem(q503Cfg.Clue1ID, q503Cfg.CluePos1, 0, "q503Clue1")
end

local function OnStart50302()
	print("50302 start: Clue8 Create")
	globalActor:SpawnItem(q503Cfg.Clue2ID, q503Cfg.CluePos2, 0, "q503Clue2")
end

local function OnStart50303()
	print("50303 start: Clue9 Create")
	globalActor:SpawnItem(q503Cfg.Clue3ID, q503Cfg.CluePos3, 0, "q503Clue3")

end

local function OnStart50304()
	print("50304 start:......")
end

local function OnStart50305()
	print("50305 start: Finish Quest")
	local quest = actorMgr:GetActor(q503Cfg.ActorAlias)
	if quest ~= nil then
	  quest:FinishQuest(false, nil)
  end
end

local function OnStart50306()
	print("50306 Start: Finish Quest & Play CutScene2")
	this:PlayCutscene(q5032Cfg.SealOpenTimeCfg, 
	function (this)
		local quest = actorMgr:GetActor(q503Cfg.ActorAlias)
		if quest ~= nil then
			quest:FinishQuest(false, nil)
		end
	end
  )
end
--@endregion

--@region sub finish handlers
local function OnFinished50301()
	print("50301 finish: Clue1 UnSpawn")
	globalActor:UnSpawn("q503Clue1")
end

local function OnFinished50302()
	print("50302 finish: Clue2 UnSpawn")
	globalActor:UnSpawn("q503Clue2")
end

local function OnFinished50303()
	print("50303 finish: Clue3 UnSpawn")
	globalActor:UnSpawn("q503Clue3")
end

local function OnFinished50304()
	print("50304 finish: Play Cutscene 2")
	-- this:PlayCutscene(q503Cfg.SealOpenTimeCfg)
end

local function OnFinished50305()
	print("50305 Start: Finish Quest & Play CutScene 1")
	this:PlayCutscene(q503Cfg.SealAppearTimeCfg)
	local quest = actorMgr:GetActor(q503Cfg.ActorAlias)
	if quest ~= nil then
	  quest:FinishQuest(false, nil)
  end
end

local function OnFinished50306()
	print("50306 finish:......")
end
--@endregion

--@region sub rewind handlers
local function OnRewind50304()
	print("50304 rewind: Creat NPC")
  actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)
  actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)
  actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true)
end

local function OnRewind50305()
	print("50305 rewind: Creat NPC")
	actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)
	actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)
	actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true)
end

local function OnRewind50306()
	print("50305 rewind: Creat NPC")
	actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)
	actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)
	actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true)
end
--@endregion
-- local method end

function Quest503:OnMainStart(quest)
end

function Quest503:OnSubStart(quest)
    local questID = quest.QuestId
	if questID == subIDs.q50301 then
		OnStart50301()
 	elseif questID == subIDs.q50302 then
		OnStart50302()
	elseif questID == subIDs.q50303 then
    OnStart50303()
	elseif questID == subIDs.q50304 then
		OnStart50304()
	elseif questID == subIDs.q50305 then
		OnStart50305()
	elseif questID == subIDs.q50306 then
		OnStart50306()
	end
end

function Quest503:OnSubFinished(quest)
    local questID = quest.QuestId
	if questID == subIDs.q50301 then
		OnFinished50301()
	elseif questID == subIDs.q50302 then
		OnFinished50302()
	elseif questID == subIDs.q50303 then
		OnFinished50303()
	elseif questID == subIDs.q50304 then
		OnFinished50304()
	elseif questID == subIDs.q50305 then
		OnFinished50305()
	elseif questID == subIDs.q50306 then
		OnFinished50306()
    end
end

function Quest503:OnRewind(quest)
	local questID = quest.QuestId
	if questID == subIDs.q50304 then
		OnRewind50304()
	elseif questID == subIDs.q50305 then
		OnRewind50305()
	elseif questID == subIDs.q50306 then
		OnRewind50306()
	end
end

function Quest503:OnMainFinished(quest)
	print("50304 finish: Seal Opened")
end

function Quest503:Start()
end

function Quest503:OnDestroy()
end

return Quest503
