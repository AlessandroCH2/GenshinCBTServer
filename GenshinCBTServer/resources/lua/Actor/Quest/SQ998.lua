require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest998 = class("Quest998", questActorProxy)

Quest998.defaultAlias = "Quest998"

-- Generated
function Quest998:OnSubStartHandlerBuild()
	self.subStartHandlers = {}
	self.subStartHandlers["99801"] = self.OnSubStart99801
	self.subStartHandlers["99802"] = self.OnSubStart99802
	self.subStartHandlers["99803"] = self.OnSubStart99803
	self.subStartHandlers["99804"] = self.OnSubStart99804
	self.subStartHandlers["99805"] = self.OnSubStart99805
end

function Quest998:OnSubFinishHandlerBuild()
	self.subFinishHandlers = {}
	self.subFinishHandlers["99801"] = self.OnSubFinish99801
	self.subFinishHandlers["99802"] = self.OnSubFinish99802
	self.subFinishHandlers["99803"] = self.OnSubFinish99803
	self.subFinishHandlers["99804"] = self.OnSubFinish99804
	self.subFinishHandlers["99805"] = self.OnSubFinish99805
end

--@region sub start handlers
function Quest998:OnSubStart99801(quest)
	-- TODO: Do sth on sub quest 99801 start
end

function Quest998:OnSubStart99802(quest)
	-- TODO: Do sth on sub quest 99802 start
	local targetPos = self.clientData.TargetPos.PosB
	local qqActor = actorMgr:GetActor(self.clientData.TargetNpc)
	self.uActor:AvatarPaimonAppear()
	qqActor:ClearFollowTask()
	qqActor:WalkToTask(targetPos.pos,
		function(qqActor, task)
			self:FinishQuest(false, nil)
			qqActor:TurnTo(M.Euler2DirXZ(targetPos.rot))
			qqActor:Standby()
		end
	)
end

function Quest998:OnSubStart99803(quest)
	-- TODO: Do sth on sub quest 99803 start
end

function Quest998:OnSubStart99804(quest)
	-- TODO: Do sth on sub quest 99804 start
	local targetPos = self.clientData.TargetPos.PosC
	local qqActor = actorMgr:GetActor(self.clientData.TargetNpc)
	qqActor:ClearFollowTask()
	qqActor:RunToTask(targetPos.pos,
	function(qqActor, task)
		self:FinishQuest(false, nil)
		qqActor:TurnTo(M.Euler2DirXZ(targetPos.rot))
		qqActor:Standby()
	end
	)
end

function Quest998:OnSubStart99805(quest)
	-- TODO: Do sth on sub quest 99805 start
	self.uActor:AvatarPaimonDisappear(nil, true)


end
--@endregion

--@region sub finish handlers
function Quest998:OnSubFinish99801(quest)
	-- TODO: Do sth on sub quest 99801 finish

end

function Quest998:OnSubFinish99802(quest)
	-- TODO: Do sth on sub quest 99802 finish

end

function Quest998:OnSubFinish99803(quest)
	-- TODO: Do sth on sub quest 99803 finish

end

function Quest998:OnSubFinish99804(quest)
	-- TODO: Do sth on sub quest 99804 finish

end

function Quest998:OnSubFinish99805(quest)
	-- TODO: Do sth on sub quest 99805 finish

end
--@endregion

function Quest998:Start()
end

function Quest998:OnDestroy()
end

return Quest998