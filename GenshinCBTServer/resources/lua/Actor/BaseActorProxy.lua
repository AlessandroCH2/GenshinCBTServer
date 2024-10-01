----------------------
-- 这是Lua端Actor的基类，包含了基础的调用方法.
-- @classmod BaseActorProxy
require('Base/Class')

local BaseActorProxy = class("BaseActorProxy", nil)

--- Actor的运行时别名，别名在同一时段唯一，通过别名可以找到相应的Actor
BaseActorProxy.alias = ""
BaseActorProxy.metaPath = ""
BaseActorProxy.uActor = nil
--- Actor的默认别名，当创建Actor时没有指定别名则用这个字符串作为别名
BaseActorProxy.defaultAlias = ""
--- Actor的当前所在场景
BaseActorProxy.bornSceneID = 3
BaseActorProxy.coroutineDic = {}
--- Actor的自定义数据索引， 数据的获取需要自定义
BaseActorProxy.dataIndex = -1
--- Actor是否自动开始
BaseActorProxy.isAutoStart = true
--- Actor创建用的data
BaseActorProxy.actorData = nil
BaseActorProxy.actorType = ActorType.INVALID
BaseActorProxy.dontDestroyOnClear = false

--- Actor创建后的预初始化，一些需要在初始化前准备的事情可以重写这个方法
function BaseActorProxy:OnPreInit()
end
--- Actor创建后的后初始化，一些需要在初始化后做的的事情可以重写这个方法
function BaseActorProxy:OnPostInit()
	if self.uActor ~= nil then
		self.uActor:TryStartActor()
	end
	self:OnPostDataPrepare()
end
function BaseActorProxy:OnPostDataPrepare()
end
--- Actor创建后的初始化，初始化代码里一般会放一些创建代码
-- @tparam string alias 传入赋予的Actor别名
function BaseActorProxy:OnInit(alias)
	self.alias = alias
end
--- Actor创建后的回调注册代码，也可以放到Start中
function BaseActorProxy:Register()
end
--- Actor创建后确保所有相关初始化做完（包括C#底层）后会调用Start，这是一个Actor行为的入口，几乎一定会重写
function BaseActorProxy:Start()
end
--- Actor的实际处理销毁时做的事情的函数，比如清空一些注册的回调，清空一些引用，一般重写销毁行为的话重写这个函数
function BaseActorProxy:OnDestroy()
end
--- Actor销毁方法，内部会调用OnDestroy，一般不重写
-- @tparam bool isActorOnly 是否只摧毁Actor，例如一个EntityActor，希望将控制权交还给其他模块，就只需要销毁Actor，而不销毁Entity本身
function BaseActorProxy:Destroy(isActorOnly)
	self:OnDestroy()
	self:ClearCoroutine()
	BaseActorProxy.DestroyActor(self.uActor, isActorOnly)
	self.uActor = nil
	self.actorData = nil
end
--- Actor清理世界信息得方法
function BaseActorProxy:ClearInfo()
	if self.uActor ~= nil then
		self.uActor:ClearInfo()
	end
end

function BaseActorProxy:ClearCoroutine()
	for func, co in pairs(self.coroutineDic) do
		self:UnCallFunc(func)
	end
end

BaseActorProxy.DestroyActor = function(uActor, isActorOnly)
	if uActor ~= nil then
		uActor:Destroy(isActorOnly)
	end
end

function BaseActorProxy:IsValid()
	if self.uActor == nil then
		return false
	end
	return self.uActor:IsValid()
end

--- 消息通知方法
-- @section event

--- Actor注册回调得方法
-- @tparam function func 一个待ILuaActor和evt得Handler
function BaseActorProxy:RegisterActorEvent(func)
	self.uActor:OnActorEvent('-', func)
	self.uActor:OnActorEvent('+', func)
end

--- Actor取消回调事件方法
-- @tparam function func 一个待ILuaActor和evt得Handler
function BaseActorProxy:UnregisterActorEvent(func)
	self.uActor:OnActorEvent('-', func)
end

--- Actor通过alias别名将消息通知单个Actor的方法
-- @tparam string alias 想要通知的Actor的别名,
-- @tparam ActorEvtTargetType evtType 通知的类别，SINGLE 或 ALL
-- @tparam bool canRecover 是否能恢复
-- @param ... 参数列表
function BaseActorProxy:NotifyTo(alias, evtType, canRecover, ...)
	if canRecover == nil then
		canRecover = false
	end
	actorUtils.FireEvent(ActorEvtTargetType.SINGLE, alias, evtType, ..., canRecover)
end

--- 操作task方法，task是一个在c#层运行的行为，负责串行和并行的行为执行
-- @section task

--- Actor创建task的方法
-- @tparam int taskQueueID 创建的task将进入哪个串行队列，同一个队列中的依次执行
-- @tparam LuaTaskType taskType 一般都是Normal，其他类型一般是为了性能的特殊实现
-- @treturn LuaTask 返回task引用
function BaseActorProxy:CreateTask(taskQueueID, taskType, tag)
	local task = luaTaskUtils.CreateTask(taskQueueID, taskType, self.uActor, tag)
	return task
end
--- Actor清理task的方法
-- @tparam int taskQueueID 清理taskQueueID对应的队列里的以及正在运行的行为
function BaseActorProxy:ClearTask(taskQueueID)
	self:ClearRunningTask(taskQueueID)
	self:ClearTaskQueue(taskQueueID)
end
--- Actor清理队列中task的方法
-- @tparam int taskQueueID 清理taskQueueID对应的队列里的行为
function BaseActorProxy:ClearTaskQueue(taskQueueID)
	self.uActor:ClearTaskQueue(taskQueueID)
end
--- Actor清理队列中task的方法
-- @tparam int taskQueueID 清理taskQueueID对应的正在运行的行为
function BaseActorProxy:ClearRunningTask(taskQueueID)
	self.uActor:ClearRunningTask(taskQueueID)
end
--- Actor清理所有task的方法
function BaseActorProxy:ClearAllTask()
	self.uActor:ClearAllTask()
end


function BaseActorProxy:ClearFollowTask()
	self:ClearTask(self.MOVE_TASK_ID)
end


--- Actor注册任务Tag暂停回调
-- @tparam string tag 注册对应的Tag，如PlayerCombat，OpenPage等
-- @tparam function pauseCB 无参的回调函数，暂停时调用
-- @tparam function resumeCB 无参的回调函数，恢复时调用
function BaseActorProxy:RegisterTaskTagCB(tag, pauseCB, resumeCB)
	self.uActor:RegisterTaskTagCB(tag, pauseCB, resumeCB)
