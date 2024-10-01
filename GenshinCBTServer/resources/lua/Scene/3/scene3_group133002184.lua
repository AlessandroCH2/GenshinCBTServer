--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 590, monster_id = 28030401, pos = { x = 2017.2, y = 259.6, z = -301.8 }, rot = { x = 0.0, y = 262.0, z = 0.0 }, level = 0, disableWander = true, pose_id = 2 },
	{ config_id = 591, monster_id = 28030401, pos = { x = 2017.1, y = 259.8, z = -302.5 }, rot = { x = 0.0, y = 261.3, z = 0.0 }, level = 0, disableWander = true, pose_id = 2 },
	{ config_id = 592, monster_id = 28030401, pos = { x = 2017.8, y = 259.7, z = -302.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true, pose_id = 2 },
	{ config_id = 593, monster_id = 28050101, pos = { x = 1991.5, y = 257.4, z = -285.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 681, monster_id = 28050101, pos = { x = 2020.5, y = 256.8, z = -293.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1515, gadget_id = 70210011, pos = { x = 2007.0, y = 258.4, z = -254.6 }, rot = { x = 346.9, y = 9.4, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 1516, gadget_id = 70210011, pos = { x = 1970.3, y = 261.9, z = -292.6 }, rot = { x = 0.0, y = 264.6, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true },
	{ config_id = 1517, gadget_id = 70290003, pos = { x = 1971.0, y = 265.8, z = -292.6 }, rot = { x = 0.0, y = 49.7, z = 0.0 }, level = 1 },
	{ config_id = 1518, gadget_id = 70500000, pos = { x = 1970.9, y = 265.9, z = -292.7 }, rot = { x = 0.0, y = 49.7, z = 0.0 }, level = 1, point_type = 3003, owner = 1517 },
	{ config_id = 1519, gadget_id = 70500000, pos = { x = 1971.1, y = 265.9, z = -292.5 }, rot = { x = 0.0, y = 49.7, z = 0.0 }, level = 1, point_type = 3003, owner = 1517 },
	{ config_id = 1735, gadget_id = 70210011, pos = { x = 1977.3, y = 258.1, z = -266.1 }, rot = { x = 0.0, y = 323.6, z = 0.0 }, level = 1, chest_drop_id = 403304, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 265, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1989.3, y = 256.9, z = -289.0 } }
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
		-- description = ,
		monsters = { 590, 591, 592, 593, 681 },
		gadgets = { 1515, 1516, 1517, 1518, 1519, 1735 },
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
