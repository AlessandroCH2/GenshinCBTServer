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
	{ config_id = 2917, gadget_id = 70900042, pos = { x = 1661.8, y = 266.4, z = -1295.3 }, rot = { x = 0.0, y = 273.6, z = 0.0 }, level = 1 },
	{ config_id = 2918, gadget_id = 70290002, pos = { x = 1636.6, y = 247.5, z = -1294.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2919, gadget_id = 70500000, pos = { x = 1635.6, y = 249.1, z = -1294.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2918 },
	{ config_id = 2920, gadget_id = 70500000, pos = { x = 1637.5, y = 250.1, z = -1295.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2918 },
	{ config_id = 2921, gadget_id = 70500000, pos = { x = 1636.7, y = 250.4, z = -1293.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2918 },
	{ config_id = 2922, gadget_id = 70710002, pos = { x = 1635.4, y = 247.8, z = -1295.7 }, rot = { x = 0.0, y = 336.2, z = 0.0 }, level = 1, route_id = 3001193, save_route = true },
	{ config_id = 2923, gadget_id = 70210031, pos = { x = 1663.5, y = 266.8, z = -1291.6 }, rot = { x = 12.0, y = 122.2, z = 0.4 }, level = 1, chest_drop_id = 403322, showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 335, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1659.0, y = 260.4, z = -1296.0 } },
	{ config_id = 336, shape = RegionShape.SPHERE, radius = 3.7, pos = { x = 1636.8, y = 248.2, z = -1295.3 } },
	{ config_id = 337, shape = RegionShape.SPHERE, radius = 3.7, pos = { x = 1663.5, y = 266.3, z = -1293.8 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_335", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_335", action = "action_EVENT_ENTER_REGION_335", trigger_count = 0 },
	{ name = "ENTER_REGION_336", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_336", action = "action_EVENT_ENTER_REGION_336", trigger_count = 0 },
	{ name = "ENTER_REGION_337", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_337", action = "action_EVENT_ENTER_REGION_337", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "route", value = 0, persistent = false }
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
		gadgets = { 2917, 2918, 2919, 2920, 2921, 2922 },
		regions = { 335, 336, 337 },
		triggers = { "ENTER_REGION_335", "ENTER_REGION_336", "ENTER_REGION_337" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_335(context, evt)
	if evt.param1 ~= 335 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"route"为1
	if ScriptLib.GetGroupVariableValue(context, "route") ~= 1 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_335(context, evt)
	-- 将本组内变量名为 "route" 的变量设置为 2
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "route", 2) then
	  return -1
	end
	
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 2922, 3001196) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_336(context, evt)
	if evt.param1 ~= 336 then return false end
	
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
function action_EVENT_ENTER_REGION_336(context, evt)
	-- 将本组内变量名为 "route" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "route", 1) then
	  return -1
	end
	
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 2922, 3001194) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_337(context, evt)
	if evt.param1 ~= 337 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"route"为2
	if ScriptLib.GetGroupVariableValue(context, "route") ~= 2 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_337(context, evt)
	-- 将本组内变量名为 "route" 的变量设置为 3
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "route", 3) then
	  return -1
	end
	
	-- 创建id为2923的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2923 }) then
	  return -1
	end
	
	return 0
end