end


--- Actor取消任务Tag暂停回调
-- @tparam string tag 注册对应的Tag，如PlayerCombat，OpenPage等
-- @tparam function pauseCB 无参的回调函数，暂停时调用
-- @tparam function resumeCB 无参的回调函数，恢复时调用
function BaseActorProxy:UnregisterTaskTagCB(tag, pauseCB, resumeCB)
	self.uActor:UnregisterTaskTagCB(tag, pauseCB, resumeCB)
end

--- Actor暂停对应Tag的所有任务
-- @tparam string tag 注册对应的Tag，如PlayerCombat，OpenPage等
function BaseActorProxy:PauseByTag(tag)
	self.uActor:PauseByTag(tag)
end


--- Actor恢复对应Tag的所有任务,如果有回调则只执行回调
-- @tparam string tag 注册对应的Tag，如PlayerCombat，OpenPage等
function BaseActorProxy:ResumeByTag(tag)
	self.uActor:ResumeByTag(tag)
end

--- Actor恢复对应Tag的所有任务，一般在回调中执行
-- @tparam string tag 注册对应的Tag，如PlayerCombat，OpenPage等
function BaseActorProxy:DelayResumeByTag(tag)
	self.uActor:DelayResumeByTag(tag)
end

--- Actor检测是否任务还被中断
-- @tparam string tag 注册对应的Tag，如Narrator，Lock等
-- @return bool 是否任务还被中断
function BaseActorProxy:HasTaskResumed(tag)
	return self.uActor:HasTaskResumed(tag)
end

--- Actor检测是否还有任务
-- @tparam string tag 注册对应的Tag，如Narrator，Lock等
-- @return bool 是否还有任务
function BaseActorProxy:HasTagTask(tag)
	return self.uActor:HasTagTask(tag)
end



--- Actor清理Actor中的状态
function BaseActorProxy:ClearActor()
	self.uActor:ClearActor()
end

--- 协程延迟和多帧执行的方法，目前实现在c#层
-- @section coroutine

--- Actor在task中延迟执行的方法，需要在task结束时共同结束则需要调用这个方法
-- @tparam float delayTime 延迟时间
-- @tparam function func 执行的函数
-- @tparam LuaTask task task的引用
function BaseActorProxy:DelayInTask(delayTime, func, task)
	local co = self:CallDelay(delayTime, func)
	if task ~= nil and co ~= nil then
		task:SyncCo(co)
	end
end
--- Actor用协程延迟执行的方法
-- @tparam float delayTime 延迟时间
-- @tparam function func 执行的函数
-- @param ... 参数列表
-- @treturn Coroutine 协程引用，用于方便杀掉这个协程
function BaseActorProxy:CallDelay(delayTime, func, ...)
	local cId = -1
	if self == nil and ... == nil then
		cId = self.uActor:CoroutineCall(delayTime, func)
	else
		local paramNum = select('#', ...)
		if paramNum == 0 then
			cId = self.uActor:CoroutineCall1Param(delayTime, func, self, nil)
		elseif paramNum == 1 then
			local param0 = table.unpack({...})
			cId = self.uActor:CoroutineCall1Param(delayTime, func, self, param0)
		elseif paramNum == 2 then
			local param0, param1 = table.unpack({...})
			cId = self.uActor:CoroutineCall2Param(delayTime, func, self, param0, param1)
		elseif paramNum == 3 then
			local param0, param1, param2 = table.unpack({...})
			cId = self.uActor:CoroutineCall3Param(delayTime, func, self, param0, param1, param2)
		end
	end

	if cId ~= -1 then
		self.coroutineDic[func] = cId
	end
	return cId
end
--- Actor停止执行协程的方法
-- @tparam function func 执行的函数
function BaseActorProxy:UnCallFunc(func)
	local cId = self.coroutineDic[func]
	if cId ~= -1 then
		self.uActor:StopCoroutine(cId)
		self.coroutineDic[func] = nil
	end
end
--- Actor停止干所有事情
function BaseActorProxy:Stop()
	self:ClearAllTask()
	self.uActor:StopAllCoroutine()
end

--- 生成Entity的方法
-- @section spawnentity


--- Actor产生怪物的方法
-- @tparam uint configID 怪物模板id
-- @tparam uint level 怪物等级
-- @tparam Vector3 bornPos 怪物出生点坐标
-- @tparam float yaw 怪物Y轴朝向
-- @tparam uint dropID 掉落id
-- @tparam float scale 尺寸
-- @tparam string alias 可选，赋予一个alias供后续操作销毁
-- @tparam uint sceneID 场景ID，默认大世界3
function BaseActorProxy:SpawnMonster(configID, level, bornPos, yaw, dropID, scale, alias, sceneID)
	if sceneID == nil then
		sceneID = sceneData.DefaultSceneID
	end
	-- if sceneID ~= sceneData.currSceneID then
	-- 	return
	-- end
	
	if yaw == nil then
		yaw = 0
	end
	if scale == nil then
		scale = 1.0
	end
	if dropID == nil then 
		dropID = 0
	end
	self.uActor:SpawnMonster(configID, level, bornPos, yaw, dropID, scale, sceneID, alias)
end

--- Actor产生本地展示怪物的方法
-- @tparam string alias 可选，赋予一个alias供后续操作销毁
-- @tparam uint configID 怪物模板id
-- @tparam uint level 怪物等级
-- @tparam Vector3 bornPos 怪物出生点坐标
-- @tparam float yaw 怪物Y轴朝向
-- @tparam uint dropID 掉落id
-- @tparam float scale 尺寸
-- @tparam bool isElite 是否是精英
-- @tparam table affixList 不知道是啥
-- @tparam uint sceneID 场景ID，默认大世界3
function BaseActorProxy:SpawnLocalMonster(alias, configID, level, bornPos, yaw, dropID, scale, isElite, affixList, sceneID)
	if sceneID == nil then
		sceneID = sceneData.DefaultSceneID
	end
	if sceneID ~= sceneData.currSceneID then
		return
	end
	
	if yaw == nil then
		yaw = 0
	end
	if scale == nil then
		scale = 1.0
	end
	if dropID == nil then 
		dropID = 0
	end
	if isElite == nil then
		isElite = false
	end
	self.uActor:SpawnLocalMonster(configID, level, bornPos, yaw, dropID, scale, alias, isElite, affixList)
end

