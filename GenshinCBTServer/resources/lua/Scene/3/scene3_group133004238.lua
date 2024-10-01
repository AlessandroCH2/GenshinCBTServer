--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 608, monster_id = 20010401, pos = { x = 2589.0, y = 272.9, z = -271.7 }, rot = { x = 0.0, y = 281.7, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 609, monster_id = 20010301, pos = { x = 2588.7, y = 273.4, z = -268.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 12, drop_id = 303043 },
	{ config_id = 610, monster_id = 20010301, pos = { x = 2587.0, y = 273.2, z = -270.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 12, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1371, gadget_id = 70710003, pos = { x = 2557.7, y = 270.6, z = -271.9 }, rot = { x = 0.0, y = 250.2, z = 0.0 }, level = 1, route_id = 3004564, save_route = true },
	{ config_id = 1372, gadget_id = 70900042, pos = { x = 2597.8, y = 273.3, z = -330.9 }, rot = { x = 0.0, y = 22.3, z = 0.0 }, level = 1 },
	{ config_id = 1373, gadget_id = 70210031, pos = { x = 2595.9, y = 273.4, z = -330.3 }, rot = { x = 0.0, y = 23.8, z = 0.0 }, level = 1, chest_drop_id = 403343, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 264, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2589.1, y = 274.4, z = -270.7 } },
	{ config_id = 265, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2557.6, y = 271.8, z = -271.8 } },
	{ config_id = 266, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2615.1, y = 272.2, z = -290.8 } },
	{ config_id = 267, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2597.9, y = 273.5, z = -330.5 } }
}

-- 触发器
triggers = {
	{ name = "AVATAR_NEAR_PLATFORM_264", event = EventType.EVENT_AVATAR_NEAR_PLATFORM, source = "", condition = "condition_EVENT_AVATAR_NEAR_PLATFORM_264", action = "action_EVENT_AVATAR_NEAR_PLATFORM_264" },
	{ name = "ENTER_REGION_265", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_265", action = "action_EVENT_ENTER_REGION_265", tlog_tag = "奔狼岭_238_移动精灵_开始" },
	{ name = "AVATAR_NEAR_PLATFORM_266", event = EventType.EVENT_AVATAR_NEAR_PLATFORM, source = "", condition = "condition_EVENT_AVATAR_NEAR_PLATFORM_266", action = "action_EVENT_AVATAR_NEAR_PLATFORM_266" },
	{ name = "PLATFORM_REACH_POINT_267", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "1371", condition = "condition_EVENT_PLATFORM_REACH_POINT_267", action = "action_EVENT_PLATFORM_REACH_POINT_267", tlog_tag = "奔狼岭_238_移动精灵_结束" }
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
		gadgets = { 1371, 1372 },
		regions = { 264, 265, 266, 267 },
		triggers = { "AVATAR_NEAR_PLATFORM_264", "ENTER_REGION_265", "AVATAR_NEAR_PLATFORM_266", "PLATFORM_REACH_POINT_267" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_AVATAR_NEAR_PLATFORM_264(context, evt)
	-- 判断是gadgetid 为 1371的移动平台，是否到达了3004565 的路线中的 2 点
	
	if 1371 ~= evt.param1 then
	  return false
	end
	
	if 3004565 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_AVATAR_NEAR_PLATFORM_264(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1371, 3004566) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 608, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 609, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 610, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_265(context, evt)
	if evt.param1 ~= 265 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_265(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1371, 3004565) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_AVATAR_NEAR_PLATFORM_266(context, evt)
	-- 判断是gadgetid 为 1371的移动平台，是否到达了3004566 的路线中的 1 点
	
	if 1371 ~= evt.param1 then
	  return false
	end
	
	if 3004566 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_AVATAR_NEAR_PLATFORM_266(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1371, 3004567) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_267(context, evt)
	-- 判断是gadgetid 为 1371的移动平台，是否到达了3004567 的路线中的 2 点
	
	if 1371 ~= evt.param1 then
	  return false
	end
	
	if 3004567 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_267(context, evt)
	-- 创建id为1373的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1373 }) then
	  return -1
	end
	
	return 0
end
