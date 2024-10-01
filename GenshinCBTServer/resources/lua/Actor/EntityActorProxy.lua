----------------------
-- 这是Lua端EntityActor的基类，包含了控制Entity行为的方法。继承自BaseActorProxy
-- @classmod EntityActorProxy
require('Actor/ActorCommon')
local baseActorProxy = require('Actor/BaseActorProxy')

local EntityActorProxy = class("EntityActorProxy", baseActorProxy)

local super = nil

function EntityActorProxy:OnPreInit()
	super = self.__super
end

function EntityActorProxy:PreGetAlias()
	return nil
end

--- EntityActor操作的Entity的configID
EntityActorProxy.configID = nil
--- Entity的出生位置
EntityActorProxy.bornPos = nil
--- Entity的出生朝向
EntityActorProxy.bornDir = nil
--- Entity是否为网络单位
EntityActorProxy.isNetwork = false

EntityActorProxy.actorType = ActorType.BASE_ENTITY

function EntityActorProxy:OnInit(alias)
	super:OnInit(alias)
	local uActor = self:CreateUActor(alias)
	self.uActor = uActor

	self:Register()
end

--- Actor C#端Actor对象创建，如果需要走不同的创建流程则需要重写这个方法
function EntityActorProxy:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.BASE_ENTITY, alias, self.metaPath)
	return uActor
end

function EntityActorProxy:Register()
	--print("here register your callback")
end

function EntityActorProxy:Start()
	--print("here start")
end

--- EntityActor 属性相关的方法
-- @section prop

--- EntityActor通过propTyoe来获取当前属性
-- @tparam PropType propType属性的类型
-- @treturn float 属性数值
function EntityActorProxy:GetPropValue(propType)
	return self.uActor:GetPropValue(propType)
end

--- EntityActor 移动相关的方法
-- @section move

--- EntityActor行走到一个坐标
-- @tparam Vector3 pos 坐标绝对值
function EntityActorProxy:WalkTo(pos)
	self.uActor:WalkTo(pos)
end
--- EntityActor沿着路点行走到一个坐标
-- @tparam List<Vector3> posList 路点链表
function EntityActorProxy:WalkToRoute(posList)
	self.uActor:WalkToRoute(posList)
end

--- EntityActor沿着路点行走到一个坐标
-- @tparam ConfigRoute routeConfig 路点Config
function EntityActorProxy:WalkToRouteByData(routeConfig)
	self.uActor:WalkToRouteByData(routeConfig)
end

--- EntityActor跑动到一个坐标
-- @tparam Vector3 pos 坐标绝对值
function EntityActorProxy:RunTo(pos)
	self.uActor:RunTo(pos)
end
--- EntityActor沿着路点跑动到一个坐标
-- @tparam List<Vector3> posList 路点链表
function EntityActorProxy:RunToRoute(posList)
	self.uActor:RunToRoute(posList)
end

--- EntityActor沿着路点跑动到一个坐标
-- @tparam ConfigRoute routeConfig 路点Config
function EntityActorProxy:RunToRouteByData(routeConfig)
	self.uActor:RunToRouteByData(routeConfig)
end

--- EntityActor原地暂停
function EntityActorProxy:Standby()
	self.uActor:Standby(false)
end

--- EntityActor原地待机(不会恢复寻路)
function EntityActorProxy:StandbyNoResume()
	self.uActor:Standby(true)
end

--- EntityActor恢复移动
function EntityActorProxy:ResumeMove()
	self.uActor:ResumeMove()
end

--- EntityActor主动同步当前位置
-- @tparam int state 状态0:standby, 1:walk, 2:run
function EntityActorProxy:SyncPos(state)
	self.uActor:SyncPos(state)
end
--- EntityActor是否再执行freeStyle
function EntityActorProxy:DoingFreeStyle()
	return self.uActor:DoingFreeStyle()
end
--- EntityActor执行自定义的动作，需要预先在状态机里配置
-- @tparam int freeStyleType 状态机里切换到某个状态的对应参数
-- @tparam bool freeStyleForceInterrupt 强制打断当前行为
function EntityActorProxy:DoFreeStyle(freeStyleType, freeStyleForceInterrupt)
	if freeStyleForceInterrupt == nil then
		freeStyleForceInterrupt = true
	end
	self.uActor:DoFreeStyle(freeStyleType, freeStyleForceInterrupt)
