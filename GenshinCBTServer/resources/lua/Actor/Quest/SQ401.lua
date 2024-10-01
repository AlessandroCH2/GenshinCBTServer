require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest401 = class("Quest401", questActorProxy)

Quest401.defaultAlias = "Quest401"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest401:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest401:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q401Cfg = require('Actor/Quest/Q401/Q401Config')
local treasurePos = q401Cfg.TreasurePos
local folk1Data = q401Cfg.Folk1Data
local monsterData = q401Cfg.MonsterData
local subIDs = q401Cfg.SubIDs

-- local config end

function Quest401:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

-- local param begin
-- local param end

-- local method begin

local function OnStart40102()
	print("40101 start: Spawn Monsters & Item")
	globalActor:UnSpawn("Treasure")
	globalActor:SpawnItem(q401Cfg.TreasureID, treasurePos,nil,"Treasure")
	for i=1, #monsterData.MonsterIDs do
		local monsterID = monsterData.MonsterIDs[i]
		local xRand = math.random(-5, 5)
		local zRand = math.random(-5, 5)
		local bornPos = { x = treasurePos.x, y = treasurePos.y, z = treasurePos.z }
		bornPos.x = bornPos.x + xRand;
		bornPos.z = bornPos.z + zRand;
		this:SpawnMonster(monsterID, 1, bornPos)
	end
end

local function OnStart40104()
	print("Folk1 walk to home")
	local folk1 = actorMgr:GetActor(folk1Data.Folk1)
	--folk1.extrasIndex = 1
	folk1:MoveHome()
end

local function OnStart40106()
	print("Spawn Boss")
	this:SpawnMonster(q401Cfg.MonsterData.BossID, 1, sceneData:GetDummyPoint(3,"Q301Folk1Home").pos,nil,q401Cfg.MonsterData.BossDropID)
	local folk1 = actorMgr:GetActor(folk1Data.Folk1)
	--folk1.extrasIndex = 1
	folk1:SetPos(sceneData:GetDummyPoint(3,"Q301Hidden").pos)
end

local function OnFinish40106()

end

-- local method end

function Quest401:OnMainStart(quest)
	--print("main start 401 " .. tostring(quest.QuestMainId))
end

function Quest401:OnSubStart(quest)
	--print("sub start 401 " .. tostring(quest.QuestId))
	local questID = quest.QuestId
	if questID == subIDs.q40102 then
		OnStart40102()
	elseif questID == subIDs.q40104 then
		OnStart40104()
	elseif questID == subIDs.q40106 then
		OnStart40106()
	end
end

function Quest401:OnSubFinished(quest)
	--print("sub finished 31 " .. tostring(quest.QuestId))
	local questID = quest.QuestId
	if questID == subIDs.q40106 then
		OnFinish40106()
	end
end

function Quest401:OnMainFinished(quest)
	--print("main finished 401 " .. tostring(quest.QuestMainId))
	-- print("Spawn Note")
	-- globalActor:SpawnItem(100005, sceneData:GetDummyPoint(3,"Q301Folk1Home").pos)
end

function Quest401:Start()
	--print("here 401 quest start")
end

function Quest401:OnDestroy()
end

return Quest401