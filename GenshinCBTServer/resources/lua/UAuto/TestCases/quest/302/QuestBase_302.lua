local baseClass = require('UAuto/TestCases/Quest/QuestBase')
local UAutoLuaTestCase = class("QuestBase_302",baseClass)
local self = UAutoLuaTestCase

self.StartPosition = CS.UnityEngine.Vector3(2599.48,236.61,-5631.36)
self.Position30201 = CS.UnityEngine.Vector3(2594.82, 241.44, -5565.67)

function self:Step_30201()
	print "Step_30201"
	yield_return(self.base:TelePort(self.StartPosition))
	yield_return(self.base:MoveToPositionUntilCutSceneDisAppear(self.Position30201))
end

function self:Step_30202()
	print "Step_30202"
	yield_return(self.base:WaitFoundNearByEntityByName("NPC_SP013", function(result) self.npc=result end,60))
	print(self.npc)
	yield_return(self.base:MoveToEntity(self.npc))
	yield_return(self:WaitTalk(0))
	yield_return(self:WaitCutScene(true))
end

function self:Step_30203()
	print "Step_30203"
	yield_return(self.base:WaitFoundNearByEntityByName("NPC_SP013", function(result) self.npc=result end,60))
	print(self.npc)
	yield_return(self.base:MoveToEntity(self.npc))
end

function self:Step_30204(endPosition)
	print "Step_30204"
	self.endPosition = endPosition or CS.UnityEngine.Vector3(2566.26, 214.68, -5423.05);
	print(self.endPosition)
	yield_return(self.base:WaitFoundNearByEntityByName("NPC_SP013", function(result) self.entity=result end))
	local testObj = self
	yield_return(self:FllowEntity(self.entity, self.endPosition))
end

function self:Step_30205()
	print "Step_30205"
	yield_return(self:WaitTalk(0))
	
end

function self:Step_30206()
	print "Step_30206"
	yield_return(self:WaitCutScene(true))
end

function self:Step_30207()
	print "Step_30207"
end




return self