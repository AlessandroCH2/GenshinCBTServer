--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1, monster_id = 20011201, pos = { x = -12.3, y = 0.0, z = 23.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2, monster_id = 20011201, pos = { x = -0.9, y = 0.0, z = 22.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3, monster_id = 20011201, pos = { x = 10.5, y = 0.0, z = 21.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1, gadget_id = 70210011, pos = { x = 16.0, y = 5.0, z = 28.4 }, rot = { x = 0.0, y = 272.8, z = 0.0 }, level = 1, chest_drop_id = 403143 },
	{ config_id = 12, gadget_id = 70310004, pos = { x = 2.3, y = 0.1, z = 2.8 }, rot = { x = 0.0, y = 108.4, z = 0.0 }, level = 1 },
	{ config_id = 13, gadget_id = 70310001, pos = { x = -1.2, y = 0.0, z = 2.6 }, rot = { x = 0.0, y = 137.3, z = 0.0 }, level = 1 },
	{ config_id = 20, gadget_id = 70500000, pos = { x = 1.5, y = 0.0, z = -15.6 }, rot = { x = 0.0, y = 192.7, z = 0.0 }, level = 1, point_type = 3001 },
	{ config_id = 21, gadget_id = 70310002, pos = { x = -1.1, y = 0.0, z = 0.8 }, rot = { x = 0.0, y = 145.3, z = 0.0 }, level = 1 },
	{ config_id = 22, gadget_id = 70520001, pos = { x = 1.6, y = 0.0, z = -13.1 }, rot = { x = 0.0, y = 293.3, z = 0.0 }, level = 1 },
	{ config_id = 23, gadget_id = 70520002, pos = { x = 4.1, y = 0.0, z = -14.6 }, rot = { x = 0.0, y = 335.3, z = 0.0 }, level = 1 },
	{ config_id = 26, gadget_id = 70210052, pos = { x = -5.8, y = 21.0, z = 6.1 }, rot = { x = 0.0, y = 221.8, z = 0.0 }, level = 1, chest_drop_id = 403143, state = GadgetState.ChestLocked },
	{ config_id = 30, gadget_id = 70310001, pos = { x = -6.3, y = 21.0, z = 8.6 }, rot = { x = 0.0, y = 264.1, z = 0.0 }, level = 1 },
	{ config_id = 33, gadget_id = 70350004, pos = { x = 5.6, y = 0.0, z = -9.8 }, rot = { x = 0.0, y = 272.5, z = 0.0 }, level = 1 },
	{ config_id = 34, gadget_id = 70900207, pos = { x = 8.2, y = 0.0, z = -8.1 }, rot = { x = 0.0, y = 169.2, z = 0.0 }, level = 1 },
	{ config_id = 35, gadget_id = 70900208, pos = { x = 4.8, y = 0.0, z = -8.2 }, rot = { x = 0.0, y = 6.6, z = 0.0 }, level = 1 },
	{ config_id = 38, gadget_id = 70900210, pos = { x = 1.9, y = 0.9, z = -16.8 }, rot = { x = 0.0, y = 123.1, z = 0.0 }, level = 1, route_id = 20007004 },
	{ config_id = 39, gadget_id = 70900209, pos = { x = 1.7, y = 0.4, z = 6.8 }, rot = { x = 0.0, y = 73.2, z = 0.0 }, level = 1 },
	{ config_id = 44, gadget_id = 70510009, pos = { x = -3.8, y = 0.0, z = -10.1 }, rot = { x = 0.0, y = 261.7, z = 0.0 }, level = 1 },
	{ config_id = 45, gadget_id = 70500000, pos = { x = -0.3, y = 0.0, z = -15.9 }, rot = { x = 0.0, y = 261.0, z = 0.0 }, level = 1, point_type = 3008 },
	{ config_id = 46, gadget_id = 70500000, pos = { x = -2.3, y = 0.0, z = -16.0 }, rot = { x = 0.0, y = 184.8, z = 0.0 }, level = 1, point_type = 3006 },
	{ config_id = 47, gadget_id = 70300055, pos = { x = -0.7, y = 1.7, z = 14.1 }, rot = { x = 0.0, y = 35.1, z = 0.0 }, level = 1 },
	{ config_id = 48, gadget_id = 70500000, pos = { x = -1.0, y = 0.0, z = -10.1 }, rot = { x = 0.0, y = 315.9, z = 0.0 }, level = 1, point_type = 6666 },
	{ config_id = 49, gadget_id = 70900213, pos = { x = 4.3, y = 0.8, z = 13.4 }, rot = { x = 0.0, y = 177.4, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 53, gadget_id = 70900217, pos = { x = -4.4, y = 7.3, z = 7.7 }, rot = { x = 0.0, y = 196.3, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 11, shape = RegionShape.SPHERE, radius = 5, pos = { x = 0.4, y = 0.0, z = -10.3 } },
	{ config_id = 16, shape = RegionShape.SPHERE, radius = 5, pos = { x = -0.7, y = 0.0, z = 14.5 } },
	{ config_id = 22, shape = RegionShape.SPHERE, radius = 5, pos = { x = -0.7, y = 0.0, z = 14.5 } },
	{ config_id = 25, shape = RegionShape.SPHERE, radius = 5, pos = { x = 4.4, y = 0.0, z = -7.3 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_11", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireFlora", condition = "", action = "action_EVENT_CLIENT_EXECUTE_11", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_16", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_16", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_22", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_22", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_25", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElectricPile", condition = "", action = "action_EVENT_CLIENT_EXECUTE_25", trigger_count = 0 }
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
		-- description = suite_1,
		monsters = { 1, 2, 3 },
		gadgets = { 1, 12, 13, 20, 21, 22, 23, 26, 30, 33, 34, 35, 38, 39, 44, 45, 46, 47 },
		regions = { 11, 16, 22, 25 },
		triggers = { "CLIENT_EXECUTE_11", "CLIENT_EXECUTE_16", "CLIENT_EXECUTE_22", "CLIENT_EXECUTE_25" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_11(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	ScriptLib.SetGroupGadgetStateByConfigId(context, 220007001, this_gadget, GadgetState.Action03 )
		ScriptLib.SetGadgetEnableInteract(context, 220007001, this_gadget, true)
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_16(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		ScriptLib.SetGroupGadgetStateByConfigId(context, 0, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_22(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, 0, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, 0, this_gadget, GadgetState.Defautl )
		return 0
	end
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_25(context, evt)
	ScriptLib.SetGroupGadgetStateByConfigId(context, 220007001, 33, GadgetState.GearStart )
	return 0
end
