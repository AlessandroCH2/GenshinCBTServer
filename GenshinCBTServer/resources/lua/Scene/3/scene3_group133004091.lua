--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 243, monster_id = 21010201, pos = { x = 2286.7, y = 271.0, z = -268.3 }, rot = { x = 0.0, y = 129.7, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true, pose_id = 0 },
	{ config_id = 244, monster_id = 21010301, pos = { x = 2287.7, y = 270.9, z = -271.4 }, rot = { x = 0.0, y = 22.8, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true, pose_id = 0 },
	{ config_id = 246, monster_id = 21010401, pos = { x = 2286.2, y = 270.9, z = -270.2 }, rot = { x = 0.0, y = 78.5, z = 0.0 }, level = 12, drop_id = 303043, disableWander = true, pose_id = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 349, gadget_id = 70710002, pos = { x = 2287.6, y = 271.0, z = -269.8 }, rot = { x = 0.0, y = 251.1, z = 0.0 }, level = 1, route_id = 3004513, save_route = true }
}

-- 区域
regions = {
	{ config_id = 128, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2287.2, y = 271.0, z = -270.1 } },
	{ config_id = 276, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2252.3, y = 270.5, z = -256.3 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_128", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_128", action = "action_EVENT_ENTER_REGION_128", tlog_tag = "奔狼岭_91_谜题破解_结算" },
	{ name = "PLATFORM_REACH_POINT_276", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "349", condition = "condition_EVENT_PLATFORM_REACH_POINT_276", action = "action_EVENT_PLATFORM_REACH_POINT_276" }
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
		monsters = { 243, 244, 246 },
		gadgets = { 349 },
		regions = { 128, 276 },
		triggers = { "ENTER_REGION_128", "PLATFORM_REACH_POINT_276" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_128(context, evt)
	if evt.param1 ~= 128 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_128(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 349, 3004514) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_276(context, evt)
	-- 判断是gadgetid 为 349的移动平台，是否到达了3004514 的路线中的 2 点
	
	if 349 ~= evt.param1 then
	  return false
	end
	
	if 3004514 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_276(context, evt)
	-- 延迟1秒后,向groupId为：133004088的对象,请求一次调用,并将string参数："num_1" 传递过去
	if 0 ~= ScriptLib.CreateGroupTimerEvent(context, 133004088, "num_1", 1) then
	  return -1
	end
	
	return 0
end