end
--- EntityActor执行自定义的动作继续，需要于现在状态机里配置FreeStateTrigger
function EntityActorProxy:DoFreeStateTrigger()
	self.uActor:DoFreeStateTrigger()
end
--- EntityActor做完一个FreeStyle的回调
function EntityActorProxy:InvokeOnResetFreeStyle(freeStyleType)
end
--- EntityActor转向一个方向
-- @tparam Vector3 dir 这是一个forward，如果是euler旋转角要通过M.Euler2DirXZ转换一下
function EntityActorProxy:TurnTo(dir)
	self.uActor:TurnTo(dir)
end
--- EntityActor获取当前坐标
-- @treturn Vector3 所在坐标绝对值
function EntityActorProxy:GetPos()
	return self.uActor:GetPos()
end
--- EntityActor获取当前GetEuler
-- @treturn Vector3 所在坐标绝对值
function EntityActorProxy:GetEuler()
	return self.uActor:GetEuler()
end
--- EntityActor获取当前朝向
-- @treturn Vector3 所在坐标绝对值
function EntityActorProxy:GetForward()
	return self.uActor:GetForward()
end
--- EntityActor获取当前是否Standby
-- @treturn bool 是否站立
function EntityActorProxy:IsInIdle()
	return self.uActor:IsInIdle()
end
--- EntityActor瞬移到一个点并转向
-- @tparam Vector3 pos 坐标绝对值
-- @tparam Vector3 dir 方向向量
-- @tparam bool 不需要演出
function EntityActorProxy:SetPosAndTurnTo(pos, dir, noPerform)
	if noPerform == nil then
		noPerform = true
	end
	self.uActor:SetPosAndTurnTo(pos, dir, noPerform)
end
--- EntityActor瞬移到一个点
-- @tparam Vector3 pos 坐标绝对值
-- @tparam bool 不需要演出
function EntityActorProxy:SetPos(pos, noPerform)
	if noPerform == nil then
		noPerform = true
	end
	self.uActor:SetPos(pos, noPerform)
end
--- EntityActor获取当前欧拉角
-- @treturn Vector3 当前相对于世界的欧拉角
function EntityActorProxy:GetEuler()
	return self.uActor:GetEuler()
end
--- EntityActor隐藏
-- @tparam bool value 是否隐藏
function EntityActorProxy:Hide(value)
	self.uActor:Hide(value)
end
--- EntityActor标准隐藏
function EntityActorProxy:HideSelf()
	self:Stop()
	self:Standby()
	self:Hide(true)
end
--- EntityActor标准出现
function EntityActorProxy:ShowSelf()
	self:Hide(false)
end
--- EntityActor非Daily的检查出现
function EntityActorProxy:CheckShow()
	self.uActor:CheckShow()
end
--- EntityActor找椅子坐下
function EntityActorProxy:SitOnChair()
	self.uActor:SitOnChair()
end
--- EntityActor从椅子上站起
function EntityActorProxy:StandFromChair()
	self.uActor:StandFromChair()
end
--- EntityActor开启整个AI
-- @tparam bool value 是否开启AI
function EntityActorProxy:EnableAI(value)
	self.uActor:EnableAI(value)
end
--- EntityActor开启交互
-- @tparam bool value 是否开启交互
function EntityActorProxy:EnableInteraction(value)
	self.uActor:EnableInteraction(value)
end

EntityActorProxy.targetPos = nil
EntityActorProxy.routePoints = nil
EntityActorProxy.routeConfig = nil
function EntityActorProxy:StartWalkTo(task)
	self:WalkTo(self.targetPos)
end
function EntityActorProxy:StartWalkToRoute(task)
	self:WalkToRoute(self.routePoints)
end
function EntityActorProxy:StartWalkToRouteByData(task)
	self:WalkToRouteByData(self.routeConfig)
end
function EntityActorProxy:StartRunTo(task)
	self:RunTo(self.targetPos)
end
function EntityActorProxy:StartRunToRoute(task)
	self:RunToRoute(self.routePoints)
