require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')
local Quest413 = class("Quest413", questActorProxy)
Quest413.defaultAlias = "Quest413"

local this = nil
local super = nil
local uActor = nil
local questID = 0


function Quest413:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end

function Quest413:OnPostInit()
	uActor = self.uActor
    super:OnPostInit()   
end



-- local config begin
local q413Cfg = require('Actor/Quest/Q413/Q413Config')
local subIDs = q413Cfg.SubIDs
local lisaData = q413Cfg.LisaData
local barbaraData = q413Cfg.BarbaraData
local pastorData = q413Cfg.PastorData
local paimonData = q413Cfg.PaimonData
local soldierData = q413Cfg.SoldierData
local captainData = q413Cfg.CaptainData

-- local config end

function Quest413:CreateUActor(alias)    
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end


-- local param begin
-- local param end

-- local method begin
local function OnStart41301()
    globalActor:SpawnItem(q413Cfg.ItemPoisonID, sceneData:GetDummyPoint(3,"Q413Poison").pos,nil,"Poison")
end

local function OnFinished41301()
    local paimonPos = actorUtils.GetAvatarPos()
    paimonPos.z = paimonPos.z+1
    local paimonRot = {x=0,y=0,z=-1}
    local paimon = actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, paimonPos, M.Dir2Euler(paimonRot), true, false)
    paimon:NarratorTask(q413Cfg.NarratorFlow1, -1, 30, paimon.Vanish)
end

local function OnStart41304()
	local barbara = actorMgr:CreateActorWithPos(barbaraData.Barbara, barbaraData.BarbaraScript, barbaraData.BarbaraID, 0, barbaraData.bornPos, barbaraData.bornDir, true, false)
	barbara:StartBeFollow()
end

local function OnStart41306()
	local pastor = actorMgr:CreateActorWithPos(pastorData.Pastor, pastorData.PastorScript, pastorData.PastorID, 0, pastorData.bornPos, pastorData.bornDir, true, false)
	pastor:Show()
end

local function OnFinished41307()
	-- local pastor = actorMgr:CreateActorWithPos(pastorData.Pastor, pastorData.PastorScript, pastorData.PastorID, 0, pastorData.showPos, pastorData.showDir, true, false)
	local pastor = actorMgr:GetActor(pastorData.Pastor)
	pastor:Vanish()
end

local function OnStart41309()
	-- local barbara = actorMgr:CreateActorWithPos(barbaraData.Barbara, barbaraData.BarbaraScript, barbaraData.BarbaraID, 0, barbaraData.hidePos, barbaraData.hideDir, true, false)
	local barbara = actorMgr:GetActor(barbaraData.Barbara)
	barbara:Vanish()
end

local function OnStart41310()
	for i=1, #soldierData.SoldierIDs do
		local soldier = actorMgr:CreateActorWithPos(soldierData.Soldier .. tostring(soldierData.SoldierIDs[i]), soldierData.SoldierScript, soldierData.SoldierIDs[i], i, soldierData.SoldierPos[i], soldierData.SoldierDir[i], true, false, 20006)
	end
	local captain = actorMgr:CreateActorWithPos(captainData.Captain, captainData.CaptainScript, captainData.CaptainID, 0, captainData.CaptainPos, captainData.CaptainDir, true, false, 20006)
end

local function OnStart41312()
	local barbara = actorMgr:CreateActorWithPos(barbaraData.Barbara, barbaraData.BarbaraScript, barbaraData.BarbaraID, 0, barbaraData.livePos, barbaraData.liveDir, true, false, 20006)
	barbara:CallDelay(1, barbara.StartLive)
	barbara:CallDelay(10, barbara.FinishLive)
end

local function OnFinished41313()
	local barbara = actorMgr:GetActor(barbaraData.Barbara)
	barbara:VanishDungeon()
	-- local barbara = actorMgr:CreateActorWithPos(barbaraData.Barbara, barbaraData.BarbaraScript, barbaraData.BarbaraID, 0, barbaraData.bornPos, barbaraData.bornDir, true, false)
	-- barbara:NarratorTask(q413Cfg.NarratorFlow2, -1, -1, nil)
end

local function OnStart41315()
	local barbara = actorMgr:CreateActorWithPos(barbaraData.Barbara, barbaraData.BarbaraScript, barbaraData.BarbaraID, 0, barbaraData.bornPos, barbaraData.bornDir, true, false)
end


-- local method end

function Quest413:OnMainStart(quest)  
end

function Quest413:OnSubStart(quest)
    local questID = quest.QuestId
	if questID == subIDs.q41301 then
		OnStart41301()
	elseif questID == subIDs.q41304 then
		OnStart41304()
	elseif questID == subIDs.q41306 then
		OnStart41306()
	elseif questID == subIDs.q41309 then
		OnStart41309()
	elseif questID == subIDs.q41310 then
		OnStart41310()
	elseif questID == subIDs.q41312 then
		OnStart41312()
	elseif questID == subIDs.q41315 then
		OnStart41315()
	end
end

function Quest413:OnSubFinished(quest)
    local questID = quest.QuestId
	if questID == subIDs.q41307 then
		OnFinished41307()
	elseif questID == subIDs.q41301 then
		OnFinished41301()
	elseif questID == subIDs.q41313 then
		OnFinished41313()
    end
end

function Quest413:OnRewind(quest)
    -- local questID = quest.QuestId
	-- if questID == subIDs.q41308 then
    --     OnRewind41308()
    -- elseif questID == subIDs.q41314 then
    --     OnRewind41314()
    -- elseif questID == subIDs.q41315 then
    --     OnRewind41315()
    -- elseif questID == subIDs.q41316 then
	-- 	OnRewind41316()
    -- end
end

function Quest413:OnMainFinished(quest)
end

function Quest413:Start()
end

function Quest413:OnDestroy()
end

return Quest413