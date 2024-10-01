require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest303 = class("Quest303", questActorProxy)

Quest303.defaultAlias = "Quest303"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest303:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest303:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q303Cfg = require('Actor/Quest/Q303/Q303Config')
local subIDs = q303Cfg.SubIDs
-- local config end

function Quest303:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

-- local param begin
-- local param end

-- local method begin

--[[ local function OnFinished30301()
    print("Goddess unlock timeline")
	this:PlayCutscene(q303Cfg.TestTimeCfg)
end ]]
-- local method end

function Quest303:OnMainStart(quest)
	--print("main start 303 " .. tostring(quest.QuestMainId))
end

function Quest303:OnSubStart(quest)
end

function Quest303:OnSubFinished(quest)
--[[ 	print("sub start 303 " .. tostring(quest.QuestId))
	local questID = quest.QuestId
	if questID == subIDs.q30301 then
		OnFinished30301()
	end ]]
end

function Quest303:OnMainFinished(quest)
	--print("main finished 303 " .. tostring(quest.QuestMainId))
end

function Quest303:Start()
	--print("here 303 quest start")
end

function Quest303:OnDestroy()

end

return Quest303