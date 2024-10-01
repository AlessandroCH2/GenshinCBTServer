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
	{ config_id = 12, gadget_id = 70900007, pos = { x = 134.5, y = 60.5, z = -29.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 13, gadget_id = 70900008, pos = { x = 135.0, y = 60.4, z = -14.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 19, gadget_id = 70380003, pos = { x = 116.4, y = 54.5, z = -27.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, route_id = 40007001, start_route = false },
	{ config_id = 20, gadget_id = 70380003, pos = { x = 99.8, y = 54.7, z = -17.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, route_id = 40007002, start_route = false },
	{ config_id = 21, gadget_id = 70210021, pos = { x = 82.0, y = 19.3, z = -47.4 }, rot = { x = 0.0, y = 65.6, z = 0.0 }, level = 1, chest_drop_id = 1400602, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 58, gadget_id = 70380003, pos = { x = 77.1, y = 17.8, z = -47.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, route_id = 40007003, start_route = false }
}

-- 区域
regions = {
	{ config_id = 5, shape = RegionShape.SPHERE, radius = 5, pos = { x = 135.3, y = 60.5, z = -28.5 } },
	{ config_id = 6, shape = RegionShape.SPHERE, radius = 5, pos = { x = 134.1, y = 60.4, z = -13.8 } },
	{ config_id = 10, shape = RegionShape.CUBIC, size = { x = 5.0, y = 5.0, z = 5.0 }, pos = { x = 76.1, y = 19.4, z = -47.3 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_5", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_5", action = "action_EVENT_GADGET_STATE_CHANGE_5" },
	{ name = "GADGET_STATE_CHANGE_6", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_6", action = "action_EVENT_GADGET_STATE_CHANGE_6" },
	{ name = "ENTER_REGION_10", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_10", action = "action_EVENT_ENTER_REGION_10" }
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
		gadgets = { 12, 13, 19, 20, 21, 58 },
		regions = { 5, 6, 10 },
		triggers = { "GADGET_STATE_CHANGE_5", "GADGET_STATE_CHANGE_6", "ENTER_REGION_10" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_5(context, evt)
	if 12 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_5(context, evt)
	-- 启动移动平台
	if 0 ~= ScriptLib.StartPlatform(context, 19) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_6(context, evt)
	if 13 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_6(context, evt)
	-- 启动移动平台
	if 0 ~= ScriptLib.StartPlatform(context, 20) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_10(context, evt)
	if evt.param1 ~= 10 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_10(context, evt)
	-- 启动移动平台
	if 0 ~= ScriptLib.StartPlatform(context, 58) then
	  return -1
	end
	
	return 0
end
