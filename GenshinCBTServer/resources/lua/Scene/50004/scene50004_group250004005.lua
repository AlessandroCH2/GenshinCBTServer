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
	{ config_id = 35, gadget_id = 70900207, pos = { x = 290.6, y = -10.5, z = -112.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 36, gadget_id = 70900208, pos = { x = 290.6, y = -10.5, z = -109.6 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 37, gadget_id = 70900208, pos = { x = 290.6, y = -10.5, z = -106.5 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 38, gadget_id = 70900208, pos = { x = 290.5, y = -10.5, z = -103.5 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 39, gadget_id = 70900208, pos = { x = 290.7, y = -10.5, z = -99.8 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 40, gadget_id = 70900206, pos = { x = 292.8, y = -10.5, z = -98.5 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1 },
	{ config_id = 41, gadget_id = 70900224, pos = { x = 292.8, y = -7.7, z = -98.5 }, rot = { x = 0.0, y = 359.1, z = 0.0 }, level = 1 },
	{ config_id = 81, gadget_id = 70220005, pos = { x = 291.4, y = -10.5, z = -106.7 }, rot = { x = 0.0, y = 317.4, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 4, shape = RegionShape.SPHERE, radius = 5, pos = { x = 290.9, y = -10.5, z = -103.2 } },
	{ config_id = 13, shape = RegionShape.SPHERE, radius = 5, pos = { x = 292.1, y = -10.5, z = -97.4 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_4", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElectricSwitch_Unhit", condition = "condition_EVENT_CLIENT_EXECUTE_4", action = "action_EVENT_CLIENT_EXECUTE_4" },
	{ name = "CLIENT_EXECUTE_13", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElectricSwitch_Hit", condition = "condition_EVENT_CLIENT_EXECUTE_13", action = "action_EVENT_CLIENT_EXECUTE_13" }
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
		gadgets = { 35, 36, 37, 38, 39, 40, 41, 81 },
		regions = { 4, 13 },
		triggers = { "CLIENT_EXECUTE_4", "CLIENT_EXECUTE_13" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_CLIENT_EXECUTE_4(context, evt)
	-- 判断是gadgetid 57 option_id 0
	if 41 == ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid }) then
	
	return true
	
	end
end

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_4(context, evt)
	-- 将configid为 40 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 40, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_CLIENT_EXECUTE_13(context, evt)
	-- 判断是gadgetid 57 option_id 0
	if 41 == ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid }) then
	
	return true
	
	end
end

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_13(context, evt)
	-- 将configid为 40 的物件更改为状态 GadgetState.GearAction2
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 40, GadgetState.GearAction2) then
			return -1
		end 
	
	return 0
end
