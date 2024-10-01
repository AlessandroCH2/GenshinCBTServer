--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 232, monster_id = 28020102, pos = { x = 1730.5, y = 269.5, z = -949.3 }, rot = { x = 0.0, y = 14.6, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1375, gadget_id = 70210031, pos = { x = 1691.7, y = 262.3, z = -865.2 }, rot = { x = 352.2, y = 178.3, z = 356.4 }, level = 1, chest_drop_id = 403222, showcutscene = true, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 256, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2009.6, y = 211.2, z = -954.8 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_256", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_256", trigger_count = 0 }
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
	rand_suite = false,
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
		gadgets = { },
		regions = { 256 },
		triggers = { "CLIENT_EXECUTE_256" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 232 },
		gadgets = { 1375 },
		regions = { },
		triggers = { },
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
function action_EVENT_CLIENT_EXECUTE_256(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
