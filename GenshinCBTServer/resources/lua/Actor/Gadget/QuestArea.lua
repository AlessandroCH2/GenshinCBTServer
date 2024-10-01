require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local QuestArea = class("QuestArea", gadgetActorProxy)

QuestArea.defaultAlias = "QuestArea"
QuestArea.areaRadius = 100
QuestArea.areaDistType = DistType.EULER_XZ
QuestArea.avatarOffset = M.Pos(0, 0, 0)
QuestArea.questAreaInHandler = nil
QuestArea.questAreaOutHandler = nil
QuestArea.questAreaDelayOutHandler = nil

function QuestArea:OnPostComponentPrepare()
	self:AddTimeDelayOutTrigger(self.areaRadius, self.areaDistType, self.targetTime, self.avatarOffset, 
		self.questTriggerInHandler, self.questTriggerOutHandler, self.questTriggerDelayOutHandler)
end

function QuestArea:questTriggerInHandler()
	print("show quest area in ui")
	if self.questAreaInHandler ~= nil then
		self:questAreaInHandler()
	end
end

function QuestArea:questTriggerOutHandler()
	print("show quest area out ui")
	if self.questAreaOutHandler ~= nil then
		self:questAreaOutHandler()
	end
end

function QuestArea:questTriggerDelayOutHandler()
	print("show delay quest area out ui")
	if self.questAreaDelayOutHandler ~= nil then
		self:questAreaDelayOutHandler()
	end
end

return QuestArea