--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 484, monster_id = 21010601, pos = { x = 2178.7, y = 244.7, z = -1589.0 }, rot = { x = 0.0, y = 3.9, z = 0.0 }, level = 8, drop_id = 303002, disableWander = true },
	{ config_id = 485, monster_id = 21010601, pos = { x = 2180.0, y = 244.9, z = -1586.6 }, rot = { x = 0.0, y = 14.4, z = 0.0 }, level = 8, drop_id = 303002, disableWander = true },
	{ config_id = 486, monster_id = 21010601, pos = { x = 2206.6, y = 250.3, z = -1628.8 }, rot = { x = 0.0, y = 6.8, z = 0.0 }, level = 9, drop_id = 303003, disableWander = true },
	{ config_id = 487, monster_id = 21010601, pos = { x = 2197.1, y = 249.9, z = -1627.5 }, rot = { x = 0.0, y = 30.9, z = 0.0 }, level = 9, drop_id = 303003, disableWander = true },
	{ config_id = 711, monster_id = 21010201, pos = { x = 2176.5, y = 244.6, z = -1588.2 }, rot = { x = 0.0, y = 11.8, z = 0.0 }, level = 8, drop_id = 303002, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2600, gadget_id = 70210011, pos = { x = 2165.6, y = 239.2, z = -1535.4 }, rot = { x = 0.0, y = 330.6, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 298, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2191.1, y = 247.2, z = -1591.7 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_298", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_298", trigger_count = 0 }
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
		monsters = { 484, 485, 486, 487, 711 },
		gadgets = { 2600 },
		regions = { 298 },
		triggers = { "CLIENT_EXECUTE_298" },
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
function action_EVENT_CLIENT_EXECUTE_298(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