--- Actor产生可拾取物品的方法
-- @tparam uint configID 物品id
-- @tparam Vector3 bornPos 物品出生点坐标
-- @tparam float yaw 物品Y轴超想
-- @tparam string alias 可选，赋予一个alias供后续操作销毁
-- @tparam uint sceneID 场景ID，默认大世界3
function BaseActorProxy:SpawnItem(configID, bornPos, yaw, alias, sceneID)
	if sceneID == nil then
		sceneID = sceneData.DefaultSceneID
	end
	-- if sceneID ~= sceneData.currSceneID then
	-- 	return
	-- end

	if yaw == nil then
		yaw = 0
	end
	if alias == nil then
		alias = ""
	end
	self.uActor:SpawnItem(configID, bornPos, yaw, sceneID, alias)
end

--- Actor产生本地物品的方法
-- @tparam string alias 可选，赋予一个alias供后续操作销毁
-- @tparam uint configID 物品id
-- @tparam Vector3 bornPos 物品出生点坐标
-- @tparam float yaw 物品Y轴超想
-- @tparam uint sceneID 场景ID，默认大世界3
function BaseActorProxy:SpawnLocalItem(alias, configID, bornPos, yaw, sceneID)
	if sceneID == nil then
		sceneID = sceneData.DefaultSceneID
	end
	if sceneID ~= sceneData.currSceneID then
		return
	end

	if yaw == nil then
		yaw = 0
	end
	if alias == nil then
		alias = ""
	end
	self.uActor:SpawnLocalItem(configID, bornPos, yaw, alias)
end

--- Actor产生Gadget的方法
-- @tparam uint configID 东西的id
-- @tparam Vector3 bornPos 生成的坐标
-- @tparam Vector3 bornDir 生成的朝向，这里是euler角
-- @tparam string alias 可选，赋予一个alias供后续操作销毁
-- @tparam uint sceneID 场景ID，默认大世界3
-- @tparam uint dropId 掉落物ID
function BaseActorProxy:SpawnGadget(configID, bornPos, bornDir, alias, sceneID, dropId)
	if sceneID == nil then
		sceneID = sceneData.DefaultSceneID
	end
	-- if sceneID ~= sceneData.currSceneID then
	-- 	return
	-- end
	if alias == nil then
		alias = ""
	end
	if dropId == nil then
		dropId = 0
	end
	self.uActor:SpawnGadget(configID, bornPos, bornDir, sceneID, alias, dropId)
end

--- Actor产生本地Gadget的方法
-- @tparam string alias 可选，赋予一个alias供后续操作销毁
-- @tparam uint configID 东西的id
-- @tparam Vector3 bornPos 生成的坐标
-- @tparam Vector3 bornDir 生成的朝向，这里是euler角
-- @tparam uint sceneID 场景ID，默认大世界3
function BaseActorProxy:SpawnLocalGadget(alias, configID, bornPos, bornDir, sceneID)
	if sceneID == nil then
		sceneID = sceneData.DefaultSceneID
	end
	if sceneID ~= sceneData.currSceneID then
		return
	end

	if alias == nil then
		alias = ""
	end
	self.uActor:SpawnLocalGadget(configID, bornPos, bornDir, alias)
end

--- Actor产生宝箱的方法
-- @tparam uint configID 东西的id
-- @tparam Vector3 bornPos 生成的坐标
-- @tparam Vector3 bornDir 生成的朝向，这里是euler角
-- @tparam string alias 可选，赋予一个alias供后续操作销毁
-- @tparam uint sceneID 场景ID，默认大世界3
-- @tparam uint chestDropId 宝箱掉落ID
-- @tparam bool isShowCutscene 是否播cutscene
function BaseActorProxy:SpawnChest(configID, bornPos, bornDir, alias, sceneID, chestDropId, isShowCutscene)
	if sceneID == nil then
		sceneID = sceneData.DefaultSceneID
	end
	if alias == nil then
		alias = ""
	end
	if chestDropId == nil then
		chestDropId = 0
	end
	if isShowCutscene == nil then
		isShowCutscene = false
	end
	self.uActor:SpawnChest(configID, bornPos, bornDir, sceneID, alias, chestDropId, isShowCutscene)
end

--- Actor销毁entity的方法
-- @tparam string alias 别名
function BaseActorProxy:UnSpawn(alias)
	local runtimeID = actorMgr:GetEntityHandler(alias)
	if runtimeID == 0 or runtimeID == nil then
		return
	end
	self.uActor:UnSpawnEntity(runtimeID, alias)
end

--- 操作Cutscene的方法
-- @section cutscene

--- Actor播放Cutscene的方法
-- @tparam ConfigTimeline config 一个ConfigTimeline的配置结构体
-- @tparam function OnFinish 结束后的回调函数，定义需要包含一个actor（self）的参数
-- @tparam function OnStart 开始后的回调函数，这里是真正开始，定义需要包含一个actor（self）的参数
-- @tparam function OnDestroy 断线重连等销毁时候回调函数，定义需要包含一个actor（self）的参数
function BaseActorProxy:PlayCutscene(config, OnFinish, OnStart, OnDestroy)
	self.uActor:PlayCutscene(config, OnFinish, OnStart, OnDestroy)
end

--- 自己监听昼夜变化的方法
-- @section daynight

--- Actor自己监听到白天的方法
-- @tparam function dayCallback 注册到白天的回调函数，定义需要包含一个actor（self）的参数
function BaseActorProxy:RegisterSelfDayTime(dayCallback)
	self.uActor:RegisterSelfDayTime(dayCallback)
end
--- Actor自己取消监听到白天的方法
-- @tparam function dayCallback 注册到白天的回调函数，定义需要包含一个actor（self）的参数
function BaseActorProxy:UnregisterSelfDayTime(dayCallback)
	self.uActor:UnregisterSelfDayTime(dayCallback)
end

--- Actor自己监听到黑夜的方法
-- @tparam function nightCallback 注册到黑夜的回调函数，定义需要包含一个actor（self）的参数
function BaseActorProxy:RegisterSelfNightTime(nightCallback)
	self.uActor:RegisterSelfNightTime(nightCallback)
end
--- Actor自己取消监听到黑夜的方法
-- @tparam function nightCallback 注册到黑夜的回调函数，定义需要包含一个actor（self）的参数
function BaseActorProxy:UnregisterSelfNightTime(nightCallback)
	self.uActor:UnregisterSelfNightTime(nightCallback)
end

--- 自己监听天气变化的方法
-- @section weather

