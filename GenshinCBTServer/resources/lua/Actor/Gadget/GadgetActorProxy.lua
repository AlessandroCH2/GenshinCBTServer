----------------------
-- 这是Lua端GadgetActor的基类，用于自定义实现本地行为的Gadget。继承自EntityActorProxy
-- @classmod GadgetActorProxy
require('Actor/ActorCommon')
local entityActorProxy = require('Actor/EntityActorProxy')

local GadgetActorProxy = class("GadgetActorProxy", entityActorProxy)

GadgetActorProxy.actorType = ActorType.GADGET_ACTOR

local super = nil

function GadgetActorProxy:OnPreInit()
	super = self.__super
	super:OnPreInit()
end

function GadgetActorProxy:PreGetAlias()
	return nil
end

function GadgetActorProxy:CreateGadgetUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.GADGET_ACTOR, alias, self.metaPath)
	if self.bornPos == nil then
		self.bornPos = M.Pos(0, 0, 0)
	end
	if self.bornDir == nil then
		self.bornDir = M.Pos(0, 0, 0)
	end
	uActor = actorUtils.CreateGadgeActor(self.configID, self.bornPos, self.bornDir, uActor, self.actorData)
	return uActor
end

function GadgetActorProxy:CreateUActor(alias)
	return self:CreateGadgetUActor(alias)
end

function GadgetActorProxy:OnPostInit()
	if self.uActor ~= nil then
		self.uActor:TryStartActor()
	end
	self:OnPostDataPrepare()
	self:OnPostComponentPrepare()
	self:OnUActorPostInit()
end
function GadgetActorProxy:OnPostComponentPrepare()
end
function GadgetActorProxy:OnUActorPostInit()
	if self.uActor ~= nil then
		actorUtils.PostInitGadgetActor(self.uActor)
	end
end

--- GadgetActor添加组件的方法
-- @section component

GadgetActorProxy.isTriggerIn = false
GadgetActorProxy.checkTimeGap = 0.1
GadgetActorProxy.timeCnt = 0
GadgetActorProxy.targetTime = 0
GadgetActorProxy.triggerInHandler = nil
GadgetActorProxy.triggerOutHandler = nil
GadgetActorProxy.triggerTickHandler = nil
function GadgetActorProxy:DefaultTriggerIn()
	self.isTriggerIn = true
	if self.triggerInHandler ~= nil then
		self:triggerInHandler()
	end
end
function GadgetActorProxy:DefaultTriggerOut()
	self.isTriggerIn = false
	if self.triggerOutHandler ~= nil then
		self:triggerOutHandler()
	end
end

GadgetActorProxy.triggerDelayOutHandler = nil
function GadgetActorProxy:DefaultTriggerDelayOut()
	if self.triggerDelayOutHandler ~= nil then
		self:triggerDelayOutHandler()
	end
	self:DestroySelf()
end
function GadgetActorProxy:CheckDelayTimeOut()
	if self.isTriggerIn then
		self.timeCnt = 0
	else
		self.timeCnt = self.timeCnt + self.checkTimeGap
		if self.timeCnt >= self.targetTime then
			self:DefaultTriggerDelayOut()
			self.timeCnt = 0
		end
	end
end

--- 添加一个简单的Trigger组件
-- @tparam float dist 距离多少内算触发
-- @tparam DistType distType 距离类型,参考DistType
-- @tparam Vector3 offset 角色脚底偏移多少作为核心去计算
-- @tparam function triggerIn 进入时候触发的函数
-- @tparam function triggerOut 出来时候触发的函数
-- @tparam function triggerTick 帧Tick时候的触发的函数
function GadgetActorProxy:AddComponentTrigger(dist, distType, offset, triggerIn, triggerOut, triggerTick)
	self.uActor:AddSimpleTrigger(dist, distType, offset, triggerIn, triggerOut, triggerTick)
end

--- 添加一个超区域会有计时逻辑的Trigger组件
-- @tparam float dist 距离多少内算触发
-- @tparam DistType distType 距离类型,参考DistType
-- @tparam Vector3 offset 角色脚底偏移多少作为核心去计算
-- @tparam float delayTime 延迟的秒数
-- @tparam function triggerIn 进入时候触发的函数
-- @tparam function triggerOut 出来时候触发的函数
function GadgetActorProxy:AddTimeDelayOutTrigger(dist, distType, delayTime, offset, triggerIn, triggerOut, triggerDelayOut)
	self.timeCnt = 0
	self.targetTime = delayTime
	self.triggerInHandler = triggerIn
	self.triggerOutHandler = triggerOut
	self.triggerDelayOutHandler = triggerDelayOut
	self.uActor:AddSimpleTrigger(dist, distType, offset, self.DefaultTriggerIn, self.DefaultTriggerOut, self.CheckDelayTimeOut)
end

--- 添加一个功能齐全的Trigger组件
-- @tparam ShapeData shapeData
-- @tparam function triggerIn 进入时候触发的函数
-- @tparam function triggerOut 出来时候触发的函数
-- @tparam function triggerTick 每次更新周期触发的函数
function GadgetActorProxy:AddCommonTrigger(shapeData, triggerIn, triggerOut, triggerTick)
	self.uActor:AddCommonTrigger(shapeData, triggerIn, triggerOut, triggerTick)
end

--- 销毁Gadget
function GadgetActorProxy:DestroySelf()
	self:ClearInfo()
	self:Destroy(false)
	actorMgr:ClearActor(self.alias)
end

return GadgetActorProxy