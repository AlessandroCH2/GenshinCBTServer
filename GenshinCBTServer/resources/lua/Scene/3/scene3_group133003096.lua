--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 492, monster_id = 21010501, pos = { x = 2184.1, y = 260.1, z = -1738.5 }, rot = { x = 0.0, y = 234.3, z = 0.0 }, level = 7, drop_id = 303003, disableWander = true, pose_id = 9003 },
	{ config_id = 494, monster_id = 21010201, pos = { x = 2185.6, y = 259.0, z = -1725.9 }, rot = { x = 0.0, y = 13.0, z = 0.0 }, level = 7, drop_id = 303003, disableWander = true },
	{ config_id = 499, monster_id = 21030201, pos = { x = 2181.2, y = 259.4, z = -1735.9 }, rot = { x = 0.0, y = 189.7, z = 0.0 }, level = 7, drop_id = 303003, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2431, gadget_id = 70210021, pos = { x = 2189.0, y = 260.6, z = -1740.4 }, rot = { x = 357.6, y = 204.7, z = 354.2 }, level = 1, chest_drop_id = 403103, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 300, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2190.5, y = 260.8, z = -1726.9 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_300", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_300", trigger_count = 0 }
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
		monsters = { 492, 494, 499 },
		gadgets = { 2431 },
		regions = { 300 },
		triggers = { "CLIENT_EXECUTE_300" },
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
function action_EVENT_CLIENT_EXECUTE_300(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
