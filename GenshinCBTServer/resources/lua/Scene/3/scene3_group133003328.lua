--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1066, monster_id = 20010201, pos = { x = 2642.6, y = 249.2, z = -1239.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3430, gadget_id = 70210011, pos = { x = 2683.5, y = 248.2, z = -1322.2 }, rot = { x = 17.0, y = 347.8, z = 0.0 }, level = 1, chest_drop_id = 403303, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 401, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2663.3, y = 247.7, z = -1268.9 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_401", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_401", trigger_count = 0 }
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
		monsters = { 1066 },
		gadgets = { 3430 },
		regions = { 401 },
		triggers = { "CLIENT_EXECUTE_401" },
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
function action_EVENT_CLIENT_EXECUTE_401(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
