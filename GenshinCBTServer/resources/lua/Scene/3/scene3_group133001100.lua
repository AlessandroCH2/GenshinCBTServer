--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 466, monster_id = 21010201, pos = { x = 1413.4, y = 317.7, z = -1967.3 }, rot = { x = 0.0, y = 62.6, z = 0.0 }, level = 15, drop_id = 303003, pose_id = 9002 },
	{ config_id = 467, monster_id = 21010201, pos = { x = 1416.6, y = 317.9, z = -1964.9 }, rot = { x = 0.0, y = 244.4, z = 0.0 }, level = 15, drop_id = 303003, pose_id = 9002 },
	{ config_id = 716, monster_id = 21020101, pos = { x = 1402.3, y = 315.8, z = -1970.4 }, rot = { x = 0.0, y = 9.2, z = 0.0 }, level = 11, drop_id = 303043, disableWander = true, pose_id = 401 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1982, gadget_id = 70310001, pos = { x = 1415.1, y = 317.8, z = -1965.9 }, rot = { x = 0.0, y = 325.6, z = 0.0 }, level = 1 },
	{ config_id = 2475, gadget_id = 70220002, pos = { x = 1413.7, y = 317.9, z = -1967.0 }, rot = { x = 0.0, y = 74.9, z = 0.0 }, level = 1 },
	{ config_id = 2476, gadget_id = 70220002, pos = { x = 1416.5, y = 318.0, z = -1964.8 }, rot = { x = 0.0, y = 162.6, z = 0.0 }, level = 1 },
	{ config_id = 2477, gadget_id = 70220015, pos = { x = 1424.3, y = 319.1, z = -1966.9 }, rot = { x = 90.0, y = 138.7, z = 0.0 }, level = 1 },
	{ config_id = 2478, gadget_id = 70220015, pos = { x = 1424.0, y = 319.2, z = -1968.3 }, rot = { x = 90.0, y = 143.8, z = 0.0 }, level = 1 },
	{ config_id = 2479, gadget_id = 70220016, pos = { x = 1423.0, y = 319.3, z = -1969.5 }, rot = { x = 90.0, y = 17.4, z = 0.0 }, level = 1 },
	{ config_id = 2480, gadget_id = 70220016, pos = { x = 1421.9, y = 319.2, z = -1970.6 }, rot = { x = 83.3, y = 237.5, z = 258.3 }, level = 1 },
	{ config_id = 2595, gadget_id = 70210022, pos = { x = 1417.6, y = 317.9, z = -1968.9 }, rot = { x = 0.0, y = 327.2, z = 0.0 }, level = 1, chest_drop_id = 403104, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 2596, gadget_id = 70290002, pos = { x = 1421.3, y = 319.0, z = -1973.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2597, gadget_id = 70500000, pos = { x = 1420.2, y = 320.6, z = -1972.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2596 },
	{ config_id = 2598, gadget_id = 70500000, pos = { x = 1422.1, y = 321.6, z = -1974.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2596 },
	{ config_id = 2599, gadget_id = 70500000, pos = { x = 1421.3, y = 321.9, z = -1972.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2596 }
}

-- 区域
regions = {
	{ config_id = 240, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1415.1, y = 317.9, z = -1967.2 } },
	{ config_id = 284, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1413.1, y = 311.3, z = -1960.8 } },
	{ config_id = 285, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1413.1, y = 311.3, z = -1960.8 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_240", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_240", action = "action_EVENT_ANY_MONSTER_DIE_240" },
	{ name = "CLIENT_EXECUTE_284", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_284", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_285", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_285", trigger_count = 0 }
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
		monsters = { 466, 467, 716 },
		gadgets = { 1982, 2475, 2476, 2477, 2478, 2479, 2480, 2595, 2596, 2597, 2598, 2599 },
		regions = { 240, 284, 285 },
		triggers = { "ANY_MONSTER_DIE_240", "CLIENT_EXECUTE_284", "CLIENT_EXECUTE_285" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_240(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_240(context, evt)
	-- 将configid为 2595 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2595, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_284(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_285(context, evt)
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
