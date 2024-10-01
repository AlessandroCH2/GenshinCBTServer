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
	{ config_id = 4158, gadget_id = 70710002, pos = { x = 2872.6, y = 261.4, z = -1796.4 }, rot = { x = 0.0, y = 142.8, z = 0.0 }, level = 1, route_id = 3003243, save_route = true, persistent = true },
	{ config_id = 4159, gadget_id = 70900042, pos = { x = 2836.8, y = 265.5, z = -1891.3 }, rot = { x = 9.9, y = 93.2, z = 8.9 }, level = 1 },
	{ config_id = 4160, gadget_id = 70220021, pos = { x = 2873.1, y = 259.4, z = -1797.3 }, rot = { x = 349.0, y = 348.2, z = 0.0 }, level = 1 },
	{ config_id = 4161, gadget_id = 70210031, pos = { x = 2836.9, y = 265.5, z = -1889.8 }, rot = { x = 352.8, y = 180.4, z = 10.6 }, level = 1, chest_drop_id = 403343, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 521, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2872.7, y = 262.4, z = -1795.1 } },
	{ config_id = 522, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2880.5, y = 272.7, z = -1843.7 } },
	{ config_id = 523, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2842.4, y = 264.2, z = -1870.6 } },
	{ config_id = 524, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2837.4, y = 266.6, z = -1890.8 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_521", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "", action = "action_EVENT_ANY_GADGET_DIE_521" },
	{ name = "AVATAR_NEAR_PLATFORM_522", event = EventType.EVENT_AVATAR_NEAR_PLATFORM, source = "", condition = "condition_EVENT_AVATAR_NEAR_PLATFORM_522", action = "action_EVENT_AVATAR_NEAR_PLATFORM_522" },
	{ name = "AVATAR_NEAR_PLATFORM_523", event = EventType.EVENT_AVATAR_NEAR_PLATFORM, source = "", condition = "condition_EVENT_AVATAR_NEAR_PLATFORM_523", action = "action_EVENT_AVATAR_NEAR_PLATFORM_523" },
	{ name = "PLATFORM_REACH_POINT_524", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "4158", condition = "condition_EVENT_PLATFORM_REACH_POINT_524", action = "action_EVENT_PLATFORM_REACH_POINT_524" }
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
		gadgets = { 4158, 4159, 4160 },
		regions = { 521, 522, 523, 524 },
		triggers = { "ANY_GADGET_DIE_521", "AVATAR_NEAR_PLATFORM_522", "AVATAR_NEAR_PLATFORM_523", "PLATFORM_REACH_POINT_524" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_521(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 4158, 3003240) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_AVATAR_NEAR_PLATFORM_522(context, evt)
	-- 判断是gadgetid 为 4158的移动平台，是否到达了3003240 的路线中的 2 点
	
	if 4158 ~= evt.param1 then
	  return false
	end
	
	if 3003240 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_AVATAR_NEAR_PLATFORM_522(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 4158, 3003241) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_AVATAR_NEAR_PLATFORM_523(context, evt)
	-- 判断是gadgetid 为 4158的移动平台，是否到达了3003241 的路线中的 1 点
	
	if 4158 ~= evt.param1 then
	  return false
	end
	
	if 3003241 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_AVATAR_NEAR_PLATFORM_523(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 4158, 3003242) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_524(context, evt)
	-- 判断是gadgetid 为 4158的移动平台，是否到达了3003242 的路线中的 1 点
	
	if 4158 ~= evt.param1 then
	  return false
	end
	
	if 3003242 ~= evt.param2 then
	  return false
	end
	
	if 1 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_524(context, evt)
	-- 创建id为4161的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 4161 }) then
	  return -1
	end
	
	return 0
end
