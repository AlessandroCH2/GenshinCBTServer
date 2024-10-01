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
	{ config_id = 816, gadget_id = 70210021, pos = { x = 1461.6, y = 257.7, z = -1447.3 }, rot = { x = 0.0, y = 311.3, z = 0.0 }, level = 12, chest_drop_id = 403323, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 265, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1463.6, y = 257.3, z = -1453.9 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_265", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_265", trigger_count = 0 }
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
		monsters = { },
		gadgets = { 816 },
		regions = { 265 },
		triggers = { "CLIENT_EXECUTE_265" },
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
function action_EVENT_CLIENT_EXECUTE_265(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
