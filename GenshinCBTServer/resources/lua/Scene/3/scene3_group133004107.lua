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
	{ config_id = 422, gadget_id = 70710002, pos = { x = 2373.7, y = 316.3, z = -176.9 }, rot = { x = 0.0, y = 8.0, z = 0.0 }, level = 1, route_id = 3004530, save_route = true, persistent = true },
	{ config_id = 473, gadget_id = 70210031, pos = { x = 2415.2, y = 299.2, z = -240.0 }, rot = { x = 0.9, y = 167.7, z = 349.3 }, level = 1, chest_drop_id = 403343, isOneoff = true },
	{ config_id = 567, gadget_id = 70900042, pos = { x = 2413.1, y = 298.9, z = -247.0 }, rot = { x = 9.7, y = 307.1, z = 355.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 149, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2374.1, y = 315.1, z = -176.3 } },
	{ config_id = 150, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2392.6, y = 306.7, z = -191.4 } },
	{ config_id = 151, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2412.9, y = 300.5, z = -246.7 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_149", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_149", action = "action_EVENT_ENTER_REGION_149" },
	{ name = "AVATAR_NEAR_PLATFORM_150", event = EventType.EVENT_AVATAR_NEAR_PLATFORM, source = "", condition = "condition_EVENT_AVATAR_NEAR_PLATFORM_150", action = "action_EVENT_AVATAR_NEAR_PLATFORM_150" },
	{ name = "PLATFORM_REACH_POINT_151", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "422", condition = "condition_EVENT_PLATFORM_REACH_POINT_151", action = "action_EVENT_PLATFORM_REACH_POINT_151" }
}

-- 变量
variables = {
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
		gadgets = { 422, 567 },
		regions = { 149, 150, 151 },
		triggers = { "ENTER_REGION_149", "AVATAR_NEAR_PLATFORM_150", "PLATFORM_REACH_POINT_151" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_149(context, evt)
	if evt.param1 ~= 149 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_149(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 422, 3004531) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_AVATAR_NEAR_PLATFORM_150(context, evt)
	-- 判断是gadgetid 为 422的移动平台，是否到达了3004531 的路线中的 2 点
	
	if 422 ~= evt.param1 then
	  return false
	end
	
	if 3004531 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_AVATAR_NEAR_PLATFORM_150(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 422, 3004532) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_151(context, evt)
	-- 判断是gadgetid 为 422的移动平台，是否到达了3004532 的路线中的 2 点
	
	if 422 ~= evt.param1 then
	  return false
	end
	
	if 3004532 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_151(context, evt)
	-- 创建id为473的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 473 }) then
	  return -1
	end
	
	return 0
end
