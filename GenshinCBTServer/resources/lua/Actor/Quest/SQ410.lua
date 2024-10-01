require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')
local Quest410 = class("Quest410", questActorProxy)
Quest410.defaultAlias = "Quest410"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest410:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest410:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q410Cfg = require('Actor/Quest/Q410/Q410Config')
local QiuqiuData = q410Cfg.QiuqiuData
local SoldierData = q410Cfg.SoldierData
local subIDs = q410Cfg.SubIDs

-- local config end

function Quest410:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

-- local param begin
-- local param end

-- local method begin
local function QiuqiuToSoldier(actor)
    local Qiuqiu = actorMgr:GetActor(QiuqiuData.Qiuqiu)
    if Qiuqiu ~= nil then
        Qiuqiu:Destroy(false)
    end
    actorMgr:CreateActorWithPos(SoldierData.Soldier, SoldierData.SoldierScript, SoldierData.SoldierID, 0, QiuqiuData.QiuqiuPos, QiuqiuData.QiuqiuDir, true, false)
end

local function OnStart41001()
	print("41001 start: Spawn QQ")
    local Qiuqiu = actorMgr:CreateActorWithPos(QiuqiuData.Qiuqiu, QiuqiuData.QiuqiuScript, QiuqiuData.QiuqiuID, 0, QiuqiuData.QiuqiuPos, QiuqiuData.QiuqiuDir, true, false)
    Qiuqiu:DoFreeStyle(1)
end

local function OnStart41002()
	print("41002 start: Spawn Medicine")
	globalActor:UnSpawn("Medicine")
    globalActor:SpawnItem(q410Cfg.MedicineID, q410Cfg.MedicinePos, nil, "Medicine")
end

local function OnStart41004(quest)
	print("41004 start: Change to Soldier")
    this:ActionSafeCall(QiuqiuToSoldier)
end


-- local method end

function Quest410:OnMainStart(quest)
	--print("main start 410 " .. tostring(quest.QuestMainId))
end

function Quest410:OnSubStart(quest)
	--print("sub start 410 " .. tostring(quest.QuestId))
	local questID = quest.QuestId
	if questID == subIDs.q41001 then
		OnStart41001()
	elseif questID == subIDs.q41002 then
		OnStart41002()
	elseif questID == subIDs.q41004 then
		OnStart41004(quest)
	end
end

function Quest410:OnSubFinished(quest)

end

function Quest410:OnMainFinished(quest)
    print("410 main finish: Soldier Escape")
	local Soldier = actorMgr:GetActor(SoldierData.Soldier)
    if Soldier ~= nil then
    	Soldier:RunToTask(SoldierData.RunPos, 
		function(self, task)
			self:Destroy(false)
        end
        )
    end
end

function Quest410:Start()
	--print("here 410 quest start")
end

function Quest410:OnDestroy()
end

return Quest410