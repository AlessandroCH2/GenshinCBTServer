require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')
local Quest402 = class("Quest402", questActorProxy)
Quest402.defaultAlias = "Quest402"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest402:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest402:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q402Cfg = require('Actor/Quest/Q402/Q402Config')
local monsterData = q402Cfg.MonsterData
local subIDs = q402Cfg.SubIDs

-- local config end

function Quest402:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

-- local param begin
-- local param end

-- local method begin

local function OnStart40202()
	print("40202 start: Spawn Monsters & Hostage")
	actorMgr:CreateActorWithPos(q402Cfg.Hostage.Hostage, q402Cfg.Hostage.HostageScript, q402Cfg.Hostage.HostageID, 0, q402Cfg.HostagePos, q402Cfg.HostageDir, true)
	for i=1, #monsterData.MonsterIDs do
		local monsterID = monsterData.MonsterIDs[i]
		local xRand = math.random(-5, 5)
		local zRand = math.random(-5, 5)
		local bornPos = { x = q402Cfg.HostagePos.x, y = q402Cfg.HostagePos.y, z = q402Cfg.HostagePos.z }
		bornPos.x = bornPos.x + xRand;
		bornPos.z = bornPos.z + zRand;
		this:SpawnMonster(monsterID, 1, bornPos)
	end
end

local function OnStart40203()
    print("40203 start: Hostage Rescue")
	local hostage = actorMgr:GetActor(q402Cfg.Hostage.Hostage)
	hostage:DoFreeStyle(3)
end

local function OnStart40204()
	print("40204 start: Spawn Key")
	globalActor:UnSpawn("Key")
    globalActor:SpawnItem(q402Cfg.KeyID, q402Cfg.KeyPos,nil,"Key")
    local hostage = actorMgr:GetActor(q402Cfg.Hostage.Hostage)
	hostage:DoFreeStyle(1)
end


-- local method end

function Quest402:OnMainStart(quest)
	--print("main start 402 " .. tostring(quest.QuestMainId))
end

function Quest402:OnSubStart(quest)
	--print("sub start 402 " .. tostring(quest.QuestId))
	local questID = quest.QuestId
	if questID == subIDs.q40202 then
		OnStart40202()
	elseif questID == subIDs.q40203 then
		OnStart40203()
	elseif questID == subIDs.q40204 then
		OnStart40204()
	end
end

function Quest402:OnSubFinished(quest)

end

function Quest402:OnMainFinished(quest)
    print("402 main finish: Hostage Escape")
	local hostage = actorMgr:GetActor(q402Cfg.Hostage.Hostage)
	hostage:Escape()
end

function Quest402:Start()
	--print("here 402 quest start")
end

function Quest402:OnDestroy()
end

return Quest402