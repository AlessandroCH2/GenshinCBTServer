require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest999 = class("Quest999", questActorProxy)

Quest999.defaultAlias = "Quest999"

function Quest999:OnSubStartHandlerBuild()
	self.subStartHandlers = {}
	self.subStartHandlers["99901"] = self.OnSubStart99901
	self.subStartHandlers["99902"] = self.OnSubStart99902
end

function Quest999:OnSubFinishHandlerBuild()
	self.subFinishHandlers = {}
end

-- method begin
function Quest999:OnSubStart99901(quest)
	
end

function Quest999:OnSubStart99902(quest)

end


-- method end

function Quest999:Start()
end

function Quest999:OnDestroy()
end

return Quest999