--- Actor自己监听天气变化的方法
-- @tparam function weatherCallback 注册到天气变化的回调函数，定义需要包含一个actor（self）和一个天气类别的整数值的参数
function BaseActorProxy:RegisterSelfWeatherChange(weatherCallback)
	self.uActor:RegisterSelfWeatherChange(weatherCallback)
end
--- Actor自己取消监听到黑夜的方法
-- @tparam function weatherCallback 注册到天气变化的回调函数，定义需要包含一个actor（self）和一个天气类别的整数值的参数
function BaseActorProxy:UnregisterSelfWeatherChange(weatherCallback)
	self.uActor:UnregisterSelfWeatherChange(weatherCallback)
end

--- Actor自己监听小时变化的方法
-- @tparam function hourCallback 注册到小时变化的回调函数，定义需要包含一个actor(self)和一个hour整数值参数
function BaseActorProxy:RegisterSelfHour(hourCallback)
	self.uActor:RegisterSelfHour(hourCallback)
end
--- Actor自己取消监听小时变化的方法
-- @tparam function hourCallback 注册到小时变化的回调函数，定义需要包含一个actor(self)和一个hour整数值参数
function BaseActorProxy:UnregisterSelfHour(hourCallback)
	self.uActor:UnregisterSelfHour(hourCallback)
end

--- Actor返回当前关卡时间
-- @return float 当前关卡时间，0-24小时
function BaseActorProxy:GetLevelTime()
	return self.uActor:GetLevelTime()
end

--- 倒计时UI的方法
-- @section count_down_UI

--- 创建倒计时UI的方法
-- @tparam float duration 倒计时总时间
-- @tparam float warningLimit 开始警告的时间
-- @tparam float readyDuration 准备时间
function BaseActorProxy:CountDownUIStart(duration, warningLimit, readyDuration)
	if readyDuration == nil then
		readyDuration = 0
	end
	self.uActor:CountDownUIStart(duration, warningLimit, readyDuration)
end

--- 中止倒计时UI的方法
function BaseActorProxy:CountDownUITerminate()
	self.uActor:CountDownUITerminate()
end

--- 计数UI的方法
-- @section count_num_UI

--- 创建计数UI的方法
function BaseActorProxy:CountNumUIStart()
	self.uActor:CountNumUIStart()
end

--- 更新计数UI的方法
-- @tparam float num 更新的数量
function BaseActorProxy:CountNumUIUpdate(num)
	self.uActor:CountNumUIUpdate(num)
end

--- 结束计数UI的方法
function BaseActorProxy:CountNumUITerminate()
	self.uActor:CountNumUITerminate()
end

--- 显示任务强制结束UI的方法
function BaseActorProxy:ShowQuestQuitUI(questID)
	self.uActor:ShowQuestQuit(questID)
end

--- 隐藏任务强制结束UI的方法
function BaseActorProxy:HideQuestQuitUI()
	self.uActor:HideQuestQuit()
end

--- 其他UI界面唤出方法
-- @section otherUI

--- 显示队伍界面的方法
-- @tparam bool showExitDialog 是否显示二次确认
function BaseActorProxy:ShowTeamPage(showExitDialog, callback, showTutorialId)
	self.uActor:ShowTeamPage(showExitDialog, callback, showTutorialId)
end

--- 显示黑屏的方法
-- @tparam float durationToBlack 进入黑屏的时间
-- @tparam float durationKeepBlack 保持黑屏的时间
-- @tparam float durationFromBlack 离开黑屏的时间
-- @tparam Action callback 保持黑屏开始时执行回调
-- @tparam Action finishCallback 黑屏结束时执行回调
-- @tparam CurtainTask task 传送黑屏时执行的任务，需要等task结束黑屏才能亮起
function BaseActorProxy:ShowBlackScreen(durationToBlack, durationKeepBlack, durationFromBlack, callback, finishCallback, task)
	self.uActor:ShowBlackScreen(durationToBlack, durationKeepBlack, durationFromBlack, callback, finishCallback, task)
end

--- 显示教程界面的方法
-- @tparam string tutorialImgName 教程图片的名字
-- @tparam Action callback 教程图片的名字
function BaseActorProxy:ShowTutorialDialog(tutorialId, callback)
	self.uActor:ShowTutorialDialog(tutorialId, callback)
end

--- 显示主界面走路状态切换按钮方法
-- @tparam bool show 是否显示按钮
function BaseActorProxy:TryShowMoveToggle(show)
	self.uActor:TryShowMoveToggle(show)
end


--- 影音相关的方法
-- @section audio

--- 播放声音
-- @tparam string evtName 声音事件名字
function BaseActorProxy:PlayAudio(evtName)
	self.uActor:PlayAudio(evtName)
end

--- 切换BGM state
-- @tparam string stateGrp 状态组名-找max要，将这个名字写在clientConfigData配置里
-- @tparam string state 状态名-找max要，将这个名字写在clientConfigData配置里
function BaseActorProxy:PlayAudioState(stateGrp, state)
	self.uActor:PlayAudioState(stateGrp, state)
end

--- 播放一个Free Cutscene
-- @tparam table cfg Timeline的配置, 参考json格式
-- @tparam LuaActor owner 这个Cutscene的主体
-- @tparam function OnFinish Timeline完成后调用
function BaseActorProxy:PlayFreeCutscene(cfg, owner, OnFinish)
	self.uActor:PlayFreeCutscene(cfg, owner, OnFinish)
end

--- 停止一个Free Cutscene
-- @tparam table cfg Timeline的配置, 参考json格式
-- @tparam bool force 是否强制停止，如果强制停止则不会执行OnFinish
	function BaseActorProxy:StopFreeCutscene(cfg, force)
		self.uActor:StopFreeCutscene(cfg, force)
	end

--- 播放视频
-- @tparam string videoName 视频名称(带后缀)
-- @tparam uint subtitleId 视频字幕在Localization表中的ID，没有填nil
-- @tparam Action finishCallBack 视频结束回调
-- @tparam Color bgColor 背景颜色
function BaseActorProxy:TryPlayVideo(videoName, subtitleId, canSkip, finishCallBack, bgColor)
	if subtitleId == nil then
		subtitleId = 0
	end
	if bgColor == nil then
		bgColor = M.Color(0, 0, 0, 1)
	end
	self.uActor:TryPlayVideo(videoName, subtitleId, canSkip, finishCallBack, bgColor)
end

--- 特效相关的方法
-- @section effect

--- 播放特效
function BaseActorProxy:PlayEffect(patternName, pos, euler, scale, followTrans)
	if euler == nil then
		euler = M.Pos(0, 0, 0)
	end
	if scale == nil then
		scale = M.Pos(1, 1, 1)
	end
	self.uActor:PlayEffect(patternName, pos, euler, scale, followTrans)