end
function EntityActorProxy:StartRunToRouteByData(task)
	self:RunToRouteByData(self.routeConfig)
end
function EntityActorProxy:StartFollowRunTo(task)
	if self.BeFollowState == BeFollowState.ING then
		self:RunTo(self.targetPos)
	end
end
function EntityActorProxy:StartFollowRunToRoute(task)
	if self.BeFollowState == BeFollowState.ING then
		self:RunToRoute(self.routePoints)
	end
end
function EntityActorProxy:StartFollowRunToRouteByData(task)
	if self.BeFollowState == BeFollowState.ING then
		self:RunToRouteByData(self.routeConfig)
	end
end
function EntityActorProxy:CheckArrived(task, deltaTime)
	if self.targetPos == nil then
		task:FinishTask()
	end
end

EntityActorProxy.BeFollowLen = 10
EntityActorProxy.BeFollowFailedLen = 20
EntityActorProxy.BeFollowState = BeFollowState.ING
EntityActorProxy.BeFollowFailed = nil
EntityActorProxy.OnTransFinishCallback = nil
EntityActorProxy.OnTransPreCallback = nil
EntityActorProxy.TransOffset = 1
EntityActorProxy.IsBeLocked = false
EntityActorProxy.BeLockTransLen = 30
EntityActorProxy.OnFinishCB = nil
EntityActorProxy.OnMovePauseCB = nil
EntityActorProxy.OnMoveResumeCB = nil
EntityActorProxy.OnMoveFailedCB = nil


function EntityActorProxy:FinishFollow(task)
	print("FinishFollow", self.OnFinishCB, self.BeFollowLen, self.BeFollowState)

	self.BeFollowState = BeFollowState.SUCCESS
	if self.OnFinishCB ~= nil then
		self:OnFinishCB(task)
	end
end
function EntityActorProxy:CheckBeFollow(task, deltaTime)
	if self.targetPos == nil then
		task:FinishTask()
	end

	local selfPos = self:GetPos()
	local avatarPos = actorUtils.GetAvatarPos()
	local currLen = M.Dist(selfPos, avatarPos)

	--print("CheckBeFollow", self.targetPos, currLen, self.BeFollowLen, self.BeFollowState)

	if self.BeFollowFailedLen >= 0 and currLen > self.BeFollowFailedLen then
		print("Failed")
		self.BeFollowState = BeFollowState.FAILED
		task:FinishTask()
	elseif currLen > self.BeFollowLen then
		if self.BeFollowState ~= BeFollowState.WAITING then
			self.BeFollowState = BeFollowState.WAITING
			self:Standby()
		end
	else
		if self.BeFollowState == BeFollowState.WAITING then
			self.BeFollowState = BeFollowState.ING
			self:RunTo(self.targetPos)
		end
	end
end

function EntityActorProxy:DisappearFollow(task)
	self.BeFollowState = BeFollowState.FAILED
	task:FinishTask()
end

function EntityActorProxy:CheckBeFollowRoute(task, deltaTime)
	if self.targetPos == nil then
		task:FinishTask()
	end

	local selfPos = self:GetPos()
	local avatarPos = actorUtils.GetAvatarPos()
	local currLen = M.Dist(selfPos, avatarPos)

	--print("CheckBeFollow", self.targetPos, currLen, self.BeFollowLen, self.BeFollowState)

	if self.BeFollowFailedLen >= 0 and currLen > self.BeFollowFailedLen then
		print("Failed")
		self.BeFollowState = BeFollowState.FAILED
		if self.OnFinishCB ~= nil then
			self:OnFinishCB(task)
		end
		if self.OnMoveFailedCB ~= nil then
			self:OnMoveFailedCB()
		end
	elseif currLen > self.BeFollowLen then
		if self.BeFollowState ~= BeFollowState.WAITING then
			self.BeFollowState = BeFollowState.WAITING
			if self.OnMovePauseCB == nil then
				self:Standby()
			else
				self:OnMovePauseCB()
			end
		end
	else
		if self.BeFollowState == BeFollowState.WAITING then
			self.BeFollowState = BeFollowState.ING
			if self.OnMoveResumeCB == nil then
				self:ResumeMove()
			else
				self:OnMoveResumeCB()
			end
		end
	end
