require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest505 = class("Quest505", questActorProxy)

Quest505.defaultAlias = "Quest505"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest505:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest505:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q505Cfg = require('Actor/Quest/Q505/Q505Config')
local subIDs = q505Cfg.SubIDs
local wendyData = q505Cfg.WendyData
local qinData = q505Cfg.QinData
local dilucData = q505Cfg.DilucData

-- local config end

function Quest505:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

-- local param begin
-- local param end

-- local method begin

local function OnStart50501()
  print("50505 finish: Seal2 Create")
	-- globalActor:SpawnItem(q505Cfg.SealID, q505Cfg.SealPos, 0, "Seal2")
	actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)
	actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)
	actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true)
end

function PaimonDisappear()
	local paimon = actorMgr:GetActor("Paimon")
	if paimon ~= nil then
	print("paimengdis")
	paimon:DestroyWithDisappear(false)
	end
end

local function OnFinished50501()
	print("50501 finish: Dungeon Open")
	this:ActionSafeCall(PaimonDisappear)
	
	-- local qin = actorMgr:GetActor(qinData.Qin)
	-- local diluc = actorMgr:GetActor(dilucData.Diluc)
	-- local wendy = actorMgr:GetActor(wendyData.Wendy)

	-- if qin ~= nil then
	-- 	qin:Destroy(false)
  -- end

	-- if diluc ~= nil then
	-- 	diluc:Destroy(false)
	-- end

	-- if wendy ~= nil then
	-- 	wendy:Destroy(false)
	-- end

  -- globalActor:UnSpawn("Seal2")
end


-- local method end

function Quest505:OnMainStart(quest)
end

function Quest505:OnSubStart(quest)
  local questID = quest.QuestId
	  if questID == subIDs.q50501 then
	OnStart50501()
  end
end

function Quest505:OnSubFinished(quest)
    local questID = quest.QuestId
	if questID == subIDs.q50501 then
		OnFinished50501()
    end
end

function Quest505:OnRewind(quest)
end

function Quest505:OnMainFinished(quest)
end

function Quest505:Start()
end

function Quest505:OnDestroy()
end

return Quest505
