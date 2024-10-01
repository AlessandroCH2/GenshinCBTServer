local SceneData = {}

SceneData.SceneDataDic = {}

SceneData.DefaultSceneID = 3
SceneData.currSceneID = -1

SceneData.ClearScene = function(self)
	if SceneData.currSceneID <= 0 then
		return
	end
	SceneData.SceneDataDic[SceneData.currSceneID] = nil
end

local function DoRequire(path)
	util.do_require(path)
end

local function GetSceneDataSchemePath(sceneID)
	local sceneIDStr = tostring(sceneID)
	local path = "Scene/" .. sceneIDStr .. "/scene" .. sceneIDStr
	return path
end

local function AddEntityInfoToDic(infos, dic)
	if infos == nil then
		return
	end
	for i = 1, #infos do
		local info = infos[i]
		dic[info.config_id] = info
	end
end

local function ClearTempSceneData()
	groups = nil
	dummy_points = nil
	routes_config = nil
	routes = nil
	monsters = nil
	npcs = nil
	gadgets = nil
	regions = nil
	triggers = nil
	variables = nil
	init_config = nil
end

local function CreateSceneData(schemePath)
	DoRequire(schemePath)
	local sceneData =
	{
		scene_config = nil,
		blocks = nil,
		groups = nil,
		dummy_points = nil,
		routes = nil,

		ConfigType ={
			Monster = 0,
			Npc = 1,
			Gadget = 2,
		},

		GetConfig = function(self, groupID, configID, type)
			local groupInfo = self.groups[groupID]
			if groupInfo == nil then
				return nil
			end
			if type == self.ConfigType.Monster then
				return groupInfo.monsterDic[configID]
			elseif type == self.ConfigType.Npc then
				return groupInfo.npcDic[configID]
			elseif type == self.ConfigType.Gadget then
				return groupInfo.gadgetDic[configID]
			else
				return nil
			end
		end,

		GetMonsterConfig = function(self, groupID, configID)
			return self:GetConfig(groupID, configID, self.ConfigType.Monster)
		end,

		GetNpcConfig = function(self, groupID, configID)
			return self:GetConfig(groupID, configID, self.ConfigType.Npc)
		end,

		GetGadgetConfig = function(self, groupID, configID)
			return self:GetConfig(groupID, configID, self.ConfigType.Gadget)
		end,

		GetInitGadgets = function(self)
			local gadgetList = {}
			local cnt = 1
			for k, v in pairs(self.groups) do
				local groupID = k
				if v ~= nil and v.initConfig ~= nil then
					for i = 1, #(v.initConfig.gadgets) do
						local configID = v.initConfig.gadgets[i]
						local config = self:GetGadgetConfig(groupID, configID)
						gadgetList[cnt] = config
						cnt = cnt + 1
					end
				end
			end
			return gadgetList
		end,

		GetInitNpcs = function(self)
			local npcList = {}
			local cnt = 1
			for k, v in pairs(self.groups) do
				local groupID = k
				if v ~= nil and v.initConfig ~= nil then
					for i = 1, #(v.initConfig.npcs) do
						local configID = v.initConfig.npcs[i]
						local config = self:GetNpcConfig(groupID, configID)
						npcList[cnt] = config
						cnt = cnt + 1
					end
				end
			end
			return npcList
		end,

		GetSuiteGadgets = function(self)
			local gadgetList = {}
			local cnt = 1
			--每个group
			for k, v in pairs(self.groups) do
				local groupID = k
				if v ~= nil and v.suites ~= nil then
					--每个suite
					for i = 1, #(v.suites) do
						local suite = v.suites[i]
						if(suite.gadgets~=nil) then
							for key,value in pairs(suite.gadgets) do
								local configID = value
								local config = self:GetGadgetConfig(groupID, configID)
								gadgetList[cnt] = config
								cnt = cnt + 1
							end
						end
					end
				end
			end
			return gadgetList
		end,

		GetDummyPoint = function(self, dummyName)
			if self.dummy_points == nil then
				return nil
			end
			local dummyPoint = nil
			if self.dummy_points[dummyName] ~= nil then
				dummyPoint = self.dummy_points[dummyName]
			end
			return dummyPoint
		end,

		GetRouteConfig = function(self, routeName)
			if self.routes == nil then
				return nil
			end
			local routeConfig = nil
			if self.routes[routeName] ~= nil then
				routeConfig = self.routes[routeName]
			end
			return routeConfig
		end
	}
	sceneData.scene_config = scene_config

	local blocksDic = {}
	local groupDic = {}

	if blocks == nil then
		blocks = {}
	end

	print(#blocks)
	for i=1 , #blocks do
		local blockData = { groups = nil }
		local blockIndex = blocks[i]
		local blockIndexStr = tostring(blockIndex)
		local blockPath = schemePath .. "_block" .. blockIndexStr
		DoRequire(blockPath)

		if groups == nil then
			groups = {}
		end

		blockData.groups = groups
		blocksDic[blockIndex] = blockData
		for j=1 , #groups do
			local group = groups[j]
			local groupIndexStr = tostring(group.id)
			local groupPath = schemePath .. "_group" .. groupIndexStr
			DoRequire(groupPath)
			local groupInfo = { monsterDic = {}, npcDic = {}, gadgetDic = {}, regionDic = {}, triggerDic = {}, variables = {}, initConfig = {}, suites = {}}
			AddEntityInfoToDic(monsters, groupInfo.monsterDic)
			AddEntityInfoToDic(npcs, groupInfo.npcDic)
			AddEntityInfoToDic(gadgets, groupInfo.gadgetDic)
			AddEntityInfoToDic(regions, groupInfo.regionDic)
			groupInfo.suites = suites
			groupInfo.initConfig = init_config

			groupDic[group.id] = groupInfo
		end
	end
	sceneData.blocks = blocksDic
	sceneData.groups = groupDic

	if dummy_points ~= nil and #dummy_points > 0 then
		local dummy_point_path = schemePath .. "_" .. dummy_points[1]
		DoRequire(dummy_point_path)
		sceneData.dummy_points = dummy_points
	end

	if routes_config ~= nil and #routes_config > 0 then
		local routes_path = schemePath .. "_" .. routes_config[1]
		DoRequire(routes_path)
		sceneData.routes = routes
	end

	--clear temp data
	ClearTempSceneData()
	
	return sceneData
end

SceneData.LoadScene = function(self, sceneID, isOnlyLoad)
	print("######sceneID")
	print(sceneID)
	local sceneData = SceneData.SceneDataDic[sceneID]
	if sceneData ~= nil then
		if not isOnlyLoad then
			SceneData.currSceneID = sceneID
		end
		return sceneData
	end

	local schemePath = GetSceneDataSchemePath(sceneID)
	sceneData = CreateSceneData(schemePath)
	SceneData.SceneDataDic[sceneID] = sceneData
	if not isOnlyLoad then
		SceneData.currSceneID = sceneID
	end

	return sceneData
end

SceneData.GetSceneData = function(self, sceneID)
	local sceneData = SceneData.SceneDataDic[sceneID]
	if sceneData == nil then
		sceneData = SceneData.LoadScene(self, sceneID, true)
	end
	return sceneData
end

SceneData.GetDummyPoint = function(self, sceneID, dummyName)
	local sceneData = SceneData.GetSceneData(self, sceneID)
	return sceneData:GetDummyPoint(dummyName)
end

SceneData.GetRouteConfig = function(self, sceneID, routeName)
	local sceneData = SceneData.GetSceneData(self, sceneID)
	return sceneData:GetRouteConfig(routeName)
end

return SceneData