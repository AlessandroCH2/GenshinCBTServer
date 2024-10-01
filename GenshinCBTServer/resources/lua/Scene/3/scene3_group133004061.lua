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
	{ config_id = 224, gadget_id = 70710002, pos = { x = 2116.0, y = 219.6, z = -524.8 }, rot = { x = 0.0, y = 354.0, z = 0.0 }, level = 1, route_id = 3004486, save_route = true },
	{ config_id = 279, gadget_id = 70210031, pos = { x = 2092.4, y = 225.0, z = -529.8 }, rot = { x = 0.0, y = 79.4, z = 344.9 }, level = 1, chest_drop_id = 403343, isOneoff = true },
	{ config_id = 522, gadget_id = 70900042, pos = { x = 2091.0, y = 224.7, z = -529.8 }, rot = { x = 11.5, y = 178.9, z = 2.1 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 53, shape = RegionShape.SPHERE, radius = 2, pos = { x = 2114.8, y = 220.0, z = -523.5 } },
	{ config_id = 54, shape = RegionShape.SPHERE, radius = 1, pos = { x = 2091.0, y = 226.4, z = -530.2 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_53", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_53", action = "action_EVENT_ENTER_REGION_53", tlog_tag = "奔狼岭_61_移动精灵_开始" },
	{ name = "PLATFORM_REACH_POINT_54", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "224", condition = "condition_EVENT_PLATFORM_REACH_POINT_54", action = "action_EVENT_PLATFORM_REACH_POINT_54", tlog_tag = "奔狼岭_61_移动精灵_结束" }
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
		gadgets = { 224, 522 },
		regions = { 53, 54 },
		triggers = { "ENTER_REGION_53", "PLATFORM_REACH_POINT_54" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_53(context, evt)
	if evt.param1 ~= 53 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_53(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 224, 3004487) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_54(context, evt)
	-- 判断是gadgetid 为 224的移动平台，是否到达了3004487 的路线中的 3 点
	
	if 224 ~= evt.param1 then
	  return false
	end
	
	if 3004487 ~= evt.param2 then
	  return false
	end
	
	if 3 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_54(context, evt)
	-- 创建id为279的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 279 }) then
	  return -1
	end
	
	return 0
end
