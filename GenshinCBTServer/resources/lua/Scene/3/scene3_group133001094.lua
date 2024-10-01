--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 444, monster_id = 20011201, pos = { x = 1993.9, y = 204.9, z = -1364.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 303001 },
	{ config_id = 445, monster_id = 20011201, pos = { x = 1996.4, y = 205.0, z = -1362.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 303001 },
	{ config_id = 446, monster_id = 21010501, pos = { x = 2000.4, y = 204.9, z = -1358.7 }, rot = { x = 0.0, y = 40.0, z = 0.0 }, level = 3, drop_id = 303001, disableWander = true, pose_id = 0 },
	{ config_id = 447, monster_id = 21010501, pos = { x = 1992.4, y = 205.0, z = -1366.4 }, rot = { x = 0.0, y = 243.5, z = 0.0 }, level = 3, drop_id = 303001, disableWander = true, pose_id = 0 },
	{ config_id = 677, monster_id = 21010101, pos = { x = 1992.7, y = 204.6, z = -1362.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 303001 },
	{ config_id = 678, monster_id = 21010101, pos = { x = 1994.3, y = 204.6, z = -1360.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 303001 },
	{ config_id = 679, monster_id = 21010701, pos = { x = 1993.1, y = 204.6, z = -1361.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 303001 },
	{ config_id = 680, monster_id = 21010301, pos = { x = 1995.9, y = 204.8, z = -1360.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 303001 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1764, gadget_id = 70310001, pos = { x = 2001.2, y = 205.0, z = -1360.2 }, rot = { x = 0.0, y = 235.9, z = 0.0 }, level = 1 },
	{ config_id = 1765, gadget_id = 70310001, pos = { x = 1994.1, y = 204.2, z = -1356.9 }, rot = { x = 0.0, y = 8.5, z = 0.0 }, level = 1 },
	{ config_id = 1766, gadget_id = 70210032, pos = { x = 2001.3, y = 205.3, z = -1363.0 }, rot = { x = 0.0, y = 269.7, z = 0.0 }, level = 1, chest_drop_id = 403121, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 1921, gadget_id = 70220010, pos = { x = 1990.6, y = 204.3, z = -1360.1 }, rot = { x = 0.0, y = 225.5, z = 0.0 }, level = 1 },
	{ config_id = 1922, gadget_id = 70220010, pos = { x = 2000.8, y = 204.6, z = -1356.0 }, rot = { x = 0.0, y = 225.5, z = 0.0 }, level = 1 },
	{ config_id = 1923, gadget_id = 70220010, pos = { x = 2002.5, y = 205.6, z = -1369.6 }, rot = { x = 0.0, y = 225.5, z = 0.0 }, level = 1 },
	{ config_id = 2065, gadget_id = 70290002, pos = { x = 1660.0, y = 253.1, z = -1314.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2066, gadget_id = 70500000, pos = { x = 1659.0, y = 254.7, z = -1313.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2065 },
	{ config_id = 2067, gadget_id = 70500000, pos = { x = 1660.9, y = 255.7, z = -1315.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2065 },
	{ config_id = 2068, gadget_id = 70500000, pos = { x = 1660.1, y = 256.0, z = -1313.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2065 },
	{ config_id = 2069, gadget_id = 70290002, pos = { x = 1652.7, y = 254.7, z = -1371.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2070, gadget_id = 70500000, pos = { x = 1651.6, y = 256.4, z = -1371.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2069 },
	{ config_id = 2071, gadget_id = 70500000, pos = { x = 1653.6, y = 257.4, z = -1372.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2069 },
	{ config_id = 2072, gadget_id = 70500000, pos = { x = 1652.8, y = 257.7, z = -1370.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2069 },
	{ config_id = 2399, gadget_id = 70310006, pos = { x = 1994.9, y = 204.8, z = -1362.3 }, rot = { x = 0.0, y = 11.0, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 82, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1969.6, y = 206.6, z = -1404.9 } },
	{ config_id = 282, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1994.4, y = 204.8, z = -1362.6 } },
	{ config_id = 283, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1994.4, y = 204.8, z = -1362.6 } },
	{ config_id = 367, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1994.1, y = 204.6, z = -1360.4 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_82", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_82", action = "action_EVENT_ANY_MONSTER_DIE_82", trigger_count = 0, tlog_tag = "小平原_营地_遗迹附近_完成" },
	{ name = "CLIENT_EXECUTE_282", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_282", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_283", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_283", trigger_count = 0 },
	{ name = "GADGET_STATE_CHANGE_367", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_367", action = "action_EVENT_GADGET_STATE_CHANGE_367", trigger_count = 0, tlog_tag = "小平原_营地_遗迹附近_结束" }
}

-- 变量
variables = {
	{ name = "is_cleared", value = 0, persistent = true }
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
		monsters = { 444, 445, 446, 447 },
		gadgets = { 1764, 1765, 1766, 1921, 1922, 1923, 2065, 2066, 2067, 2068, 2069, 2070, 2071, 2072, 2399 },
		regions = { 82, 282, 283, 367 },
		triggers = { "ANY_MONSTER_DIE_82", "CLIENT_EXECUTE_282", "CLIENT_EXECUTE_283", "GADGET_STATE_CHANGE_367" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 444, 445, 446, 447 },
		gadgets = { 1764, 1765, 1766, 1921, 1922, 1923, 2065, 2066, 2067, 2068, 2069, 2070, 2071, 2072, 2399 },
		regions = { 82 },
		triggers = { "ANY_MONSTER_DIE_82" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_82(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_82(context, evt)
	-- 将configid为 1766 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1766, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_282(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_283(context, evt)
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

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_367(context, evt)
	if 1766 ~= evt.param1 then
		return false
	end
	
	if 1766 ~= evt.param2 or GadgetState.ChestOpened ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_367(context, evt)
	-- 将本组内变量名为 "is_cleared" 的变量设置为 1
	if 0 ~= ScriptLib.SetGroupVariableValue(context, "is_cleared", 1) then
	  return -1
	end
	
	return 0
end
