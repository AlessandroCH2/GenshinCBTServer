--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 999, monster_id = 21010401, pos = { x = 1744.6, y = 253.5, z = -1151.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1000, monster_id = 21010301, pos = { x = 1739.9, y = 255.3, z = -1145.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1001, monster_id = 21010201, pos = { x = 1738.2, y = 255.0, z = -1150.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1002, monster_id = 21010601, pos = { x = 1743.0, y = 254.3, z = -1147.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1003, monster_id = 21010101, pos = { x = 1738.1, y = 255.2, z = -1148.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1004, monster_id = 21010701, pos = { x = 1745.6, y = 253.1, z = -1153.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1005, monster_id = 21030201, pos = { x = 1741.2, y = 255.0, z = -1145.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1006, monster_id = 21010301, pos = { x = 1743.9, y = 254.0, z = -1148.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1007, monster_id = 21010301, pos = { x = 1738.0, y = 254.8, z = -1152.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1008, monster_id = 21030301, pos = { x = 1742.7, y = 254.9, z = -1143.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1009, monster_id = 21010701, pos = { x = 1744.3, y = 253.8, z = -1149.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1010, monster_id = 21010701, pos = { x = 1739.0, y = 254.8, z = -1150.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2631, gadget_id = 70900019, pos = { x = 1744.0, y = 253.9, z = -1149.5 }, rot = { x = 0.0, y = 237.5, z = 0.0 }, level = 1 },
	{ config_id = 2632, gadget_id = 70220013, pos = { x = 1752.2, y = 252.5, z = -1143.1 }, rot = { x = 0.0, y = 346.9, z = 0.0 }, level = 1 },
	{ config_id = 2633, gadget_id = 70220013, pos = { x = 1752.3, y = 252.2, z = -1144.9 }, rot = { x = 0.0, y = 70.9, z = 0.0 }, level = 1 },
	{ config_id = 2634, gadget_id = 70220013, pos = { x = 1742.4, y = 253.1, z = -1158.1 }, rot = { x = 0.0, y = 327.4, z = 0.0 }, level = 1 },
	{ config_id = 2635, gadget_id = 70220013, pos = { x = 1740.3, y = 253.4, z = -1157.3 }, rot = { x = 0.0, y = 80.9, z = 0.0 }, level = 1 },
	{ config_id = 2636, gadget_id = 70220013, pos = { x = 1744.3, y = 252.7, z = -1156.7 }, rot = { x = 0.0, y = 164.8, z = 0.0 }, level = 1 },
	{ config_id = 2637, gadget_id = 70220014, pos = { x = 1745.3, y = 252.7, z = -1155.0 }, rot = { x = 0.0, y = 238.9, z = 0.0 }, level = 1 },
	{ config_id = 2641, gadget_id = 70220010, pos = { x = 1748.6, y = 252.2, z = -1154.8 }, rot = { x = 0.0, y = 163.5, z = 0.0 }, level = 1 },
	{ config_id = 2642, gadget_id = 70210022, pos = { x = 1741.3, y = 254.4, z = -1149.6 }, rot = { x = 0.0, y = 324.0, z = 0.0 }, level = 1, chest_drop_id = 403102, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 2667, gadget_id = 70220010, pos = { x = 1742.7, y = 255.3, z = -1140.6 }, rot = { x = 0.0, y = 163.5, z = 0.0 }, level = 1 },
	{ config_id = 2668, gadget_id = 70220013, pos = { x = 1738.5, y = 256.1, z = -1140.5 }, rot = { x = 0.0, y = 346.9, z = 0.0 }, level = 1 },
	{ config_id = 2670, gadget_id = 70220014, pos = { x = 1735.4, y = 255.2, z = -1151.7 }, rot = { x = 0.0, y = 238.9, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 264, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1741.0, y = 253.5, z = -1152.0 } },
	{ config_id = 432, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1744.8, y = 258.8, z = -1149.2 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_264", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_264", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_432", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_432", action = "action_EVENT_ANY_MONSTER_DIE_432", tlog_tag = "小平原_营地1_交接山区_结束" }
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
		-- description = suite_1,
		monsters = { 999, 1000, 1001 },
		gadgets = { 2631, 2632, 2633, 2634, 2635, 2636, 2637, 2641, 2642, 2667, 2668, 2670 },
		regions = { 264, 432 },
		triggers = { "CLIENT_EXECUTE_264", "ANY_MONSTER_DIE_432" },
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
function action_EVENT_CLIENT_EXECUTE_264(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_432(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_432(context, evt)
	-- 将configid为 2642 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2642, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
