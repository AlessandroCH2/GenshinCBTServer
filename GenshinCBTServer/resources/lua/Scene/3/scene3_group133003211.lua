--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 866, monster_id = 21010501, pos = { x = 2731.2, y = 274.8, z = -1171.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 303002 },
	{ config_id = 867, monster_id = 21010501, pos = { x = 2734.7, y = 280.8, z = -1174.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 303002 },
	{ config_id = 868, monster_id = 21010201, pos = { x = 2748.1, y = 265.4, z = -1188.8 }, rot = { x = 0.0, y = 20.2, z = 0.0 }, level = 10, drop_id = 303002, disableWander = true },
	{ config_id = 869, monster_id = 21010601, pos = { x = 2742.0, y = 271.9, z = -1176.2 }, rot = { x = 0.0, y = 124.1, z = 0.0 }, level = 10, drop_id = 303002, disableWander = true },
	{ config_id = 898, monster_id = 21010701, pos = { x = 2757.2, y = 264.9, z = -1189.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 303002 },
	{ config_id = 899, monster_id = 20011201, pos = { x = 2749.3, y = 266.2, z = -1184.9 }, rot = { x = 0.0, y = 178.4, z = 0.0 }, level = 10, drop_id = 303002, disableWander = true },
	{ config_id = 900, monster_id = 20011201, pos = { x = 2751.6, y = 265.7, z = -1186.5 }, rot = { x = 0.0, y = 249.9, z = 0.0 }, level = 10, drop_id = 303002, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2971, gadget_id = 70500000, pos = { x = 2769.7, y = 277.0, z = -1195.9 }, rot = { x = 0.0, y = 217.5, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 2983, gadget_id = 70210031, pos = { x = 2735.4, y = 285.5, z = -1167.8 }, rot = { x = 0.0, y = 179.2, z = 0.0 }, level = 1, chest_drop_id = 403142, isOneoff = true },
	{ config_id = 2988, gadget_id = 70220013, pos = { x = 2749.8, y = 267.8, z = -1177.7 }, rot = { x = 15.1, y = 182.7, z = 355.0 }, level = 1 },
	{ config_id = 2989, gadget_id = 70220013, pos = { x = 2750.3, y = 268.1, z = -1175.1 }, rot = { x = 0.0, y = 128.7, z = 350.5 }, level = 1 },
	{ config_id = 2990, gadget_id = 70220014, pos = { x = 2751.3, y = 268.1, z = -1177.0 }, rot = { x = 0.0, y = 125.7, z = 0.0 }, level = 1 },
	{ config_id = 2991, gadget_id = 70310004, pos = { x = 2749.5, y = 265.7, z = -1187.0 }, rot = { x = 0.0, y = 145.9, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 2992, gadget_id = 70210011, pos = { x = 2748.7, y = 268.0, z = -1175.8 }, rot = { x = 0.0, y = 25.5, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 341, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2736.2, y = 265.4, z = -1168.9 } },
	{ config_id = 342, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2736.2, y = 265.4, z = -1168.9 } },
	{ config_id = 428, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2736.2, y = 265.4, z = -1168.9 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_341", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_341", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_342", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_342", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_428", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_428", trigger_count = 0 }
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
		monsters = { 866, 867, 868, 869, 898, 899, 900 },
		gadgets = { 2971, 2983, 2988, 2989, 2990, 2991, 2992 },
		regions = { 341, 342, 428 },
		triggers = { "CLIENT_EXECUTE_341", "CLIENT_EXECUTE_342", "CLIENT_EXECUTE_428" },
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
function action_EVENT_CLIENT_EXECUTE_341(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_342(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Defautl )
		return 0
	end
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_428(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Default )
		return 0
	end
	return 0
end
