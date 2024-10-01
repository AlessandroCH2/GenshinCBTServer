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
	{ config_id = 245, gadget_id = 70210011, pos = { x = 2111.5, y = 228.7, z = -525.7 }, rot = { x = 0.0, y = 215.5, z = 4.6 }, level = 1, chest_drop_id = 403303, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 107, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2104.5, y = 223.5, z = -534.0 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_107", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_107", trigger_count = 0 }
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
		gadgets = { 245 },
		regions = { 107 },
		triggers = { "CLIENT_EXECUTE_107" },
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
function action_EVENT_CLIENT_EXECUTE_107(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