end

--- 镜头相关方法
-- @section camera

--- 进入场景镜头
-- @tparam Vector3 targetPos 目标点
-- @tparam float offsetY y轴偏移
-- @tparam float duration 持续时间, 负值无限，否则到了时间自动退出
-- @tparam bool forceLook 无法打断
-- @tparam bool recoverKeepCurrent 保持x分量朝向
function BaseActorProxy:EnterSceneLookCamera(targetPos, offsetY, duration, forceLook, recoverKeepCurrent)
	if recoverKeepCurrent == nil then
		recoverKeepCurrent = false
	end
	self.uActor:EnterSceneLookCamera(targetPos, offsetY, duration, forceLook, recoverKeepCurrent)
end

--- 进入场景镜头，看一个alias trans
-- @tparam string alias 编辑器里预先挂好的MonoAliasTransHelper节点
-- @tparam float offsetY y轴偏移
-- @tparam float duration 持续时间, 负值无限，否则到了时间自动退出
-- @tparam bool forceLook 无法打断
function BaseActorProxy:EnterSceneLookCameraByAlias(alias, offsetY, duration, forceLook, recoverKeepCurrent)
	if recoverKeepCurrent == nil then
		recoverKeepCurrent = false
	end
	self.uActor:EnterSceneLookCameraByAlias(alias, offsetY, duration, forceLook, recoverKeepCurrent)
end

--- 退出场景镜头
function BaseActorProxy:ExitSceneLookCamera()
	self.uActor:ExitSceneLookCamera()
end

--- 任务相关的方法
-- @section quest

--- 强制对话
-- @tparam string alias 别名
function BaseActorProxy:RequestInteraction(alias)
	self.uActor:RequestInteraction(alias)
end

--- 添加交互结束黑屏时候回调，没有黑屏的话就比安全回调早一点
-- @tparam function handler 回调，带一个luaActor参数
function BaseActorProxy:ActionPreSafeCall(handler)
	self.uActor:ActionPreSafeCall(handler)
end

--- 添加交互安全回调，保证在关键交互结束后调用
-- @tparam function handler 回调，带一个luaActor参数
function BaseActorProxy:ActionSafeCall(handler)
	self.uActor:ActionSafeCall(handler)
end

--- 获取子任务状态，如果任务不存在则返回QuestState.QUEST_STATE_NONE
-- @tparam uint questId 子任务id
function BaseActorProxy:GetSubQuestState(questId)
	return self.uActor:GetSubQuestState(questId)
end

--- Actor传送玩家到
-- @tparam Vector3 targetPos 传送坐标
-- @tparam Vector3 targetRot 传送后的朝向
-- @tparam function tcallback 传送完成后的回调
-- @tparam function tfinishcallback 传送到黑屏时候的回调
-- @tparam CurtainTask task 传送黑屏时执行的任务，需要等task结束黑屏才能亮起
-- @return bool 返回该次传送是否成功
function BaseActorProxy:TransmitPlayer(sceneId, pos, rot, tcallback, tfinishcallback, task)
	return self.uActor:TryTransmitPlayer(sceneId, pos, rot, tcallback, tfinishcallback, task)
end

--- Actor打开命名对话框
-- @tparam callback 对话框关闭回调
function BaseActorProxy:ShowNameDialog(callback)
	self.uActor:TryShowNameDialog(callback)
end

--- Actor说旁白对话
-- @tparam uint dialogID 
function BaseActorProxy:SayNarrator(dialogID)
	self.uActor:SayNarrator(dialogID)
end

--- Actor停止旁白对话
function BaseActorProxy:StopNarrator()
	self.uActor:StopNarrator()
end

--- Actor说旁白对话
-- @tparam uint reminderID 
-- @tparam uint dialogID 
function BaseActorProxy:SayReminder(reminderID, dialogID)
	return self.uActor:SayReminder(reminderID, dialogID)
end

--- Actor说旁白对话
-- @tparam uint reminderID 
-- @tparam uint dialogID 
function BaseActorProxy:GetShowReminder(reminderID, dialogID)
	return self.uActor:GetShowReminder(reminderID, dialogID)
end

--- Actor获得旁白对话延时
-- @tparam uint reminderID 
function BaseActorProxy:GetReminderDelay(dialogID)
	return self.uActor:GetReminderDelay(dialogID)
end

--- Actor停止旁白对话
function BaseActorProxy:StopReminder(reminderID)
	self.uActor:StopReminder(reminderID)
end

--- Actor说旁白对话
-- @tparam uint dialogID 
function BaseActorProxy:SayWarningNarrator(dialogID)
	self.uActor:SayWarningNarrator(dialogID)
end

--- Actor停止旁白对话
function BaseActorProxy:StopWarningNarrator()
	self.uActor:StopWarningNarrator()
end

--- Actor TriggerLevel的Abitlity
function BaseActorProxy:TriggerLevelAbility(abilityName)
	self.uActor:TriggerLevelAbility(abilityName)
end

BaseActorProxy.CurrDialogList = nil
BaseActorProxy.CurrDialogIndex = 1
BaseActorProxy.CurrDuration = 0
BaseActorProxy.CurrDurationCnt = 0
BaseActorProxy.NarratorPauseLen = 10
BaseActorProxy.NarratorResumeLen = 5
BaseActorProxy.NarratorState = NarratorState.ING
BaseActorProxy.NarratorOnFinish = nil
BaseActorProxy.ReminderID = nil
function BaseActorProxy:PerformNarrator()
	if self.CurrDialogList == nil then
		return false
	end
	local dialogNum = #(self.CurrDialogList)
	if self.CurrDialogIndex > dialogNum then
		return false
	end

	local currDialog = self.CurrDialogList[self.CurrDialogIndex]
	if currDialog == nil then
		return false
	end

	local dialogID = currDialog.dialogID
	self.ReminderID = currDialog.reminderID
	self.CurrDurationCnt = 0

	if self.ReminderID ~= nil then
		currDialog.dialogID = self:GetShowReminder(self.ReminderID, dialogID)
		if currDialog.dialogID == 0 then
			self:StopReminder(self.ReminderID)
			self.ReminderID = nil
			self.CurrDialogIndex = self.CurrDialogIndex + 1
			return self:PerformNarrator()
		end
		self.CurrDialogIndex = self.CurrDialogIndex - 1
		if dialogID == nil then
			self.CurrDuration = self:GetReminderDelay(currDialog.dialogID)
		end
		if dialogID ~= nil or self.CurrDuration == 0 then			
			self.CurrDuration = self:SayReminder(self.ReminderID, currDialog.dialogID)
		end
	elseif dialogID ~= nil then
		self.CurrDuration = currDialog.duration
		local audioEvtName = currDialog.audioEvtName
		self:SayNarrator(dialogID)
		if audioEvtName ~= nil and audioEvtName ~= "" then
			self:PlayAudio(audioEvtName)
		end
	end
	return true
