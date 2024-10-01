----------------------
-- 这是Lua端ActorManager，包含了创建和管理Actor的方法，可通关全局唯一的引用actorMgr访问
-- @module ActorManager
local ActorManager = {}

ActorManager.ActorDic = {}
ActorManager.Alias2EntityIDDic = {}

ActorManager.dummyActor = require('Actor/DummyActorProxy')
ActorManager.tempDefaultAlias = "Temp"

ActorManager.OnTest1 = function()
	print("Test1")
	actorMgr:CreateActor(actorMgr, "test", "Actor/Npc/Npc001Test")
end

ActorManager.OnTest2 = function()
	print("Test2")
	local actor = actorMgr:GetActor("test")
	if actor ~= nil then
		actor:Test()
	end
end

ActorManager.OnTest3 = function()
	print("Test3")
end

ActorManager.InitGlobal = function()
	print("Actor Manager Init")
	globalActor = actorMgr:CreateActor("global", "Actor/GlobalActorProxy")
end

ActorManager.InitSubGlobal = function()
	for i = 1, #globalCfg.initSubActors do
		local subGActorCfg = globalCfg.initSubActors[i]
		if subGActorCfg ~= nil and subGActorCfg.alias ~= nil and subGActorCfg.metaPath ~= nil then
			actorMgr:CreateActor(subGActorCfg.alias, subGActorCfg.metaPath)
		end
	end
	for i = 1, #globalCfg.initAddSubActors do
		local subGActorCfg = globalCfg.initAddSubActors[i]
		if subGActorCfg ~= nil and subGActorCfg.alias ~= nil and subGActorCfg.metaPath ~= nil then
			actorMgr:CreateActor(subGActorCfg.alias, subGActorCfg.metaPath)
		end
	end
end

