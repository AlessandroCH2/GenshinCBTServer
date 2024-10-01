--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 626, monster_id = 21010501, pos = { x = 2214.7, y = 217.0, z = -1522.2 }, rot = { x = 0.0, y = 327.7, z = 0.0 }, level = 6, drop_id = 303002 },
	{ config_id = 627, monster_id = 21010201, pos = { x = 2223.0, y = 217.5, z = -1525.9 }, rot = { x = 0.0, y = 163.0, z = 0.0 }, level = 6, drop_id = 303002, disableWander = true },
	{ config_id = 628, monster_id = 21010201, pos = { x = 2220.0, y = 217.5, z = -1527.5 }, rot = { x = 0.0, y = 93.8, z = 0.0 }, level = 6, drop_id = 303002 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2832, gadget_id = 70210011, pos = { x = 2228.6, y = 217.8, z = -1530.3 }, rot = { x = 0.0, y = 314.9, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 327, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2214.6, y = 217.2, z = -1523.8 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_327", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_327", trigger_count = 0 }
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
		monsters = { 626, 627, 628 },
		gadgets = { 2832 },
		regions = { 327 },
		triggers = { "CLIENT_EXECUTE_327" },
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
function action_EVENT_CLIENT_EXECUTE_327(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