end

function EntityActorProxy:DisappearFollowRoute(task)
	self.BeFollowState = BeFollowState.FAILED
	if self.OnFinishCB ~= nil then
		self:OnFinishCB(task)
	end
	if self.OnMoveFailedCB ~= nil then
		self:OnMoveFailedCB()
	end
end

function EntityActorProxy:CheckBeLock(task, deltaTime)
	local selfPos = self:GetPos()
	local avatarPos = actorUtils.GetAvatarPos()

	local currLen = M.Dist(selfPos, avatarPos)

	if self.BeLockTransLen >= 0 and currLen > self.BeLockTransLen then
		if self.IsBeLocked == false then
			self.IsBeLocked = true
			self:Standby()
			local avatarEular = M.Dir2Euler(selfPos - avatarPos)
			local newPos = nil
			if type(self.TransOffset) == "number" then
				newPos = selfPos - self.TransOffset * self:GetForward()
			else
				newPos = self.TransOffset
			end
			self:SyncPos(0)
			if self:TransmitPlayer(0, newPos, avatarEular, function(actor)
					self:OnTransFinishCallback()
				end, 
				function(actor)
					self:OnTransPreCallback()
				end) == false then
				self.IsBeLocked = false
			end
		end
	elseif currLen <= self.BeLockTransLen then
		if self.IsBeLocked == true then
			self.IsBeLocked = false
		end
	end
end

--- EntityActor走到一个点的Task
-- @tparam Vector3 pos 坐标绝对值
-- @tparam function OnFinish task结束后执行的回调
-- @tparam function OnPause task暂停时执行的回调
-- @tparam function OnResume task继续时执行的回调，如果为nil，则执行Start即走到原定的点
function EntityActorProxy:WalkToTask(pos, OnFinish, OnPause, OnResume)
	--print("Walk to task")
	self:ClearFollowTask()
	self.targetPos = pos
	local task = self:CreateTask(TaskID.MOVE_TASK_ID, LuaTaskType.MOVE, "Move")
	task:StartEvent('+', self.StartWalkTo)
	task:TickEvent('+', self.CheckArrived)
	if OnFinish ~= nil then
		task:FinishEvent('+', OnFinish)
	end
	if OnPause ~= nil then
		task:PauseEvent('+', OnPause)
	end
	if OnResume ~= nil then
		task:ResumeEvent('+', OnResume)
	end
end

