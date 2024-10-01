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
	{ config_id = 42, gadget_id = 70900208, pos = { x = 221.4, y = -10.5, z = -146.4 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 43, gadget_id = 70900208, pos = { x = 221.4, y = -10.5, z = -143.3 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 44, gadget_id = 70900208, pos = { x = 221.4, y = -10.5, z = -140.2 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 45, gadget_id = 70900208, pos = { x = 221.3, y = -10.5, z = -137.1 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 46, gadget_id = 70900208, pos = { x = 221.5, y = -10.5, z = -133.5 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 47, gadget_id = 70350004, pos = { x = 221.8, y = -10.5, z = -129.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 48, gadget_id = 70900224, pos = { x = 221.6, y = -9.5, z = -131.7 }, rot = { x = 0.0, y = 359.1, z = 0.0 }, level = 1 },
	{ config_id = 52, gadget_id = 70900208, pos = { x = 231.1, y = -10.5, z = -140.0 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 53, gadget_id = 70900208, pos = { x = 228.1, y = -10.5, z = -140.0 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 54, gadget_id = 70900208, pos = { x = 225.1, y = -10.5, z = -139.9 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 56, gadget_id = 70900206, pos = { x = 233.9, y = -10.5, z = -140.1 }, rot = { x = 0.0, y = 190.4, z = 0.0 }, level = 1 },
	{ config_id = 58, gadget_id = 70900224, pos = { x = 234.0, y = -7.8, z = -140.1 }, rot = { x = 0.0, y = 359.1, z = 0.0 }, level = 1 },
	{ config_id = 60, gadget_id = 70220005, pos = { x = 231.2, y = -10.5, z = -140.9 }, rot = { x = 0.0, y = 317.4, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 8, shape = RegionShape.SPHERE, radius = 5, pos = { x = 221.2, y = -9.6, z = -134.3 } },
	{ config_id = 10, shape = RegionShape.SPHERE, radius = 5, pos = { x = 232.7, y = -10.5, z = -138.9 } },
	{ config_id = 12, shape = RegionShape.SPHERE, radius = 5, pos = { x = 231.8, y = -10.5, z = -138.9 } },
	{ config_id = 14, shape = RegionShape.SPHERE, radius = 5, pos = { x = 217.5, y = -10.5, z = -131.4 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_8", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElectricSwitch_Hit", condition = "condition_EVENT_CLIENT_EXECUTE_8", action = "action_EVENT_CLIENT_EXECUTE_8" },
	{ name = "CLIENT_EXECUTE_10", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElectricSwitch_Hit", condition = "condition_EVENT_CLIENT_EXECUTE_10", action = "action_EVENT_CLIENT_EXECUTE_10" },
	{ name = "CLIENT_EXECUTE_12", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElectricSwitch_Unhit", condition = "condition_EVENT_CLIENT_EXECUTE_12", action = "action_EVENT_CLIENT_EXECUTE_12" },
	{ name = "CLIENT_EXECUTE_14", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElectricSwitch_Unhit", condition = "condition_EVENT_CLIENT_EXECUTE_14", action = "action_EVENT_CLIENT_EXECUTE_14" }
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
		gadgets = { 42, 43, 44, 45, 46, 47, 48, 52, 53, 54, 56, 58, 60 },
		regions = { 8, 10, 12, 14 },
		triggers = { "CLIENT_EXECUTE_8", "CLIENT_EXECUTE_10", "CLIENT_EXECUTE_12", "CLIENT_EXECUTE_14" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_CLIENT_EXECUTE_8(context, evt)
	-- 判断是gadgetid 57 option_id 0
	if 48 == ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid }) then
	
	return true
	
	end
end

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_8(context, evt)
	-- 将configid为 47 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 47, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_CLIENT_EXECUTE_10(context, evt)
	-- 判断是gadgetid 57 option_id 0
	if 58 == ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid }) then
	
	return true
	
	end
end

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_10(context, evt)
	-- 将configid为 56 的物件更改为状态 GadgetState.GearAction1
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 56, GadgetState.GearAction1) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_CLIENT_EXECUTE_12(context, evt)
	-- 判断是gadgetid 57 option_id 0
	if 58 == ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid }) then
	
	return true
	
	end
end

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_12(context, evt)
	-- 将configid为 56 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 56, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_CLIENT_EXECUTE_14(context, evt)
	-- 判断是gadgetid 57 option_id 0
	if 48 == ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid }) then
	
	return true
	
	end
end

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_14(context, evt)
	-- 将configid为 47 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 47, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