ActorManager.RegisteSubGlobal = function(self, inputAlias, inputPath)
	for i = 1, #globalCfg.initAddSubActors do
		local subGActorCfg = globalCfg.initAddSubActors[i]
		if subGActorCfg ~= nil and subGActorCfg.alias == inputAlias then
			return
		end
	end
	local subGActorCfg = {
			alias = inputAlias,
			metaPath = inputPath,
		}
	globalCfg.initAddSubActors[#globalCfg.initAddSubActors + 1] = subGActorCfg
	if subGActorCfg ~= nil and subGActorCfg.alias ~= nil and subGActorCfg.metaPath ~= nil then
		actorMgr:CreateActor(subGActorCfg.alias, subGActorCfg.metaPath)
	end
end

ActorManager.UnregisteSubGlobal = function(self, alias)
	for i = 1, #globalCfg.initAddSubActors do
		local subGActorCfg = globalCfg.initAddSubActors[i]
		if subGActorCfg ~= nil and subGActorCfg.alias == alias then
			globalCfg.initAddSubActors[i] = nil
		end
	end
end

--- actorMgr 创建一个Actor，一般actor已有在c#端的核心实例
-- @param self ActorManager实例本身
-- @tparam string alias 指定的别名
-- @tparam string metaPath 脚本路径
-- @tparam bool isAutoStart 是否自动开始
ActorManager.CreateActor = function(self, alias, metaPath, isAutoStart)
	print("create actor called " .. tostring(alias))
	print(tostring(metaPath))

	local actor = ActorManager.GetActorInternal(self, alias)

	if actor == nil then
		local metaActor = require(metaPath)
		actor = metaActor:new()
		actor.metaPath = metaPath
		actor:OnPreInit()
		if alias == nil or alias == '' then
			alias = actor.defaultAlias
		end
		ActorManager.ActorDic[alias] = actor
		actor:OnInit(alias)
		actor:OnPostInit()
	end

	if isAutoStart == nil then
		isAutoStart = true
	end

	if isAutoStart then
		actor:Start()
	end

	return actor
end
--- actorMgr 创建一个Actor，包含出身点，一般用于创建EntityActor
-- @param self ActorManager实例本身
-- @tparam string alias 指定的别名
-- @tparam string metaPath 脚本路径
-- @tparam uint configID 配置ID
-- @tparam uint dataIndex 数据索引
-- @tparam Vector3 bornPos 出生点
-- @tparam Vector3 bornDir 出生朝向（euler
-- @tparam bool isNetwork 是否服务器参与，一般用于需要移动很远、任务交互等的NPC
-- @tparam bool isAutoStart 是否自动开始
-- @tparam uint sceneID 场景ID，默认大世界3
ActorManager.CreateActorWithPos = function(self, alias, metaPath, configID, dataIndex, bornPos, bornDir, 
	isNetwork, isAutoStart, sceneID, noPerform, roomID)
	if sceneID == nil then
		sceneID = sceneData.DefaultSceneID
	end

	if roomID == nil then
		if sceneID == 3 then
			roomID = 0
		else roomID = 1
		end
	end

	if sceneID ~= sceneData.currSceneID and sceneData.currSceneID ~= 1001 then
		if isNetwork and sceneData.currSceneID ~= -1 then
			actorUtils.NotifyActorPreCreate(alias)
			local metaActor = require(metaPath)
			actorUtils.NotifyActorCreate(metaActor.actorType, alias, metaPath, configID, bornPos, bornDir, 
				sceneID, roomID)
		end
		self.dummyActor.alias = alias
		return self.dummyActor
	end

	if noPerform == nil then
		noPerform = true
	end
	
	print("create actor called " .. tostring(alias))
	print(tostring(metaPath))
	local actor = ActorManager.GetActorInternal(self, alias)
	if actor ~= nil and actor:IsValid() ~= true then
		ActorManager.ClearActor(self, alias)
		actor = nil
	end

	if actor ~= nil then
		if actor.defaultAlias == ActorManager.tempDefaultAlias then
			local metaActor = require(metaPath)
			if metaActor.defaultAlias ~= actor.defaultAlias then
				ActorManager.ClearActor(self, alias)
				actor = nil
			end
		end
	end

	if actor == nil then
		actorUtils.NotifyActorPreCreate(alias)
		local metaActor = require(metaPath)
		actor = metaActor:new()
		actor.configID = configID
		actor.dataIndex = dataIndex
		actor.bornSceneID = sceneID
		actor.bornRoomID = roomID
		actor.bornPos = bornPos
		actor.bornDir = bornDir
		actor.isNetwork = isNetwork
		actor.isAutoStart = true
		actor.dontDestroyOnClear = false
		if isAutoStart ~= nil then
			actor.isAutoStart = isAutoStart
		end
		local preAlias = actor:PreGetAlias()
		actor:OnPreInit()
		if alias == nil or alias == '' then
			if preAlias ~= nil then
				alias = preAlias
			else
				alias = actor.defaultAlias
			end
		end
		actor.alias = alias
		actor.metaPath = metaPath
		ActorManager.ActorDic[alias] = actor
		actor:OnInit(alias)
		if actor.uActor == nil then
			ActorManager.ActorDic[alias] = nil
			self.dummyActor.alias = alias
			return self.dummyActor
		else
			actor:OnPostInit()
			if actor.CheckShow ~= nil then
				actor:CheckShow()
			end
		end
	else
		actorUtils.NotifyActorPreCreate(alias)
		local metaActor = require(metaPath)
		actor:ClearAllTask()
		actor.bornSceneID = sceneID
		actor.bornRoomID = roomID
		if actor.SetPosAndTurnTo ~= nil then
			actor:SetPosAndTurnTo(bornPos, M.Euler2DirXZ(bornDir), noPerform)
		else
			if actor.SetPos ~= nil then
				actor:SetPos(bornPos, noPerform)
			end
			if actor.TurnTo ~= nil then
				actor:TurnTo(M.Euler2DirXZ(bornDir))
			end
		end
		if actor.CheckShow ~= nil then
			actor:CheckShow()
		end
		actor:ClearActor()
		if actor.SyncPos ~= nil then
			actor:SyncPos(0)
			actorUtils.NotifyActorCreateSoft(metaActor.actorType, alias, metaPath, configID, bornPos, bornDir, 
				sceneID, roomID)
		end
		if isAutoStart then
			actor:Start()
		end
	end
	return actor
end
--- actorMgr 通过ActorInfoData创建一个Actor
-- @param self ActorManager实例本身
-- @tparam ActorInfoData data 创建Actor需要的数据
ActorManager.CreateActorWithData = function(self, data)
	local sceneID = data.sceneID
	if sceneID == -1 and sceneID == nil then
		sceneID = sceneData.DefaultSceneID
	end
	local roomID = data.roomID
	if roomID == nil then
		roomID = 0
	end

	local alias = data.alias
	local metaPath = data.metaPath
	local configID = data.configID
	local dataIndex = data.dataIndex
	local bornPos = data.bornPos
	local bornDir = data.bornEuler
	local isNetwork = data.isNetwork
	local isAutoStart = data.isAutoStart
	local isCheckHide = data.checkHide
	local dontDestroyOnClear = data.dontDestroyOnClear

	if sceneID ~= sceneData.currSceneID and sceneData.currSceneID ~= 1001 then
		if isNetwork and sceneData.currSceneID ~= -1 then
			actorUtils.NotifyActorPreCreate(alias)
			local metaActor = require(metaPath)
			actorUtils.NotifyActorCreate(metaActor.actorType, alias, metaPath, configID, bornPos, bornDir, 
				sceneID, roomID)
		end
		self.dummyActor.alias = alias
		return self.dummyActor
	end
	
	local noPerform = data.noPerform
	if noPerform == nil then
		noPerform = true
	end

	local actor = ActorManager.GetActorInternal(self, alias)
	if actor ~= nil and actor:IsValid() ~= true then
		ActorManager.ClearActor(self, alias)
		actor = nil
	end

	if actor ~= nil then
		if actor.defaultAlias == ActorManager.tempDefaultAlias then
			local metaActor = require(metaPath)
			if metaActor.defaultAlias ~= actor.defaultAlias then
				ActorManager.ClearActor(self, alias)
				actor = nil
			end
		end
	end

	if actor == nil then
		actorUtils.NotifyActorPreCreate(alias)
		local metaActor = require(metaPath)
		actor = metaActor:new()
		actor.configID = configID
		actor.dataIndex = dataIndex
		actor.bornSceneID = sceneID
		actor.bornRoomID = roomID
		actor.bornPos = bornPos
		actor.bornDir = bornDir
		actor.isNetwork = isNetwork
		actor.isAutoStart = true
		actor.actorData = data
		actor.dontDestroyOnClear = dontDestroyOnClear
		if isAutoStart ~= nil then
			actor.isAutoStart = isAutoStart
		end
		local preAlias = actor:PreGetAlias()
		actor:OnPreInit()
		if alias == nil or alias == '' then
			if preAlias ~= nil then
				alias = preAlias
			else
				alias = actor.defaultAlias
			end
		end
		actor.alias = alias
		actor.metaPath = metaPath
		ActorManager.ActorDic[alias] = actor
		actor:OnInit(alias)
		if actor.uActor == nil then
			ActorManager.ActorDic[alias] = nil
			self.dummyActor.alias = alias
			return self.dummyActor
		else
			actor:OnPostInit()
			if not isCheckHide then
				if actor.CheckShow ~= nil then
					actor:CheckShow()
				end
			end
		end
	else
		actorUtils.NotifyActorPreCreate(alias)
		actor:ClearAllTask()
		actor.bornSceneID = sceneID
		actor.bornRoomID = roomID
		if actor.SetPosAndTurnTo ~= nil then
			actor:SetPosAndTurnTo(bornPos, M.Euler2DirXZ(bornDir), noPerform)
		else
			if actor.SetPos ~= nil then
				actor:SetPos(bornPos, noPerform)
			end
			if actor.TurnTo ~= nil then
				actor:TurnTo(M.Euler2DirXZ(bornDir))
			end
		end
		if not isCheckHide then
			if actor.CheckShow ~= nil then
				actor:CheckShow()
			end
		end
		actor:ClearActor()
		if actor.SyncPos ~= nil then
			actor:SyncPos(0)
		end
		if isAutoStart then
			actor:Start()
		end
	end
	return actor
end

--- actorMgr 创建一个QuestActor， 一般不需要主动调用
-- @param self ActorManager实例本身
-- @tparam string alias 指定的别名
-- @tparam string metaPath 脚本路径
-- @tparam uint mainID 主任务ID
ActorManager.CreateQuestActor = function(self, alias, metaPath, mainID)
	print("create quest actor called " .. tostring(alias) .. " . " .. tostring(mainID))
	print(tostring(metaPath))
	local metaActor = require(metaPath)
	local actor = metaActor:new()
	actor.mainQuestID = mainID
	actor.metaPath = metaPath
	print(actor.mainQuestID)
	actor:OnPreInit()
	if alias == nil or alias == '' then
		alias = tostring(mainID)
	end
	ActorManager.ActorDic[alias] = actor
	actor:OnDataLoad()
	actor:OnHandlerBuild()
	actor:OnInit(alias)
	actor:OnPostInit()
	return actor
end
--- actorMgr 获取一个Actor
-- @tparam string alias Actor别名
ActorManager.GetActor = function(self, alias)
	local actor = ActorManager.ActorDic[alias]
	if actor == nil then
		ActorManager.dummyActor.alias = alias
		return ActorManager.dummyActor
	end
	return actor
end

--- actorMgr 销毁一个EntityActor
-- @param self ActorManager实例本身
-- @tparam string alias Actor别名
-- @tparam bool isActorOnly 只销毁Actor
ActorManager.DestroyEntityActor = function(self, alias, isActorOnly)
	if isActorOnly == nil then
		isActorOnly = false
	end

	local actor = self:GetActorInternal(alias)
	if isActorOnly and actor == nil then
		return
	end

	if actor ~= nil then
		actor:Destroy(isActorOnly)
	else
		actorUtils.NotifyActorDestroy(alias)
	end
end

ActorManager.GetActorInternal = function(self, alias)
	local actor = ActorManager.ActorDic[alias]
	return actor
end

ActorManager.ClearActor = function(self, alias)
	ActorManager.ActorDic[alias] = nil
end

ActorManager.DestroyActor = function(self, alias, isActorOnly)
	local actor = ActorManager.GetActorInternal(self, alias)
	if actor ~= nil then
		actor:Destroy(isActorOnly)
	end
	ActorManager.ActorDic[alias] = nil
end

ActorManager.DestroyActorMeta = function(self, alias)
	local actor = ActorManager.GetActorInternal(self, alias)
	if actor ~= nil then
		local metaPath = actor.metaPath
		actor:Destroy(false)
		if metaPath ~= nil then
			util.unrequire(metaPath)
		end
	end
	ActorManager.ActorDic[alias] = nil
end

ActorManager.Destroy = function(self)
	for alias, actor in pairs(ActorManager.ActorDic) do
		local metaPath = nil
		if actor ~= nil then
			metaPath = actor.metaPath
		end
		ActorManager.DestroyActor(ActorManager, alias, false)
		if metaPath ~= nil then
			util.unrequire(metaPath)
		end
	end
end

ActorManager.DestroySoft = function(self)
	for alias, actor in pairs(ActorManager.ActorDic) do
		if actor ~= nil and not actor.dontDestroyOnClear then
			local metaPath = nil
			if actor ~= nil then
				metaPath = actor.metaPath
			end
			ActorManager.DestroyActor(ActorManager, alias, false)
			if metaPath ~= nil then
				util.unrequire(metaPath)
			end
		end
	end
end

ActorManager.StartActor = function(self, alias)
	local actor = ActorManager.GetActorInternal(self, alias)
	if actor ~= nil then
		actor:Start()
	end
end

ActorManager.SetEntityHandler = function(self, alias, runtimeID)
	ActorManager.Alias2EntityIDDic[alias] = runtimeID
end

ActorManager.GetEntityHandler = function(self, alias)
	return ActorManager.Alias2EntityIDDic[alias]
end

ActorManager.DestroyEntityHandler = function(self, alias)
	ActorManager.Alias2EntityIDDic[alias] = nil
end

return ActorManager