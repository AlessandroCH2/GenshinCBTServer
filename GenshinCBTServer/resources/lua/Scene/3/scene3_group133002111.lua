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
	{ config_id = 1383, gadget_id = 70210023, pos = { x = 1996.0, y = 268.3, z = -542.0 }, rot = { x = 0.0, y = 253.3, z = 0.0 }, level = 1, chest_drop_id = 403322, state = GadgetState.ChestBramble, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 258, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1987.9, y = 268.4, z = -546.2 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_258", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_258", trigger_count = 0 }
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
		gadgets = { 1383 },
		regions = { 258 },
		triggers = { "CLIENT_EXECUTE_258" },
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
function action_EVENT_CLIENT_EXECUTE_258(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
