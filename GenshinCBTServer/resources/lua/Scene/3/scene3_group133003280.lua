--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3032, gadget_id = 70710002, pos = { x = 2190.0, y = 228.9, z = -1262.1 }, rot = { x = 0.0, y = 81.4, z = 0.0 }, level = 1, route_id = 3003177, save_route = true },
	{ config_id = 3034, gadget_id = 70690001, pos = { x = 2140.2, y = 235.8, z = -1315.5 }, rot = { x = 351.2, y = 199.1, z = 358.9 }, level = 1 },
	{ config_id = 3035, gadget_id = 70690001, pos = { x = 2137.9, y = 235.9, z = -1325.4 }, rot = { x = 354.1, y = 201.7, z = 0.0 }, level = 1 },
	{ config_id = 3036, gadget_id = 70690001, pos = { x = 2134.9, y = 236.7, z = -1337.3 }, rot = { x = 352.9, y = 198.8, z = 0.0 }, level = 1 },
	{ config_id = 3039, gadget_id = 70210021, pos = { x = 2117.3, y = 226.2, z = -1393.3 }, rot = { x = 0.1, y = 30.7, z = 353.8 }, level = 1, chest_drop_id = 403322, showcutscene = true, isOneoff = true },
	{ config_id = 3128, gadget_id = 70710002, pos = { x = 2143.3, y = 237.4, z = -1302.1 }, rot = { x = 0.0, y = 163.4, z = 0.0 }, level = 1, route_id = 3003206, save_route = true },
	{ config_id = 3379, gadget_id = 70900201, pos = { x = 2120.2, y = 231.2, z = -1380.0 }, rot = { x = 0.0, y = 7.1, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 193, shape = RegionShape.SPHERE, radius = 8.3, pos = { x = 2193.7, y = 229.4, z = -1262.1 } },
	{ config_id = 194, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2143.7, y = 235.8, z = -1301.6 } },
	{ config_id = 195, shape = RegionShape.SPHERE, radius = 1, pos = { x = 2120.2, y = 231.9, z = -1379.9 } },
	{ config_id = 253, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2138.5, y = 235.6, z = -1325.5 } },
	{ config_id = 365, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2189.2, y = 227.0, z = -1250.5 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_193", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_193", action = "action_EVENT_ENTER_REGION_193", tlog_tag = "神殿_精灵草_去凯亚_开始" },
	{ name = "ENTER_REGION_194", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_194", action = "action_EVENT_ENTER_REGION_194" },
	{ name = "ENTER_REGION_195", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_195", action = "action_EVENT_ENTER_REGION_195", tlog_tag = "神殿_精灵草_去凯亚_完成" },
	{ name = "ENTER_REGION_253", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_253", action = "" },
	{ name = "CLIENT_EXECUTE_365", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_365", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "Cap1", value = 0, persistent = true }
}

--================================================================
-- 
-- 初始化配置
-- 
--================================================================

-- 初始化时创建
init_config = {
	suite = 1,
	rand_suite = false,
	npcs = { }
}

--================================================================
-- 
-- 小组配置
-- 
--================================================================

suites = {
	{
		-- suite_id = 0,
		-- description = ,
		monsters = { },
		gadgets = { 3032 },
		regions = { 193, 194, 365 },
		triggers = { "ENTER_REGION_193", "ENTER_REGION_194", "CLIENT_EXECUTE_365" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 3034, 3035, 3036, 3128, 3379 },
		regions = { 195, 253 },
		triggers = { "ENTER_REGION_195", "ENTER_REGION_253" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { },
		gadgets = { 3039, 3128 },
		regions = { },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_193(context, evt)
	if evt.param1 ~= 193 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"Cap1"为0
	if ScriptLib.GetGroupVariableValue(context, "Cap1") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_193(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 3032, 3003178) then
	  return -1
	end
	
	-- 将本组内变量名为 "Cap1" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "Cap1", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_194(context, evt)
	if evt.param1 ~= 194 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"Cap1"为1
	if ScriptLib.GetGroupVariableValue(context, "Cap1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_194(context, evt)
	-- 触发镜头注目，注目位置为坐标（2119，225，-1380），持续时间为3秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=2119, y=225, z=-1380}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 3, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003280, suite = 2 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_195(context, evt)
	if evt.param1 ~= 195 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_195(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003280, suite = 3 }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_253(context, evt)
	if evt.param1 ~= 253 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"Cap1"为1
	if ScriptLib.GetGroupVariableValue(context, "Cap1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_365(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
