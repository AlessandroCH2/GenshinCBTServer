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
	{ config_id = 14, gadget_id = 70900037, pos = { x = -7.6, y = 0.0, z = -10.1 }, rot = { x = 0.0, y = 42.8, z = 0.0 }, level = 1 },
	{ config_id = 15, gadget_id = 70900038, pos = { x = -7.6, y = 0.0, z = -10.1 }, rot = { x = 0.0, y = 114.7, z = 0.0 }, level = 1 },
	{ config_id = 28, gadget_id = 70210054, pos = { x = -1.9, y = 21.0, z = 6.1 }, rot = { x = 0.0, y = 234.4, z = 0.0 }, level = 1, chest_drop_id = 403145, state = GadgetState.ChestFrozen },
	{ config_id = 32, gadget_id = 70310002, pos = { x = -0.2, y = 21.0, z = 9.1 }, rot = { x = 0.0, y = 62.6, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 20, shape = RegionShape.SPHERE, radius = 5, pos = { x = -2.1, y = 0.0, z = -11.0 } },
	{ config_id = 24, shape = RegionShape.SPHERE, radius = 5, pos = { x = -2.1, y = 0.0, z = -11.0 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_20", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_20", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_24", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_24", trigger_count = 0 }
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
		gadgets = { 14, 15, 28, 32 },
		regions = { 20, 24 },
		triggers = { "CLIENT_EXECUTE_20", "CLIENT_EXECUTE_24" },
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
function action_EVENT_CLIENT_EXECUTE_20(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		ScriptLib.SetGroupGadgetStateByConfigId(context, 0, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_24(context, evt)
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
