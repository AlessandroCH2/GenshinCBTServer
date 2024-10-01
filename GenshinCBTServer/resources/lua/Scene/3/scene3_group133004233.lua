--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 605, monster_id = 20011301, pos = { x = 2500.0, y = 246.9, z = -389.5 }, rot = { x = 0.0, y = 128.1, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 606, monster_id = 20011201, pos = { x = 2497.2, y = 246.7, z = -389.5 }, rot = { x = 0.0, y = 100.4, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 607, monster_id = 20011201, pos = { x = 2499.1, y = 246.8, z = -387.1 }, rot = { x = 0.0, y = 126.8, z = 0.0 }, level = 12, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1354, gadget_id = 70220021, pos = { x = 2412.3, y = 240.3, z = -428.4 }, rot = { x = 0.0, y = 94.0, z = 0.0 }, level = 1 },
	{ config_id = 1355, gadget_id = 70710003, pos = { x = 2413.4, y = 241.0, z = -428.4 }, rot = { x = 0.0, y = 94.7, z = 0.0 }, level = 1, route_id = 3004562, save_route = true },
	{ config_id = 1367, gadget_id = 70900042, pos = { x = 2475.9, y = 243.8, z = -372.5 }, rot = { x = 0.0, y = 49.2, z = 0.0 }, level = 1 },
	{ config_id = 1368, gadget_id = 70900042, pos = { x = 2479.7, y = 244.3, z = -369.2 }, rot = { x = 0.0, y = 139.6, z = 0.0 }, level = 1 },
	{ config_id = 1369, gadget_id = 70210031, pos = { x = 2478.0, y = 244.1, z = -370.7 }, rot = { x = 0.0, y = 138.7, z = 356.8 }, level = 1, chest_drop_id = 403343, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1370, gadget_id = 70710003, pos = { x = 2522.0, y = 250.8, z = -411.8 }, rot = { x = 0.0, y = 310.8, z = 0.0 }, level = 1, route_id = 3004559, save_route = true }
}

-- 区域
regions = {
	{ config_id = 258, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2523.5, y = 250.5, z = -409.9 } },
	{ config_id = 259, shape = RegionShape.SPHERE, radius = 4, pos = { x = 2499.6, y = 246.6, z = -389.3 } },
	{ config_id = 260, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2479.9, y = 244.3, z = -368.8 } },
	{ config_id = 261, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2476.2, y = 240.7, z = -372.5 } },
	{ config_id = 262, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2415.4, y = 240.7, z = -425.6 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_258", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_258", action = "action_EVENT_ENTER_REGION_258" },
	{ name = "ENTER_REGION_259", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_259", action = "action_EVENT_ENTER_REGION_259" },
	{ name = "PLATFORM_REACH_POINT_260", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "1370", condition = "condition_EVENT_PLATFORM_REACH_POINT_260", action = "action_EVENT_PLATFORM_REACH_POINT_260", tlog_tag = "奔狼岭_233_移动精灵_结束" },
	{ name = "PLATFORM_REACH_POINT_261", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "1355", condition = "condition_EVENT_PLATFORM_REACH_POINT_261", action = "action_EVENT_PLATFORM_REACH_POINT_261", tlog_tag = "奔狼岭_233_移动精灵_结束" },
	{ name = "ANY_GADGET_DIE_262", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_262", action = "action_EVENT_ANY_GADGET_DIE_262" }
}

-- 变量
variables = {
	{ name = "num_1", value = 0, persistent = true },
	{ name = "num_2", value = 0, persistent = true }
}

--================================================================
-- 
-- 初始化配置
-- 
--================================================================

-- 初始化时创建
init_config = {
	suite = 1,
	rand_suite = true,
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
		gadgets = { 1354, 1355, 1367, 1368, 1370 },
		regions = { 258, 259, 260, 261, 262 },
		triggers = { "ENTER_REGION_258", "ENTER_REGION_259", "PLATFORM_REACH_POINT_260", "PLATFORM_REACH_POINT_261", "ANY_GADGET_DIE_262" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_258(context, evt)
	if evt.param1 ~= 258 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_258(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1370, 3004560) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "num_2" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "num_2", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_259(context, evt)
	if evt.param1 ~= 259 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"num_2"为1
	if ScriptLib.GetGroupVariableValue(context, "num_2") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_259(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 605, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 606, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 607, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_260(context, evt)
	-- 判断是gadgetid 为 1370的移动平台，是否到达了3004560 的路线中的 2 点
	
	if 1370 ~= evt.param1 then
	  return false
	end
	
	if 3004560 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_260(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1") + 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num_1) then
	  return -1
	end
	
	if c_num_1 == 2 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1369 }) then
	 	 return -1
		end
	end
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_261(context, evt)
	-- 判断是gadgetid 为 1355的移动平台，是否到达了3004561 的路线中的 3 点
	
	if 1355 ~= evt.param1 then
	  return false
	end
	
	if 3004561 ~= evt.param2 then
	  return false
	end
	
	if 3 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_261(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1") + 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num_1) then
	  return -1
	end
	
	if c_num_1 == 2 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1369 }) then
	 	 return -1
		end
	end
	return 0
end

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_262(context, evt)
	if 1354 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_262(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1355, 3004561) then
	  return -1
	end
	
	return 0
end
