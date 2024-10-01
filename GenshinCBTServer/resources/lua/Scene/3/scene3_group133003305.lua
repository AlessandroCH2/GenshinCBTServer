--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1005, monster_id = 21030101, pos = { x = 2889.8, y = 257.7, z = -1836.7 }, rot = { x = 0.0, y = 217.1, z = 0.0 }, level = 16, drop_id = 303004, disableWander = true },
	{ config_id = 1006, monster_id = 20011001, pos = { x = 2889.9, y = 257.5, z = -1839.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true },
	{ config_id = 1007, monster_id = 21010401, pos = { x = 2887.7, y = 257.5, z = -1839.5 }, rot = { x = 0.0, y = 34.2, z = 0.0 }, level = 16, drop_id = 303004, disableWander = true },
	{ config_id = 1008, monster_id = 21010901, pos = { x = 2876.8, y = 259.9, z = -1845.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303004 },
	{ config_id = 1009, monster_id = 21010901, pos = { x = 2880.4, y = 266.0, z = -1839.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 16, drop_id = 303004 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3247, gadget_id = 70220013, pos = { x = 2883.9, y = 257.5, z = -1836.2 }, rot = { x = 0.0, y = 350.6, z = 0.0 }, level = 1 },
	{ config_id = 3248, gadget_id = 70220013, pos = { x = 2885.4, y = 257.4, z = -1838.6 }, rot = { x = 0.0, y = 34.7, z = 0.0 }, level = 1 },
	{ config_id = 3249, gadget_id = 70220014, pos = { x = 2885.7, y = 257.3, z = -1840.9 }, rot = { x = 0.0, y = 86.2, z = 0.0 }, level = 1 },
	{ config_id = 3250, gadget_id = 70310001, pos = { x = 2887.5, y = 257.7, z = -1834.7 }, rot = { x = 0.0, y = 267.2, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 3251, gadget_id = 70210011, pos = { x = 2883.9, y = 257.4, z = -1838.5 }, rot = { x = 0.0, y = 312.6, z = 0.0 }, level = 1, chest_drop_id = 403304, isOneoff = true },
	{ config_id = 3252, gadget_id = 70310004, pos = { x = 2888.4, y = 257.6, z = -1837.7 }, rot = { x = 0.0, y = 175.1, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 380, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2866.1, y = 255.8, z = -1856.4 } },
	{ config_id = 381, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2866.1, y = 255.8, z = -1856.4 } },
	{ config_id = 437, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2866.1, y = 255.8, z = -1856.4 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_380", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_380", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_381", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_381", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_437", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_437", trigger_count = 0 }
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
		monsters = { 1005, 1006, 1007, 1008, 1009 },
		gadgets = { 3247, 3248, 3249, 3250, 3251, 3252 },
		regions = { 380, 381, 437 },
		triggers = { "CLIENT_EXECUTE_380", "CLIENT_EXECUTE_381", "CLIENT_EXECUTE_437" },
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
function action_EVENT_CLIENT_EXECUTE_380(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_381(context, evt)
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
function action_EVENT_CLIENT_EXECUTE_437(context, evt)
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