end

function BaseActorProxy:StopPerformNarrator()
	if self.ReminderID ~= nil then
		self:StopReminder(self.ReminderID)
	else
		self:StopNarrator()
	end
end

function BaseActorProxy:StartNarrator(task)
	self.NarratorState = NarratorState.ING
	if self:IsSayingWarningNarrator() == true then 
		self.CurrDialogIndex = 0
		return
	end
	self.CurrDialogIndex = 1
	if self:PerformNarrator() ~= true then
		task:FinishTask()
	end
end

function BaseActorProxy:ResumeNarrator(task)
	self.CurrDuration = 0
end

function BaseActorProxy:PauseNarrator(task)
	self:StopPerformNarrator()
end

function BaseActorProxy:FinishNarrator(task)
	self:StopPerformNarrator()
	if self.NarratorOnFinish ~= nil then
		self.NarratorOnFinish(self, task);
	end
end

function BaseActorProxy:CheckNarratorOnly(task, deltaTime)
	--print("CheckNarratorOnly", self:IsSayingWarningNarrator(), self.NarratorState, self.CurrDialogIndex, self.CurrDurationCnt, self.CurrDuration)

	self.CurrDurationCnt = self.CurrDurationCnt + deltaTime

	if self.NarratorState == NarratorState.PAUSING then
		if self.CurrDurationCnt >= self.CurrDuration then
			self:StopPerformNarrator()
		end
	end
	if self:IsSayingWarningNarrator() == true then 
		return
	end
	if self.NarratorState == NarratorState.ING then
		if self.CurrDurationCnt >= self.CurrDuration then
			self.CurrDialogIndex = self.CurrDialogIndex + 1
			if self:PerformNarrator() ~= true then
				self:StopPerformNarrator()
				self.NarratorState = NarratorState.PAUSING
				task:FinishTask()
				return
			end
		end
	end
end
function BaseActorProxy:ShowMessage(content)
	actorUtils.ShowMessage(content)
end

function BaseActorProxy:CheckNarrator(task, deltaTime)
	--print("CheckNarrator", self:IsSayingWarningNarrator(), self.NarratorState, self.CurrDialogIndex, self.CurrDurationCnt, self.CurrDuration)

	self.CurrDurationCnt = self.CurrDurationCnt + deltaTime

	if self.NarratorState == NarratorState.PAUSING then
		if self.CurrDurationCnt >= self.CurrDuration then
			self:StopPerformNarrator()
		end
	end
	if self:IsSayingWarningNarrator() == true then 
		return
	end

	local selfPos = self:GetPos()
	local avatarPos = actorUtils.GetAvatarPos()
	local currLen = M.Dist(selfPos, avatarPos)
	--print("CheckNarrator Distance ", currLen, self.NarratorPauseLen, self.NarratorResumeLen)
	if self.NarratorPauseLen >= 0 and currLen > self.NarratorPauseLen then
		if self.NarratorState == NarratorState.ING then
			self.NarratorState = NarratorState.PAUSING
		end
	elseif currLen <= self.NarratorResumeLen then
		if self.NarratorState == NarratorState.PAUSING then
			self.NarratorState = NarratorState.ING
		end
	end
	
	if self.NarratorState == NarratorState.ING then
		if self.CurrDurationCnt >= self.CurrDuration then
			self.CurrDialogIndex = self.CurrDialogIndex + 1
			if self:PerformNarrator() ~= true then
				task:FinishTask()
				self:StopPerformNarrator()
				self.NarratorState = NarratorState.PAUSING
				return
			end
		end
	end
end

BaseActorProxy.WarningNarratorTable = {}


function BaseActorProxy:StartWarningNarrator(task)
end

function BaseActorProxy:PerformWarningNarrator(curTaskTable)
	if curTaskTable.WarningDialogList == nil then
		return false
	end
	local dialogNum = #(curTaskTable.WarningDialogList)
	if curTaskTable.WarningDialogIndex > dialogNum then
		return false
	end

	local currDialog = curTaskTable.WarningDialogList[curTaskTable.WarningDialogIndex]
	if currDialog == nil then
		return false
	end

	local dialogID = currDialog.dialogID
	curTaskTable.WarningDuration = currDialog.duration
	curTaskTable.WarningDurationCnt = 0
	local audioEvtName = currDialog.audioEvtName

	curTaskTable.StopNarratorFlag = false
	self:SayWarningNarrator(dialogID)
	if audioEvtName ~= nil and audioEvtName ~= "" then
		self:PlayAudio(audioEvtName)
	end
	return true
end

function BaseActorProxy:IsSayingWarningNarrator()
	for k,v in pairs(self.WarningNarratorTable) do  
		if v.WarningNarratorState == NarratorState.ING then
			return true
		end
	end
	return false
end

function BaseActorProxy:CheckStopWarningNarrator()
	for k,v in pairs(self.WarningNarratorTable) do  
		if v.StopNarratorFlag == false then
			return
		end
	end
	self:StopWarningNarrator()
end

function BaseActorProxy:CheckWarningNarrator(task, deltaTime)
	local curTaskTable = self.WarningNarratorTable[task.taskQueueID]

	curTaskTable.WarningDurationCnt = curTaskTable.WarningDurationCnt + deltaTime

	--print("CheckWarningNarrator ", curTaskTable.StopNarratorFlag, curTaskTable.WarningNarratorState, 
	--		curTaskTable.WarningDialogIndex, curTaskTable.WarningDurationCnt, curTaskTable.WarningDuration)

	if curTaskTable.OnCheckSpeak(self) == true then
			
		if curTaskTable.WarningNarratorState == NarratorState.PAUSING then
			curTaskTable.WarningNarratorState = NarratorState.ING
		end
	else
		if curTaskTable.WarningNarratorState == NarratorState.ING then
			curTaskTable.WarningNarratorState = NarratorState.PAUSING
		end
	end

	if curTaskTable.WarningNarratorState == NarratorState.PAUSING then
		if curTaskTable.StopNarratorFlag == false and curTaskTable.WarningDurationCnt >= curTaskTable.WarningDuration then
			curTaskTable.StopNarratorFlag = true
			self:CheckStopWarningNarrator()
			curTaskTable.WarningDurationCnt = 0
		end
	elseif curTaskTable.WarningNarratorState == NarratorState.ING then
		if curTaskTable.WarningDurationCnt >= curTaskTable.WarningDuration then
			curTaskTable.WarningDialogIndex = curTaskTable.WarningDialogIndex + 1

			if self:PerformWarningNarrator(curTaskTable) ~= true then
				curTaskTable.WarningDialogIndex = 0
			end
		end
	end
