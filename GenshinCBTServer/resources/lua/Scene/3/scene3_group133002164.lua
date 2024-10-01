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
	{ config_id = 1446, gadget_id = 70710002, pos = { x = 1737.6, y = 263.6, z = -891.9 }, rot = { x = 0.0, y = 5.7, z = 0.0 }, level = 1, route_id = 83, save_route = true }
}

-- 区域
regions = {
	{ config_id = 168, shape = RegionShape.SPHERE, radius = 5.7, pos = { x = 1736.1, y = 265.0, z = -897.2 } },
	{ config_id = 171, shape = RegionShape.SPHERE, radius = 2.4, pos = { x = 1712.9, y = 267.6, z = -904.6 } },
	{ config_id = 172, shape = RegionShape.SPHERE, radius = 1, pos = { x = 1685.1, y = 265.2, z = -866.7 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_168", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_168", action = "action_EVENT_ENTER_REGION_168", tlog_tag = "酒庄_164_高崖移动精灵_开始触发" },
	{ name = "ENTER_REGION_171", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_171", action = "action_EVENT_ENTER_REGION_171" },
	{ name = "PLATFORM_REACH_POINT_172", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "", condition = "condition_EVENT_PLATFORM_REACH_POINT_172", action = "action_EVENT_PLATFORM_REACH_POINT_172", tlog_tag = "酒庄_164_高崖移动精灵_触发奖励" }
}

-- 变量
variables = {
	{ name = "door1", value = 0, persistent = true },
	{ name = "door2", value = 0, persistent = true },
	{ name = "door3", value = 0, persistent = true },
	{ name = "door4", value = 0, persistent = true }
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
		gadgets = { 1446 },
		regions = { 168, 171, 172 },
		triggers = { "ENTER_REGION_168", "ENTER_REGION_171", "PLATFORM_REACH_POINT_172" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_168(context, evt)
	if evt.param1 ~= 168 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_168(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1446, 97) then
	  return -1
	end
	
	-- 将本组内变量名为 "door1" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "door1", 1) then
	  return -1
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
	
	-- 判断变量"door1"为1
	if ScriptLib.GetGroupVariableValue(context, "door1") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_171(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 1446, 3002132) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_PLATFORM_REACH_POINT_172(context, evt)
	-- 判断是gadgetid 为 1446的移动平台，是否到达了3002132 的路线中的 2 点
	
	if 1446 ~= evt.param1 then
	  return false
	end
	
	if 3002132 ~= evt.param2 then
	  return false
	end
	
	if 2 ~= evt.param3 then
	  return false
	end
	
	
	return true
end

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_172(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133002102, suite = 2 }) then
			return -1
		end
	
	return 0
end
