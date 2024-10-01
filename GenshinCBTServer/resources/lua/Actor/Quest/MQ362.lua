require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest362 = class("Quest362", questActorProxy)

Quest362.defaultAlias = "Quest362"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest362:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest362:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q362Cfg = require('Actor/Quest/Q362/Q362Config')
local subIDs = q362Cfg.SubIDs
local warningTask = nil
-- local config end

function Quest362:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

-- local param begin
-- local param end

-- local method begin
--[[ local function OnStart36201()
	this:NarratorOnlyTask(q362Cfg.PaimonStamina)
end ]]

local function OnFinished36203()
	-- print("362 Finish: Stop Avatar")
	-- this:NarratorOnlyTask(q362Cfg.PaimonApple)
	-- globalActor:StopLocalAvatar()	
	-- globalActor:EnablePlayerInput(false)
	-- this:CallDelay(4, this.OnEnableInput)
end

function Quest362:OnEnableInput()
	print("363 Finish: Enable Player Input")	
	globalActor:EnablePlayerInput(true)
end


-- local method end

function Quest362:OnMainStart(quest)
	--print("main start 362 " .. tostring(quest.QuestMainId))
end

function Quest362:OnSubStart(quest)
--[[ 	local questID = quest.QuestId
	if questID == subIDs.q36201 then
		OnStart36201()
	elseif questID == subIDs.q36203 then
		OnStart36203()
	end ]]
end

function Quest362:OnSubFinished(quest)
	local questID = quest.QuestId
	if questID == subIDs.q36203 then
		OnFinished36203()
	end
end

function Quest362:OnRewind(quest)

end

function Quest362:OnMainFinished(quest)

end

function Quest362:Start()
	--print("here 362 quest start")
end

function Quest362:OnDestroy()

end

return Quest362