end

function BaseActorProxy:ResumeWarningNarrator(task)
	local curTaskTable = self.WarningNarratorTable[task.taskQueueID]
	curTaskTable.WarningDuration = 0

	if curTaskTable.OnCheckSpeak(self) == true then
		if curTaskTable.WarningNarratorState == NarratorState.PAUSING then
			curTaskTable.WarningNarratorState = NarratorState.ING
		end
	else
		if curTaskTable.WarningNarratorState == NarratorState.ING then
			curTaskTable.WarningNarratorState = NarratorState.PAUSING
		end
	end

	--print("ResumeWarningNarrator ", curTaskTable.StopNarratorFlag, curTaskTable.WarningNarratorState, 
	--	curTaskTable.WarningDialogIndex, curTaskTable.WarningDurationCnt, curTaskTable.WarningDuration)

	if curTaskTable.WarningNarratorState == NarratorState.PAUSING then
		if curTaskTable.StopNarratorFlag == false then
			curTaskTable.StopNarratorFlag = true
			self:CheckStopWarningNarrator()
		end
	elseif curTaskTable.WarningNarratorState == NarratorState.ING then
		if self:PerformWarningNarrator(curTaskTable) ~= true then
			curTaskTable.WarningDialogIndex = 0
		end
	end
end

function BaseActorProxy:PauseWarningNarrator(task)
	local curTaskTable = self.WarningNarratorTable[task.taskQueueID]
	curTaskTable.StopNarratorFlag = true
	self:CheckStopWarningNarrator()
end

function BaseActorProxy:DestroyWarningNarrator(task)
	local curTaskTable = self.WarningNarratorTable[task.taskQueueID]
	curTaskTable.StopNarratorFlag = true
	self:CheckStopWarningNarrator()
	if curTaskTable.OnFinish ~= nil then
		curTaskTable.OnFinish(self, task)
	end
end

function BaseActorProxy:ClearNarratorTask()
	self:ClearTask(TaskID.NARRATOR_TASK_ID)
end

--- Actor持续说旁白的任务
-- @tparam table dialogList {{dialogID, delayTime}, ..., {dialogID, delayTime}}
-- @tparam float pauseLen 超过这个距离暂停旁白，如果是负数则不会暂停
-- @tparam float resumeLen 小于这个距离再次开始旁白
-- @tparam function OnFinish task结束后执行的回调 
-- @tparam string task的Tag 比如Narrator
function BaseActorProxy:NarratorTask(dialogList, pauseLen, resumeLen, OnFinish, tag)
	self:ClearNarratorTask()
	if #dialogList < 0 then return nil end
	print("NarratorTask", dialogList[1].dialogID)
	self.CurrDialogList = dialogList
	if pauseLen ~= nil then
		self.NarratorPauseLen = pauseLen
	end
	if resumeLen ~= nil then
		self.NarratorResumeLen = resumeLen
	end
	self.NarratorOnFinish = OnFinish
	if tag == nil then tag = "Talk" end
	local task = self:CreateTask(TaskID.NARRATOR_TASK_ID, LuaTaskType.NORMAL, tag)
	task:StartEvent('+', self.StartNarrator)
	task:TickEvent('+', self.CheckNarrator)
	task:ResumeEvent('+', self.ResumeNarrator)
	task:PauseEvent('+', self.PauseNarrator)
	task:FinishEvent('+', self.FinishNarrator)

end

--- Actor持续说旁白的任务
-- @tparam table data 包含旁白相关的各种参数
-- @tparam function OnFinish task结束后执行的回调
function BaseActorProxy:NarratorTaskByData(data, OnFinish)
	self:NarratorTask(data.dialogList, data.pauseLen, data.resumeLen, OnFinish, data.tag)
end

--- Actor持续说旁白的任务
-- @tparam table dialogList {{dialogID, delayTime}, ..., {dialogID, delayTime}}
-- @tparam function OnFinish task结束后执行的回调
-- @tparam string task的Tag 比如Narrator
function BaseActorProxy:NarratorOnlyTask(dialogList, OnFinish, tag)
	self:ClearNarratorTask()
	if #dialogList < 0 then return nil end
	print("NarratorOnlyTask", dialogList[1].dialogID)
	self.CurrDialogList = dialogList
	self.NarratorOnFinish = OnFinish
	if tag == nil then tag = "Talk" end
	local task = self:CreateTask(TaskID.NARRATOR_TASK_ID, LuaTaskType.NORMAL, tag)
	task:StartEvent('+', self.StartNarrator)
	task:TickEvent('+', self.CheckNarratorOnly)
	task:ResumeEvent('+', self.ResumeNarrator)
	task:PauseEvent('+', self.PauseNarrator)
	task:FinishEvent('+', self.FinishNarrator)
end

--- Actor持续说旁白的任务
-- @tparam table data 旁白数据
-- @tparam function OnFinish task结束后执行的回调
function BaseActorProxy:NarratorOnlyTaskByData(data, OnFinish)
	self:NarratorOnlyTask(data, OnFinish)
end

