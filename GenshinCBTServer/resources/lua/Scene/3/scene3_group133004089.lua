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
	{ config_id = 343, gadget_id = 70220021, pos = { x = 2297.9, y = 271.9, z = -238.5 }, rot = { x = 0.0, y = 248.2, z = 0.0 }, level = 1 },
	{ config_id = 344, gadget_id = 70710002, pos = { x = 2301.1, y = 272.8, z = -238.4 }, rot = { x = 0.0, y = 91.6, z = 0.0 }, level = 1, route_id = 3004515, save_route = true }
}

-- 区域
regions = {
	{ config_id = 129, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2294.5, y = 272.8, z = -237.1 } },
	{ config_id = 243, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2263.4, y = 270.1, z = -256.2 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_129", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "", action = "action_EVENT_ANY_GADGET_DIE_129", tlog_tag = "奔狼岭_89_谜题破解_结算" },
	{ name = "PLATFORM_REACH_POINT_243", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "344", condition = "condition_EVENT_PLATFORM_REACH_POINT_243", action = "action_EVENT_PLATFORM_REACH_POINT_243" }
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
		gadgets = { 343, 344 },
		regions = { 129, 243 },
		triggers = { "ANY_GADGET_DIE_129", "PLATFORM_REACH_POINT_243" },
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
function action_EVENT_ANY_GADGET_DIE_129(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 344, 3004516) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_243(context, evt)
	-- 判断是gadgetid 为 344的移动平台，是否到达了3004516 的路线中的 3 点
	
	if 344 ~= evt.param1 then
	  return false
	end
	
	if 3004516 ~= evt.param2 then
	  return false
	end
	
	if 3 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_243(context, evt)
	-- 延迟1秒后,向groupId为：133004088的对象,请求一次调用,并将string参数："num_1" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133004088, "num_1", 1) then
	  return -1
	end
	
	return 0
end
