require('Actor/ActorCommon')
local npcActorProxy = require('Actor/Npc/NpcActorProxy')

local Test9001 = class("Test9001", npcActorProxy)

Test9001.defaultAlias = "Test9001"

function Test9001:Start()
	print("###################_________________")
	--self:RunTo(M.Pos(22.0, 0.0, 43.0))
	self:CallOnCollisionEnter(self.OnCollisionEnter)
end

function Test9001:OnCollisionEnter(targetInfo)
	print("Enter Collision")
	print(targetInfo.isSprint)

	if targetInfo.isSprint then
		self:DoOnCollisionEnter()
	end
end

function Test9001:DoOnCollisionEnter()
	if not self:DoingFreeStyle() then
		self:CallDelay(5, self.GoOn)
		self:DoFreeStyleTask(3, true, self.Walk)
	end
end

function Test9001:GoOn(task)
	print("Go on")
	self:DoFreeStateTrigger()
end

function Test9001:Walk(task)
	print("Walk To")
	self:WalkTo(M.Pos(22.0, 0.0, 43.0))
end

return Test9001