--- EntityActor沿着指定路点走到一个点的Task
-- @tparam List<Vector3> points 路点序列
-- @tparam function OnFinish task结束后执行的回调
-- @tparam function OnPause task暂停时执行的回调
-- @tparam function OnResume task继续时执行的回调，如果为nil，则执行Start即走到原定的点
function EntityActorProxy:WalkToRouteTask(points, OnFinish, OnPause, OnResume)
	print("Walk to route task")
	self:ClearFollowTask()
	self.targetPos = points[#points]
	self.routePoints = points
	local task = self:CreateTask(TaskID.MOVE_TASK_ID, LuaTaskType.MOVE, "Move")
	task:StartEvent('+', self.StartWalkToRoute)
	task:TickEvent('+', self.CheckArrived)
	if OnFinish ~= nil then
		task:FinishEvent('+', OnFinish)
	end
	if OnPause ~= nil then
		task:PauseEvent('+', OnPause)
	end
	if OnResume ~= nil then
		task:ResumeEvent('+', OnResume)
	end
end

--- EntityActor沿着路点配置中的路点走到最后的Task
-- @tparam ConfigRoute routeConfig 路点序列配置
-- @tparam function OnFinish task结束后执行的回调
-- @tparam function OnPause task暂停时执行的回调
-- @tparam function OnResume task继续时执行的回调，如果为nil，则执行Start即走到原定的点
	function EntityActorProxy:WalkToRouteByDataTask(routeConfig, OnFinish, OnPause, OnResume)
		print("Walk to route by data task")
		self:ClearFollowTask()
		self.targetPos = routeConfig.points[#routeConfig.points]
		self.routeConfig = routeConfig
		local task = self:CreateTask(TaskID.MOVE_TASK_ID, LuaTaskType.MOVE, "Move")
		task:StartEvent('+', self.StartWalkToRouteByData)
		task:TickEvent('+', self.CheckArrived)
		if OnFinish ~= nil then
			task:FinishEvent('+', OnFinish)
		end
		if OnPause ~= nil then
			task:PauseEvent('+', OnPause)
		end
		if OnResume ~= nil then
			task:ResumeEvent('+', OnResume)
		end
	end

--- EntityActor跑到一个点的Task
-- @tparam Vector3 pos 坐标绝对值
-- @tparam function OnFinish task结束后执行的回调
-- @tparam function OnPause task暂停时执行的回调
-- @tparam function OnResume task继续时执行的回调，如果为nil，则执行Start即走到原定的点
function EntityActorProxy:RunToTask(pos, OnFinish, OnPause, OnResume)
	--print("Run to task")
	self:ClearFollowTask()
	self.targetPos = pos
	local task = self:CreateTask(TaskID.MOVE_TASK_ID, LuaTaskType.MOVE, "Move")
	task:StartEvent('+', self.StartRunTo)
	task:TickEvent('+', self.CheckArrived)
	if OnFinish ~= nil then
		task:FinishEvent('+', OnFinish)
	end
	if OnPause ~= nil then
		task:PauseEvent('+', OnPause)
	end
	if OnResume ~= nil then
		task:ResumeEvent('+', OnResume)
	end
end

--- EntityActor沿着指定路点跑到一个点的Task
-- @tparam List<Vector3> points 路点序列
-- @tparam function OnFinish task结束后执行的回调
-- @tparam function OnPause task暂停时执行的回调
-- @tparam function OnResume task继续时执行的回调，如果为nil，则执行Start即走到原定的点
function EntityActorProxy:RunToRouteTask(points, OnFinish, OnPause, OnResume)
	print("Run to route task")
	self:ClearFollowTask()
	self.targetPos = points[#points]
	self.routePoints = points
	local task = self:CreateTask(TaskID.MOVE_TASK_ID, LuaTaskType.MOVE, "Move")
	task:StartEvent('+', self.StartRunToRoute)
	task:TickEvent('+', self.CheckArrived)
	if OnFinish ~= nil then
		task:FinishEvent('+', OnFinish)
	end
	if OnPause ~= nil then
		task:PauseEvent('+', OnPause)
	end
	if OnResume ~= nil then
		task:ResumeEvent('+', OnResume)
	end
end

--- EntityActor沿着路点配置中的路点跑到最后的Task
-- @tparam ConfigRoute routeConfig 路点序列配置
-- @tparam function OnFinish task结束后执行的回调
-- @tparam function OnPause task暂停时执行的回调
-- @tparam function OnResume task继续时执行的回调，如果为nil，则执行Start即走到原定的点
function EntityActorProxy:RunToRouteByDataTask(routeConfig, OnFinish, OnPause, OnResume)
	print("Run to route by data task")
	self:ClearFollowTask()
	self.targetPos = routeConfig.points[#routeConfig.points]
	self.routeConfig = routeConfig
	local task = self:CreateTask(TaskID.MOVE_TASK_ID, LuaTaskType.MOVE, "Move")
	task:StartEvent('+', self.StartRunToRouteByData)
	task:TickEvent('+', self.CheckArrived)
	if OnFinish ~= nil then
		task:FinishEvent('+', OnFinish)
	end
	if OnPause ~= nil then
		task:PauseEvent('+', OnPause)
	end
	if OnResume ~= nil then
		task:ResumeEvent('+', OnResume)
	end
end

--- EntityActor走向一个点，并让玩家跟随，如果距离小远则等待，大远则失败
-- @tparam Vector3 pos 坐标绝对值
-- @tparam float beFollowLen 小于这个值则继续走向预设点，否则等待
-- @tparam float beFollowFailed 小于这个值则等待, 否则失败，如果是负数则一直等待不会失败
-- @tparam function OnFinish task结束后执行的回调
-- @tparam function OnPause task暂停时执行的回调
-- @tparam function OnResume task继续时执行的回调，如果为nil，则执行Start即走到原定的点
function EntityActorProxy:BeFollowTask(pos, beFollowLen, beFollowFailed,
	OnFinish, OnPause, OnResume)
	print("Be follow task")
	self:ClearFollowTask()
	self.targetPos = pos
	self.BeFollowLen = beFollowLen
	self.BeFollowFailedLen = beFollowFailed
	self.BeFollowState = BeFollowState.ING
	self.OnFinishCB = OnFinish
	local task = self:CreateTask(TaskID.MOVE_TASK_ID, LuaTaskType.MOVE, "Move")
	task:StartEvent('+', self.StartFollowRunTo)
	task:TickEvent('+', self.CheckBeFollow)
	task:FinishEvent('+', self.FinishFollow)
	task:DisappearEvent('+', self.DisappearFollow)
	if OnPause ~= nil then
		task:PauseEvent('+', OnPause)
	end
	if OnResume ~= nil then
		task:ResumeEvent('+', OnResume)
	end
end

--- EntityActor走向一个点，并让玩家跟随，如果距离小远则等待，大远则失败
-- @tparam table data 包含必要参数
-- @tparam function OnFinish task结束后执行的回调
-- @tparam function OnPause task暂停时执行的回调
-- @tparam function OnResume task继续时执行的回调，如果为nil，则执行Start即走到原定的点
function EntityActorProxy:BeFollowTaskByData(data, 
	OnFinish, OnPause, OnResume)
	self:BeFollowTask(data.pos, data.beFollowLen, data.beFollowFailed, OnFinish, OnPause, OnResume)
end

--- EntityActor走过一组路径点，并让玩家跟随，如果距离小远则等待，大远则失败
-- @tparam List<Vector3> points 路点序列
-- @tparam float beFollowLen 小于这个值则继续走向预设点，否则等待
-- @tparam float beFollowFailed 小于这个值则等待, 否则失败，如果是负数则一直等待不会失败
-- @tparam function OnFinish task结束后执行的回调
-- @tparam function OnPause task暂停时执行的回调
-- @tparam function OnResume task继续时执行的回调，如果为nil，则执行Start即走到原定的点
-- @tparam function OnMovePause 跟随中暂停时执行的回调，如果为nil，则调用Standby()
-- @tparam function OnMoveResume 跟随中继续时执行的回调，如果为nil，则调用Resume()
-- @tparam function OnMoveFailed 跟随中失败的回调
function EntityActorProxy:BeFollowTaskByRoutePoints(points, beFollowLen, beFollowFailed,
	OnFinish, OnPause, OnResume, OnMovePause, OnMoveResume, OnMoveFailed)
	print("Be follow task")
	self:ClearFollowTask()
	self.targetPos = points[#points]
	self.routePoints = points
	self.BeFollowLen = beFollowLen
	self.BeFollowFailedLen = beFollowFailed
	self.BeFollowState = BeFollowState.ING
	self.OnFinishCB = OnFinish
	self.OnMovePauseCB = OnMovePause
	self.OnMoveResumeCB = OnMoveResume
	self.OnMoveFailedCB = OnMoveFailed

	local task = self:CreateTask(TaskID.MOVE_TASK_ID, LuaTaskType.MOVE, "Move")
	task:StartEvent('+', self.StartFollowRunToRoute)
	task:TickEvent('+', self.CheckBeFollowRoute)
	task:FinishEvent('+', self.FinishFollow)
	task:DisappearEvent('+', self.DisappearFollowRoute)
	if OnPause ~= nil then
		task:PauseEvent('+', OnPause)
	end
	if OnResume ~= nil then
		task:ResumeEvent('+', OnResume)
	end
end

--- EntityActor走过一组配置的路径点，并让玩家跟随，如果距离小远则等待，大远则失败
-- @tparam ConfigRoute routeConfig 路点序列配置
-- @tparam float beFollowLen 小于这个值则继续走向预设点，否则等待
-- @tparam float beFollowFailed 小于这个值则等待, 否则失败，如果是负数则一直等待不会失败
-- @tparam function OnFinish task结束后执行的回调
-- @tparam function OnPause task暂停时执行的回调
-- @tparam function OnResume task继续时执行的回调，如果为nil，则执行Start即走到原定的点
-- @tparam function OnMovePause 跟随中暂停时执行的回调，如果为nil，则调用Standby()
-- @tparam function OnMoveResume 跟随中继续时执行的回调，如果为nil，则调用Resume()
-- @tparam function OnMoveFailed 跟随中失败的回调
function EntityActorProxy:BeFollowTaskByRouteConfig(routeConfig, beFollowLen, beFollowFailed,
	OnFinish, OnPause, OnResume, OnMovePause, OnMoveResume, OnMoveFailed)
	print("Be follow task")
	self:ClearFollowTask()
	self.targetPos = routeConfig.points[#routeConfig.points]
	self.routeConfig = points
	self.BeFollowLen = beFollowLen
	self.BeFollowFailedLen = beFollowFailed
	self.BeFollowState = BeFollowState.ING
	self.OnFinishCB = OnFinish
	self.OnMovePauseCB = OnMovePause
	self.OnMoveResumeCB = OnMoveResume
	self.OnMoveFailedCB = OnMoveFailed

	local task = self:CreateTask(TaskID.MOVE_TASK_ID, LuaTaskType.MOVE, "Move")
	task:StartEvent('+', self.StartFollowRunToRouteByData)
	task:TickEvent('+', self.CheckBeFollowRoute)
	task:FinishEvent('+', self.FinishFollow)
	task:DisappearEvent('+', self.DisappearFollowRoute)
	if OnPause ~= nil then
		task:PauseEvent('+', OnPause)
	end
	if OnResume ~= nil then
		task:ResumeEvent('+', OnResume)
	end
end

function EntityActorProxy:ClearBeLockTask()
	self:ClearTask(TaskID.LOCK_TASK_ID)
end

--- EntityActor让玩家跟随，大远则拉回
-- @tparam float beFollowLen 大宇于这个值则传送
-- @tparam float transOffset 传送位置偏移
-- @tparam function onTransFinishCB 传送完以后干的事情
-- @tparam function onTransPreCB 传送黑屏时候干的事情
function EntityActorProxy:BeLockTask(beLockTransLen, transOffset, onTransFinishCB, onTransPreCB)
	print("Be lock task ")
	self:ClearBeLockTask()
	self.IsBeLocked = false
	self.BeLockTransLen = beLockTransLen
	self.TransOffset = transOffset
	self.OnTransFinishCallback = onTransFinishCB
	self.OnTransPreCallback = onTransPreCB
	local task = self:CreateTask(TaskID.LOCK_TASK_ID, LuaTaskType.NORMAL, "Lock")
	task:TickEvent('+', self.CheckBeLock)
end

--- EntityActor走向一个点，并让玩家跟随，如果距离小远则等待， 中距离则提示，大远则拉回
-- @tparam table data 包含必要参数
-- @tparam function onTransFinishCB 传送完以后干的事情
function EntityActorProxy:BeLockTaskByData(data, onTransFinishCB)
	self:BeLockTask(data.beLockTransLen, data.transOffset, onTransFinishCB)
end

EntityActorProxy.freeStyleType = -1
EntityActorProxy.freeStyleForceInterrupt = false
function EntityActorProxy:StartFreeStyle(task)
	self:DoFreeStyle(self.freeStyleType, self.freeStyleForceInterrupt)
end

function EntityActorProxy:ResumeFreeStyle(task)
	task:FinishTask()
end

--- EntityActor做一个动作，并且有结束回调
-- @tparam int freeStyleType 对应状态机中的type条件
-- @tparam bool freeStyleForceInterrupt 强制打断当前行为
-- @tparam function OnFinish task结束后执行的回调
function EntityActorProxy:DoFreeStyleTask(freeStyleType, freeStyleForceInterrupt, OnFinish)
	if not freeStyleForceInterrupt then
		if self:DoingFreeStyle() then
			return
		end
	end

	self:ClearFollowTask()
	self.freeStyleType = freeStyleType
	self.freeStyleForceInterrupt = true
	local task = self:CreateTask(TaskID.MOVE_TASK_ID, LuaTaskType.FREE_STYLE, "Idle")
	task:SetFreeStyleType(freeStyleType)
	task:StartEvent('+', self.StartFreeStyle)
	task:ResumeEvent('+', self.ResumeFreeStyle)
	if OnFinish ~= nil then
		task:FinishEvent('+', OnFinish)
	end
end

--- EntityActor切换到飞行
-- @tparam bool value 是否飞行
function EntityActorProxy:SwitchAirMode(value)
	self.uActor:SwitchAirMode(value)
end

function EntityActorProxy:ClearActor()
	self.uActor:ClearActor()

	self.targetPos = nil
	self.routePoints = nil
	self.routeConfig = nil

	self.BeFollowLen = 10
	self.BeFollowFailedLen = 20
	self.BeFollowState = BeFollowState.ING
	self.BeFollowFailed = nil
	self.IsBeLocked = false
end

--Move End

--Render相关方法
-- @section Render

--- Entity渐隐渐现
-- @tparam bool enable true时候显现，false隐掉
-- @tparam float duration 变化时长
-- @tparam function finishCallback 变化结束时候回调
function EntityActorProxy:PerformDither(enable, duration, finishCallback)
	self.uActor:PerformDither(enable, duration, finishCallback)
end

--- Entity可见或不可见
-- @tparam bool value true可见，false不可见
function EntityActorProxy:SetVisible(value)
	self.uActor:SetVisible(value)
end

--- Entity渐隐销毁
-- @tparam bool isActorOnly只销毁Actor不销毁Entity
-- @tparam float duration 渐隐时长
function EntityActorProxy:DestroyWithDither(isActorOnly, duration)
	self:OnDestroy()
	self.uActor:DestroyWithDither(isActorOnly, duration)
end

--- Entity消失
-- @tparam function finishCallback 消失后的回掉
function EntityActorProxy:Disappear(finishCallback)
	self.uActor:Disappear(finishCallback)
end

--- Entity消失销毁
-- @tparam bool isActorOnly只销毁Actor不销毁Entity
-- @tparam function finishCallback 消失后的回掉
function EntityActorProxy:DestroyWithDisappear(isActorOnly, finishCallback)
	self.uActor:DestroyWithDisappear(isActorOnly, finishCallback)
end

--- Entity直接消失/显示
function EntityActorProxy:SetActive(active)
	self.uActor:SetActive(active)
end

--Render End

--AI相关方法
-- @section AI

function EntityActorProxy:ClearThreatTask()
	self:ClearTask(TaskID.THREAD_TASK_ID)
end

--- 创建一个监测仇恨值的Task
-- @tparam function OnThreatInfo Alert(100%)时候的回调
-- @tparam function OnThreatAware Aware时候的回调
-- @tparam function OnThreatUnaware Unaware时候的回调
-- @tparam function OnThreatInfo info更新时候的回调，会包含一个整合了一帧内所有信息的数据 function XXX:OnThreatInfo(task, info) info.hasSound info.soundPos info.volume
function EntityActorProxy:ThreatTask(OnThreatAlert, OnThreatAware, OnThreatUnaware, OnThreatInfo)
	self:ClearThreatTask()
	local task = self:CreateTask(TaskID.THREAD_TASK_ID, LuaTaskType.THREAT)
	if OnThreatAlert ~= nil then
		task:ThreatAlert('+', OnThreatAlert)
	end
	if OnThreatAware ~= nil then
		task:ThreatAware('+', OnThreatAware)
	end
	if OnThreatUnaware ~= nil then
		task:ThreatUnaware('+', OnThreatUnaware)
	end
	if OnThreatInfo ~= nil then
		task:ThreatInfo('+', OnThreatInfo)
	end
end

--- 创建一个监测仇恨值的Task
-- @tparam function dir 方向
-- @tparam function time 转向时间
-- @tparam function isAnime 是否启用动画
-- @tparam function isbreak 是否打断
function EntityActorProxy:SteerToTask(dir,time,isAnime,isbreak)
	local task=self:CreateTask(TaskID.MOVE_TASK_ID,LuaTaskType.STEER)
	task:StartSteer(dir,time,isAnime,isbreak)
	task:FinishEvent('+',self.DoFreeStateTrigger)
end



--Method End

return EntityActorProxy