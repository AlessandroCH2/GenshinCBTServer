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
	{ config_id = 439, gadget_id = 70710002, pos = { x = 2818.8, y = 208.2, z = 1.2 }, rot = { x = 0.0, y = 158.8, z = 0.0 }, level = 1, route_id = 3007087, save_route = true },
	{ config_id = 600, gadget_id = 70900042, pos = { x = 2877.2, y = 217.9, z = -98.3 }, rot = { x = 0.0, y = 73.9, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 62, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2817.3, y = 206.8, z = 0.3 } },
	{ config_id = 63, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2880.0, y = 208.9, z = -48.3 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_62", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_62", action = "action_EVENT_ENTER_REGION_62" },
	{ name = "ENTER_REGION_63", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_63", action = "action_EVENT_ENTER_REGION_63" }
}

-- 变量
variables = {
	{ name = "spirit", value = 0, persistent = false }
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
function condition_EVENT_ENTER_REGION_62(context, evt)
	if evt.param1 ~= 62 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	-- 判断变量"spirit"为0
	if ScriptLib.GetGroupVariableValue(context, "spirit") ~= 0 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_62(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 439, 3007076) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_63(context, evt)
	if evt.param1 ~= 63 then return false end
	
	-- 判断变量"spirit"为1
	if ScriptLib.GetGroupVariableValue(context, "spirit") ~= 1 then
			return false
	end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_63(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 439, 3007077) then
	  return -1
	end
	
	-- 将本组内变量名为 "spirit" 的变量设置为 2
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "spirit", 2) then
	  return -1
	end
	
	return 0
end
