--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1010, monster_id = 28030101, pos = { x = 2831.1, y = 265.1, z = -1883.9 }, rot = { x = 0.0, y = 207.1, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 1011, monster_id = 28030101, pos = { x = 2830.9, y = 265.4, z = -1880.9 }, rot = { x = 0.0, y = 204.4, z = 0.0 }, level = 0, pose_id = 2 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3254, gadget_id = 70210011, pos = { x = 2842.7, y = 262.0, z = -1872.2 }, rot = { x = 0.7, y = 196.8, z = 8.9 }, level = 1, chest_drop_id = 403304, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 383, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2837.3, y = 265.5, z = -1890.6 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_383", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_383", trigger_count = 0 }
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
		monsters = { 1010, 1011 },
		gadgets = { 3254 },
		regions = { 383 },
		triggers = { "CLIENT_EXECUTE_383" },
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
function action_EVENT_CLIENT_EXECUTE_383(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
