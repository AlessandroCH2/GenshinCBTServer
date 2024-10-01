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
	{ config_id = 346, gadget_id = 70620001, pos = { x = 2228.0, y = 270.2, z = -256.3 }, rot = { x = 0.0, y = 319.4, z = 0.0 }, level = 1 },
	{ config_id = 347, gadget_id = 70710002, pos = { x = 2225.5, y = 272.6, z = -254.7 }, rot = { x = 0.0, y = 123.5, z = 0.0 }, level = 1, route_id = 3004511, save_route = true },
	{ config_id = 348, gadget_id = 70900039, pos = { x = 2228.0, y = 270.6, z = -256.0 }, rot = { x = 0.0, y = 356.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 122, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2227.9, y = 270.7, z = -255.9 } },
	{ config_id = 275, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2252.8, y = 271.8, z = -263.4 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_122", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_122", action = "action_EVENT_GADGET_STATE_CHANGE_122", tlog_tag = "奔狼岭_90_谜题破解_结算" },
	{ name = "PLATFORM_REACH_POINT_275", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "347", condition = "condition_EVENT_PLATFORM_REACH_POINT_275", action = "action_EVENT_PLATFORM_REACH_POINT_275" }
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
		gadgets = { 346, 347, 348 },
		regions = { 122, 275 },
		triggers = { "GADGET_STATE_CHANGE_122", "PLATFORM_REACH_POINT_275" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_122(context, evt)
	if 348 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_122(context, evt)
		-- 永久关闭CongfigId的Gadget，需要和Groups的RefreshWithBlock标签搭配
		if 0 ~= ScriptLib.KillEntityByConfigId(context, { config_id = 346 }) then
		    return -1
		end
		
	
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 347, 3004512) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_275(context, evt)
	-- 判断是gadgetid 为 347的移动平台，是否到达了3004512 的路线中的 2 点
	
	if 347 ~= evt.param1 then
	  return false
	end
	
	if 3004512 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_275(context, evt)
	-- 延迟1秒后,向groupId为：133004088的对象,请求一次调用,并将string参数："num_1" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133004088, "num_1", 1) then
	  return -1
	end
	
	return 0
end
