--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 207, monster_id = 20011201, pos = { x = 2113.0, y = 241.1, z = -442.0 }, rot = { x = 0.0, y = 207.7, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 208, monster_id = 20011201, pos = { x = 2112.3, y = 240.5, z = -445.2 }, rot = { x = 0.0, y = 330.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 209, monster_id = 20011201, pos = { x = 2109.7, y = 240.6, z = -443.1 }, rot = { x = 0.0, y = 106.0, z = 0.0 }, level = 0, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 109, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2106.9, y = 239.3, z = -446.9 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_109", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_109", trigger_count = 0 }
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
		monsters = { 207, 208, 209 },
		gadgets = { },
		regions = { 109 },
		triggers = { "CLIENT_EXECUTE_109" },
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
function action_EVENT_CLIENT_EXECUTE_109(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
