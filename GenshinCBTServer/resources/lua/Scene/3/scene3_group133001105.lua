--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 515, monster_id = 21010301, pos = { x = 1262.4, y = 257.1, z = -1422.7 }, rot = { x = 0.0, y = 267.5, z = 0.0 }, level = 13, drop_id = 303043, disableWander = true, pose_id = 9002 },
	{ config_id = 629, monster_id = 21010201, pos = { x = 1258.9, y = 256.8, z = -1423.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13, drop_id = 303003, disableWander = true, pose_id = 9002 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1771, gadget_id = 70210013, pos = { x = 1258.6, y = 257.3, z = -1412.9 }, rot = { x = 0.0, y = 187.4, z = 0.0 }, level = 1, chest_drop_id = 403303, state = GadgetState.ChestBramble, isOneoff = true, persistent = true },
	{ config_id = 1877, gadget_id = 70220005, pos = { x = 1261.7, y = 257.2, z = -1419.3 }, rot = { x = 0.0, y = 220.3, z = 0.0 }, level = 1 },
	{ config_id = 1878, gadget_id = 70220005, pos = { x = 1262.9, y = 257.3, z = -1420.3 }, rot = { x = 0.0, y = 116.3, z = 0.0 }, level = 1 },
	{ config_id = 1879, gadget_id = 70310001, pos = { x = 1258.0, y = 256.5, z = -1425.3 }, rot = { x = 0.0, y = 239.4, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 290, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1258.2, y = 257.3, z = -1417.8 } },
	{ config_id = 291, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1258.2, y = 257.3, z = -1417.8 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_290", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_290", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_291", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_291", trigger_count = 0 }
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
	suite = 2,
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
		monsters = { 515, 629 },
		gadgets = { 1771, 1877, 1878, 1879 },
		regions = { 290, 291 },
		triggers = { "CLIENT_EXECUTE_290", "CLIENT_EXECUTE_291" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { },
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
function action_EVENT_CLIENT_EXECUTE_290(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_291(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Default )
		return 0
	end
	return 0
end
