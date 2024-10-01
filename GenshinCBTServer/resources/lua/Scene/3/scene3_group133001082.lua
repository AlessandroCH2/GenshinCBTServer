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
	{ config_id = 1640, gadget_id = 70710002, pos = { x = 1884.8, y = 196.2, z = -1303.9 }, rot = { x = 0.0, y = 244.8, z = 0.0 }, level = 1, route_id = 108, save_route = true },
	{ config_id = 1641, gadget_id = 70210021, pos = { x = 1801.5, y = 196.1, z = -1337.9 }, rot = { x = 0.0, y = 53.0, z = 0.0 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true },
	{ config_id = 2499, gadget_id = 70900042, pos = { x = 1803.5, y = 196.0, z = -1340.2 }, rot = { x = 0.0, y = 297.2, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 57, shape = RegionShape.SPHERE, radius = 5.5, pos = { x = 1880.3, y = 196.2, z = -1301.4 } },
	{ config_id = 58, shape = RegionShape.SPHERE, radius = 0.7, pos = { x = 1803.6, y = 197.8, z = -1340.4 } },
	{ config_id = 225, shape = RegionShape.SPHERE, radius = 2.9, pos = { x = 1836.7, y = 201.8, z = -1348.0 } },
	{ config_id = 277, shape = RegionShape.SPHERE, radius = 4.3, pos = { x = 1851.9, y = 207.2, z = -1342.8 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_57", event = EventType.EVENT_ENTER_REGION, source = "1", condition = "condition_EVENT_ENTER_REGION_57", action = "action_EVENT_ENTER_REGION_57", tlog_tag = "小平原_精灵草_大树_开始" },
	{ name = "PLATFORM_REACH_POINT_58", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "1640", condition = "condition_EVENT_PLATFORM_REACH_POINT_58", action = "action_EVENT_PLATFORM_REACH_POINT_58" },
	{ name = "ENTER_REGION_225", event = EventType.EVENT_ENTER_REGION, source = "1", condition = "condition_EVENT_ENTER_REGION_225", action = "action_EVENT_ENTER_REGION_225" },
	{ name = "CLIENT_EXECUTE_277", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_277", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "unlock", value = 0, persistent = true }
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
		gadgets = { 1640, 2499 },
		regions = { 57, 58, 225, 277 },
		triggers = { "ENTER_REGION_57", "PLATFORM_REACH_POINT_58", "ENTER_REGION_225", "CLIENT_EXECUTE_277" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 1641, 2499 },
		regions = { },
		triggers = { },
		rand_weight = 0
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_57(context, evt)
	if evt.param1 ~= 57 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"unlock"为0
	if ScriptLib.GetGroupVariableValue(context, "unlock") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_57(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1640, 111) then
	  return -1
	end
	
	-- 将本组内变量名为 "unlock" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "unlock", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_58(context, evt)
	-- 判断变量"unlock"为2
	if ScriptLib.GetGroupVariableValue(context, "unlock") ~= 2 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_58(context, evt)
	-- 将本组内变量名为 "unlock" 的变量设置为 3
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "unlock", 3) then
	  return -1
	end
	
	-- 创建id为1641的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1641 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_225(context, evt)
	if evt.param1 ~= 225 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"unlock"为1
	if ScriptLib.GetGroupVariableValue(context, "unlock") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_225(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1640, 3001174) then
	  return -1
	end
	
	-- 将本组内变量名为 "unlock" 的变量设置为 2
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "unlock", 2) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_277(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
