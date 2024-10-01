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
	{ config_id = 789, gadget_id = 70710002, pos = { x = 2461.2, y = 300.1, z = -359.1 }, rot = { x = 0.0, y = 155.9, z = 0.0 }, level = 1, route_id = 3004534, save_route = true },
	{ config_id = 790, gadget_id = 70900042, pos = { x = 2409.1, y = 284.0, z = -376.5 }, rot = { x = 350.1, y = 66.0, z = 347.7 }, level = 1 },
	{ config_id = 791, gadget_id = 70210031, pos = { x = 2407.5, y = 283.7, z = -377.3 }, rot = { x = 3.7, y = 153.7, z = 344.6 }, level = 1, chest_drop_id = 403343, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 801, gadget_id = 70500000, pos = { x = 2458.9, y = 299.6, z = -357.7 }, rot = { x = 0.0, y = 151.2, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 816, gadget_id = 70900042, pos = { x = 2405.6, y = 283.0, z = -378.1 }, rot = { x = 354.3, y = 327.6, z = 9.0 }, level = 1 },
	{ config_id = 817, gadget_id = 70710002, pos = { x = 2347.3, y = 277.7, z = -383.4 }, rot = { x = 0.0, y = 322.4, z = 0.0 }, level = 1, route_id = 3004536, save_route = true }
}

-- 区域
regions = {
	{ config_id = 163, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2458.8, y = 299.5, z = -357.8 } },
	{ config_id = 164, shape = RegionShape.SPHERE, radius = 1, pos = { x = 2409.0, y = 285.5, z = -377.1 } },
	{ config_id = 171, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2347.3, y = 277.4, z = -384.2 } },
	{ config_id = 172, shape = RegionShape.SPHERE, radius = 1, pos = { x = 2405.5, y = 284.6, z = -378.3 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_163", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_163", action = "action_EVENT_ENTER_REGION_163" },
	{ name = "PLATFORM_REACH_POINT_164", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "817", condition = "condition_EVENT_PLATFORM_REACH_POINT_164", action = "action_EVENT_PLATFORM_REACH_POINT_164" },
	{ name = "ENTER_REGION_171", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_171", action = "action_EVENT_ENTER_REGION_171" },
	{ name = "PLATFORM_REACH_POINT_172", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "789", condition = "condition_EVENT_PLATFORM_REACH_POINT_172", action = "action_EVENT_PLATFORM_REACH_POINT_172" }
}

-- 变量
variables = {
	{ name = "num_1", value = 0, persistent = true }
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
		gadgets = { 789, 790, 801, 816, 817 },
		regions = { 163, 164, 171, 172 },
		triggers = { "ENTER_REGION_163", "PLATFORM_REACH_POINT_164", "ENTER_REGION_171", "PLATFORM_REACH_POINT_172" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_163(context, evt)
	if evt.param1 ~= 163 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_163(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 789, 3004535) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_164(context, evt)
	-- 判断是gadgetid 为 817的移动平台，是否到达了3004537 的路线中的 3 点
	
	if 817 ~= evt.param1 then
	  return false
	end
	
	if 3004537 ~= evt.param2 then
	  return false
	end
	
	if 3 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_164(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1") + 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num_1) then
	  return -1
	end
	
	if c_num_1 == 2 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 791 }) then
	 	 return -1
		end
	end
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_171(context, evt)
	if evt.param1 ~= 171 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_171(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 817, 3004537) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_172(context, evt)
	-- 判断是gadgetid 为 789的移动平台，是否到达了3004535 的路线中的 2 点
	
	if 789 ~= evt.param1 then
	  return false
	end
	
	if 3004535 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_172(context, evt)
	local c_num_1 = ScriptLib.GetGroupVariableValue(context, "num_1") + 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "num_1", c_num_1) then
	  return -1
	end
	
	if c_num_1 == 2 then
		if 0 ~= ScriptLib.CreateGadget(context, { config_id = 791 }) then
	 	 return -1
		end
	end
	return 0
end
