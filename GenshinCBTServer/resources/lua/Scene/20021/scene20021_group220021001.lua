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
	{ config_id = 1, gadget_id = 70380003, pos = { x = 184.6, y = 42.5, z = -1.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, route_id = 20021001, start_route = false },
	{ config_id = 2, gadget_id = 70380003, pos = { x = 184.5, y = 42.5, z = -4.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, route_id = 20021002, start_route = false },
	{ config_id = 3, gadget_id = 70900207, pos = { x = 181.9, y = 44.1, z = 1.0 }, rot = { x = 0.0, y = 323.5, z = 0.0 }, level = 1 },
	{ config_id = 4, gadget_id = 70900207, pos = { x = 187.5, y = 44.1, z = 1.2 }, rot = { x = 0.0, y = 5.0, z = 0.0 }, level = 1 },
	{ config_id = 9, gadget_id = 70900227, pos = { x = 191.8, y = 28.1, z = 15.1 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 10, gadget_id = 70900227, pos = { x = 191.9, y = 27.7, z = 12.4 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 11, gadget_id = 70900227, pos = { x = 192.1, y = 22.1, z = 4.5 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 12, gadget_id = 70900227, pos = { x = 192.3, y = 22.3, z = 0.9 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 13, gadget_id = 70900228, pos = { x = 191.8, y = 30.0, z = 15.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, route_id = 20021003 }
}

-- 区域
regions = {
	{ config_id = 1, shape = RegionShape.SPHERE, radius = 5, pos = { x = 184.5, y = 44.1, z = 1.3 } },
	{ config_id = 2, shape = RegionShape.SPHERE, radius = 5, pos = { x = 181.3, y = 44.1, z = 2.2 } },
	{ config_id = 3, shape = RegionShape.SPHERE, radius = 5, pos = { x = 180.0, y = 44.1, z = 1.4 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_1", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElectricPile", condition = "condition_EVENT_CLIENT_EXECUTE_1", action = "action_EVENT_CLIENT_EXECUTE_1" },
	{ name = "CLIENT_EXECUTE_2", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElectricPile", condition = "condition_EVENT_CLIENT_EXECUTE_2", action = "action_EVENT_CLIENT_EXECUTE_2" },
	{ name = "VARIABLE_CHANGE_3", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_3", action = "action_EVENT_VARIABLE_CHANGE_3" }
}

-- 变量
variables = {
	{ name = "Door", value = 0, persistent = false }
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
		gadgets = { 1, 2, 3, 4, 9, 10, 11, 12 },
		regions = { 1, 2, 3 },
		triggers = { "CLIENT_EXECUTE_1", "CLIENT_EXECUTE_2", "VARIABLE_CHANGE_3" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_CLIENT_EXECUTE_1(context, evt)
	if 3 ~= ScriptLib.GetGadgetConfig(context, { gadget_eid = evt.source_eid })   then
	return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_1(context, evt)
	-- 针对当前group内变量名为 "Door" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Door", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_CLIENT_EXECUTE_2(context, evt)
	if 4 ~= ScriptLib.GetGadgetConfig(context, { gadget_eid = evt.source_eid })   then
	return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_2(context, evt)
	-- 针对当前group内变量名为 "Door" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Door", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_3(context, evt)
	-- 判断变量"Door"为2
	if ScriptLib.GetGroupVariableValue(context, "Door") ~= 2 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_3(context, evt)
	-- 启动移动平台
	if 0 ~= ScriptLib.StartPlatform(context, 1) then
	  return -1
	end
	
	-- 启动移动平台
	if 0 ~= ScriptLib.StartPlatform(context, 2) then
	  return -1
	end
	
	return 0
end
