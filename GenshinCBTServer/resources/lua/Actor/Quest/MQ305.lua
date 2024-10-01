require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest305 = class("Quest305", questActorProxy)

Quest305.defaultAlias = "Quest305"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest305:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest305:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q305Cfg = require('Actor/Quest/Q305/Q305Config')
local subIDs = q305Cfg.SubIDs
local amborData = q305Cfg.AmborData
local wendyData = q305Cfg.WendyData
local lisaData = q305Cfg.LisaData
local gaiaData = q305Cfg.GaiaData
local qinData = q305Cfg.QinData
local blackData = q305Cfg.BlackData

-- local config end

function Quest305:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

-- local param begin
-- local param end

-- local method begin
local function AllMoveKnight(actor)
	actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.KnightPos, amborData.KnightDir, true, false)
    actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.KnightPos, wendyData.KnightDir, true, false)
	actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.KnightPos, gaiaData.KnightDir, true, false)
	actorMgr:CreateActorWithPos(lisaData.Lisa, lisaData.LisaScript, lisaData.LisaID, 0, lisaData.KnightPos, lisaData.KnightDir, true, false)
end

local function OnStart30502()
    -- actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.StartPos, amborData.StartDir, true, false)
    local wendy = actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.RoofPos, wendyData.RoofDir, true, false)
	wendy:DoFreeStyle(3)
	this:SpawnMonster(blackData.MonsterID, 1, blackData.Black1Pos, nil, nil, nil, "Black1")
    this:SpawnMonster(blackData.MonsterID, 1, blackData.Black2Pos, nil, nil, nil, "Black2")
end

local function OnStart30503()
	local wendy = actorMgr:GetActor(wendyData.Wendy)
	wendy:Standby()
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.RoofPos, amborData.RoofDir, true, false)
end

local function OnStart30504()
	local gaia = actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.RoofShowPos, gaiaData.RoofShowDir, true, false)
	gaia:ClearFollowTask()
	gaia:WalkToTask(gaiaData.RoofTalkPos, 
		function(gaia, task)
			local quest = actorMgr:GetActor(q305Cfg.ActorAlias)
			if quest ~= nil then
				quest:FinishQuest(false, nil)
			end
			gaia:TurnTo(M.Euler2DirXZ(gaiaData.RoofTalkDir))
			gaia:Standby()
		end
	)
end

local function OnStart30506(quest)
	this:ActionSafeCall(AllMoveKnight)
end

local function OnRewind30501()
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.StartPos, amborData.StartDir, true, false)
end

local function OnRewind30502()
	-- local wendy = actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.RoofPos, wendyData.RoofDir, true, false)
	-- wendy:DoFreeStyle(3)
	-- this:UnSpawn("Black1")
	-- this:SpawnMonster(blackData.MonsterID, 1, blackData.Black1Pos)
	-- this:UnSpawn("Black2")
    -- this:SpawnMonster(blackData.MonsterID, 1, blackData.Black2Pos)
end

local function OnRewind30505()
end

local function OnRewind30507()
end

-- local method end


function Quest305:OnMainStart(quest)

end

function Quest305:OnSubStart(quest)
	local questID = quest.QuestId
	if questID == subIDs.q30502 then
		OnStart30502()
	elseif questID == subIDs.q30503 then
		OnStart30503()
	elseif questID == subIDs.q30504 then
		OnStart30504()
	elseif questID == subIDs.q30506 then
        OnStart30506(quest)
	end
end

function Quest305:OnSubFinished(quest)
end

function Quest305:OnRewind(quest)
	local questID = quest.QuestId
	if questID == subIDs.q30502 then
		OnRewind30502()
	elseif questID == subIDs.q30501 then
		OnRewind30501()
	end
end

function Quest305:OnMainFinished(quest)
end

function Quest305:Start()
end

function Quest305:OnDestroy()
end

return Quest305