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
	{ config_id = 2231, gadget_id = 70710002, pos = { x = 2042.8, y = 197.1, z = -1184.1 }, rot = { x = 0.0, y = 244.8, z = 0.0 }, level = 1, route_id = 3001129, save_route = true },
	{ config_id = 2233, gadget_id = 70210021, pos = { x = 2016.4, y = 196.4, z = -1232.3 }, rot = { x = 0.0, y = 357.7, z = 0.0 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true },
	{ config_id = 2402, gadget_id = 70900042, pos = { x = 2016.4, y = 196.3, z = -1233.6 }, rot = { x = 357.6, y = 265.8, z = 45.3 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 187, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2049.5, y = 198.3, z = -1192.2 } },
	{ config_id = 307, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2038.2, y = 196.9, z = -1181.4 } },
	{ config_id = 371, shape = RegionShape.SPHERE, radius = 1, pos = { x = 2016.4, y = 197.7, z = -1234.8 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_187", event = EventType.EVENT_ENTER_REGION, source = "1", condition = "condition_EVENT_ENTER_REGION_187", action = "action_EVENT_ENTER_REGION_187", tlog_tag = "小平原_精灵草_草原_开始" },
	{ name = "CLIENT_EXECUTE_307", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_307", trigger_count = 0 },
	{ name = "PLATFORM_REACH_POINT_371", event = EventType.EVENT_PLATFORM_REACH_POINT, source = "2231", condition = "", action = "action_EVENT_PLATFORM_REACH_POINT_371", tlog_tag = "小平原_精灵草_草原_结束" }
}

-- 变量
variables = {
	{ name = "route", value = 0, persistent = true }
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
		gadgets = { 2231, 2402 },
		regions = { 187, 307, 371 },
		triggers = { "ENTER_REGION_187", "CLIENT_EXECUTE_307", "PLATFORM_REACH_POINT_371" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_187(context, evt)
	if evt.param1 ~= 187 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"route"为0
	if ScriptLib.GetGroupVariableValue(context, "route") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_187(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 2231, 89) then
	  return -1
	end
	
	-- 将本组内变量名为 "route" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "route", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_307(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_PLATFORM_REACH_POINT_371(context, evt)
	-- 创建id为2233的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2233 }) then
	  return -1
	end
	
	return 0
end
