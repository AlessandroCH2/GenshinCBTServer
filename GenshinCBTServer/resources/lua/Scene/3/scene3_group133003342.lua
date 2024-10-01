--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1420, monster_id = 21010101, pos = { x = 2632.8, y = 250.1, z = -1298.0 }, rot = { x = 0.0, y = 250.9, z = 0.0 }, level = 12, disableWander = true, pose_id = 9002 },
	{ config_id = 1421, monster_id = 21010101, pos = { x = 2631.8, y = 250.3, z = -1295.8 }, rot = { x = 0.0, y = 249.9, z = 0.0 }, level = 12, disableWander = true, pose_id = 9002 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3429, gadget_id = 70210011, pos = { x = 2679.1, y = 245.1, z = -1291.8 }, rot = { x = 0.8, y = 290.1, z = 359.6 }, level = 1, chest_drop_id = 403302, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 409, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2667.3, y = 245.9, z = -1296.4 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_409", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_409", trigger_count = 0 }
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
		monsters = { 1420, 1421 },
		gadgets = { 3429 },
		regions = { 409 },
		triggers = { "CLIENT_EXECUTE_409" },
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
function action_EVENT_CLIENT_EXECUTE_409(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