--- NpcActor功能性台词的任务，可以配多个，同时执行
-- @tparam int index task的index，0,1,2,3,4可以累加，相同数字覆盖
-- @tparam table dialogList {{dialogID, delayTime}, ..., {dialogID, delayTime}} 
-- @tparam func OnCheckSpeak 返回true说功能性台词, false停止
-- @tparam function OnFinish task结束后执行的回调
-- @tparam string task的Tag 比如Narrator
-- !!!!! 特别注意，该任务不会自动结束，需要手动结束，手动结束，手动结束 ！！！
function BaseActorProxy:WarningNarratorTask(index, dialogList, OnCheckSpeak, OnFinish, tag)
	if #dialogList < 0 then return nil end

	--print("WarningNarratorTask", dialogList[1].dialogID)
	local questID = index + TaskID.WARNING_TASK_ID;
	self.WarningNarratorTable[questID] = {}
	local curTaskTable = self.WarningNarratorTable[questID]
	if curTaskTable.WarningDuration == nil then
		curTaskTable.WarningDuration = 0
	end
	curTaskTable.WarningDurationCnt = 0
	curTaskTable.WarningDialogList = dialogList
	curTaskTable.OnCheckSpeak = OnCheckSpeak
	curTaskTable.WarningDialogIndex = 0
	curTaskTable.StopNarratorFlag = true
	curTaskTable.WarningNarratorState = NarratorState.PAUSING
	curTaskTable.OnFinish = OnFinish
	if tag == nil then tag = "Talk" end
	local task = self:CreateTask(questID, LuaTaskType.NORMAL, tag)	
	task:StartEvent('+', self.StartWarningNarrator)
	task:TickEvent('+', self.CheckWarningNarrator)
	task:PauseEvent('+', self.PauseWarningNarrator)
	task:ResumeEvent('+', self.ResumeWarningNarrator)
	task:DestroyEvent('+', self.DestroyWarningNarrator)

	return task
end

--- 设置LocalAvatar位置
-- @tparam Vector3 pos 位置绝对坐标
function BaseActorProxy:SetAvatarPos(pos)
	self.uActor:SetAvatarPos(pos)
end


-- 更改OpenState方法
-- 更改玩家功能的开启状态
-- @tparam OpenStateType openStateType 开启状态类型
-- @tparam bool active 开启状态
function BaseActorProxy:SetOpenState(openStateType, active)
	self.uActor:SetOpenState(openStateType, active)
end

-- 开启/屏蔽 角色输入
-- @tparam enable true or false
function BaseActorProxy:EnablePlayerInput(enable)
	self.uActor:EnablePlayerInput(enable)
end

-- ShowPage方法
-- 显示UIPage
-- @tparam pageName PageContext的名字
function BaseActorProxy:ShowPage(pageName)
	self.uActor:ShowPage(pageName)
end

-- 调用当前Page的方法
-- @tparam funcName 方法的名字
-- @return bool 是否成功
function BaseActorProxy:InvokePageFunction(funcName)
	return self.uActor:InvokePageFunction(funcName)
end

-- BackPage方法
-- 关闭当前Page
function BaseActorProxy:BackPage(pageName)
	self.uActor:BackPage(pageName)
end

--- 交互相关回调
-- @section interaction
function BaseActorProxy:InvokeOnInteraction(param)
end

--- 开启潜入模式
-- @tparam sensingRange 玩家的感知半径
function BaseActorProxy:EnterSneakMode(sensingRange)
	self.uActor:EnterSneakMode(sensingRange)
end

--- 关闭潜入模式
function BaseActorProxy:ExitSneakMode()
	self.uActor:ExitSneakMode()
end

--- 开启Bomber模式
function BaseActorProxy:EnterBomberMode()
	self.uActor:EnterBomberMode()
end

--- 关闭Bomber模式
function BaseActorProxy:ExitBomberMode()
	self.uActor:ExitBomberMode()
end

--- 触发Npc气泡对话
-- @tparam uint npcID NpcID
-- @tparam uint dialogID 对话ID
function BaseActorProxy:TriggerNpcSpeechBubble(npcID, dialogID)
	self.uActor:TriggerNpcSpeechBubble(npcID, dialogID)
end

--- 清除Npc气泡对话
-- @tparam uint npcID NpcID
function BaseActorProxy:ClearNpcSpeechBubble(npcID)
	self.uActor:ClearNpcSpeechBubble(npcID)
end

--- 注册玩家坐下回调
-- @tparam function func 一个没参数的函数
function BaseActorProxy:CallOnAvatarSit(func)
	actorUtils.CallOnAvatarSit(func)
end

--- 注册玩家站起来回调
-- @tparam function func 一个没参数的函数
function BaseActorProxy:CallOnAvatarStand(func)
	actorUtils.CallOnAvatarStand(func)
end

--Method End
BaseActorProxy.TaskOnResumeDelay = 1
BaseActorProxy.TaskOnPauseReminder = 0
BaseActorProxy.TaskOnResumeReminder = 0
function BaseActorProxy:StopRealReminder() 
	self:StopReminder(self.TaskOnPauseReminder)
end

function BaseActorProxy:StopPlayerCombat() 
	self:StopReminder(self.TaskOnResumeReminder)
	self:DelayResumeByTag("PlayerCombat")
end

function BaseActorProxy:StopOpenPage() 
	self:StopReminder(self.TaskOnResumeReminder)
	self:DelayResumeByTag("OpenPage")
end

function BaseActorProxy:PlayerCombatOnPause() 
	local delay = self:SayReminder(self.TaskOnPauseReminder, self:GetShowReminder(self.TaskOnPauseReminder, 0))
	self:CallDelay(delay, self.StopRealReminder)
end

function BaseActorProxy:PlayerCombatOnResume() 
	if self:HasTaskResumed("Story") == false then return end
	-- self.NarratorState == NarratorState.PAUSING
	if self:HasTagTask("Story") == false then self:DelayResumeByTag("PlayerCombat") return end
	
	local delay = self:SayReminder(self.TaskOnResumeReminder, self:GetShowReminder(self.TaskOnResumeReminder, 0))
	self:CallDelay(delay, self.StopPlayerCombat)
end

function BaseActorProxy:OpenPageOnResume() 
	if self:HasTaskResumed("Story") == false then return end
	-- self.NarratorState == NarratorState.PAUSING
	if self:HasTagTask("Story") == false then self:DelayResumeByTag("OpenPage") return end
	
	local delay = self:SayReminder(self.TaskOnResumeReminder, self:GetShowReminder(self.TaskOnResumeReminder, 0))
	self:CallDelay(delay, self.StopOpenPage)
end

function BaseActorProxy:EmptyCB()
	-- body
end

function BaseActorProxy:RegisterTaskCB()
	if self.TaskOnPauseReminder == 0 then return end
	self:RegisterTaskTagCB("PlayerCombat", self.PlayerCombatOnPause, function ()
		self:CallDelay(self.TaskOnResumeDelay, self.PlayerCombatOnResume)
	end)
	self:RegisterTaskTagCB("OpenPage", self.EmptyCB, function ()
		self:CallDelay(self.TaskOnResumeDelay, self.OpenPageOnResume)
	end)
end

function BaseActorProxy:UnregisterTaskCB()
	if self.TaskOnPauseReminder == 0 then return end
	self:UnregisterTaskTagCB("PlayerCombat")
	self:UnregisterTaskTagCB("OpenPage")
end

return BaseActorProxy