--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1011, monster_id = 21010401, pos = { x = 1639.1, y = 278.0, z = -1191.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1012, monster_id = 21010301, pos = { x = 1634.3, y = 279.3, z = -1184.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1013, monster_id = 21010201, pos = { x = 1632.6, y = 279.6, z = -1190.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1014, monster_id = 21010601, pos = { x = 1637.5, y = 278.5, z = -1187.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1015, monster_id = 21010101, pos = { x = 1632.5, y = 279.6, z = -1188.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1016, monster_id = 21010701, pos = { x = 1640.0, y = 277.8, z = -1193.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1017, monster_id = 21030201, pos = { x = 1635.5, y = 279.0, z = -1188.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042, disableWander = true },
	{ config_id = 1018, monster_id = 21010301, pos = { x = 1635.1, y = 279.0, z = -1191.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1019, monster_id = 21010301, pos = { x = 1632.5, y = 279.6, z = -1192.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1020, monster_id = 21030301, pos = { x = 1635.8, y = 278.9, z = -1189.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042, disableWander = true },
	{ config_id = 1021, monster_id = 21010701, pos = { x = 1636.9, y = 278.5, z = -1193.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 },
	{ config_id = 1022, monster_id = 21010701, pos = { x = 1633.5, y = 279.4, z = -1190.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 6, drop_id = 303042 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2643, gadget_id = 70900019, pos = { x = 1638.5, y = 277.8, z = -1189.3 }, rot = { x = 0.0, y = 237.5, z = 0.0 }, level = 1 },
	{ config_id = 2644, gadget_id = 70220013, pos = { x = 1640.8, y = 277.5, z = -1186.2 }, rot = { x = 0.0, y = 346.9, z = 0.0 }, level = 1 },
	{ config_id = 2645, gadget_id = 70220013, pos = { x = 1641.4, y = 277.2, z = -1188.2 }, rot = { x = 0.0, y = 70.9, z = 0.0 }, level = 1 },
	{ config_id = 2646, gadget_id = 70220013, pos = { x = 1637.8, y = 278.0, z = -1203.2 }, rot = { x = 0.0, y = 327.4, z = 0.0 }, level = 1 },
	{ config_id = 2647, gadget_id = 70220013, pos = { x = 1636.1, y = 278.3, z = -1202.0 }, rot = { x = 0.0, y = 80.9, z = 0.0 }, level = 1 },
	{ config_id = 2648, gadget_id = 70220013, pos = { x = 1639.9, y = 277.5, z = -1203.7 }, rot = { x = 0.0, y = 164.8, z = 0.0 }, level = 1 },
	{ config_id = 2652, gadget_id = 70220005, pos = { x = 1640.0, y = 277.8, z = -1184.9 }, rot = { x = 0.0, y = 282.4, z = 0.0 }, level = 1 },
	{ config_id = 2654, gadget_id = 70210022, pos = { x = 1637.6, y = 278.4, z = -1188.9 }, rot = { x = 0.0, y = 324.0, z = 0.0 }, level = 1, chest_drop_id = 403102, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 2671, gadget_id = 70220005, pos = { x = 1638.8, y = 278.2, z = -1184.9 }, rot = { x = 0.0, y = 282.4, z = 0.0 }, level = 1 },
	{ config_id = 2672, gadget_id = 70220005, pos = { x = 1640.2, y = 277.3, z = -1202.2 }, rot = { x = 0.0, y = 282.4, z = 0.0 }, level = 1 },
	{ config_id = 2673, gadget_id = 70220005, pos = { x = 1635.1, y = 278.9, z = -1200.8 }, rot = { x = 0.0, y = 282.4, z = 0.0 }, level = 1 },
	{ config_id = 2674, gadget_id = 70220013, pos = { x = 1629.2, y = 280.1, z = -1190.0 }, rot = { x = 0.0, y = 80.9, z = 0.0 }, level = 1 },
	{ config_id = 2675, gadget_id = 70220013, pos = { x = 1629.7, y = 279.9, z = -1192.6 }, rot = { x = 0.0, y = 58.8, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 316, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1635.4, y = 278.9, z = -1191.9 } },
	{ config_id = 433, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1637.9, y = 278.3, z = -1192.9 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_316", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_316", trigger_count = 0 },
	{ name = "ANY_MONSTER_DIE_433", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_433", action = "action_EVENT_ANY_MONSTER_DIE_433", tlog_tag = "小平原_营地2_交接山区_结束" }
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
		-- description = suite_3,
		monsters = { 1017, 1018, 1019 },
		gadgets = { 2643, 2644, 2645, 2646, 2647, 2648, 2652, 2654 },
		regions = { 316, 433 },
		triggers = { "CLIENT_EXECUTE_316", "ANY_MONSTER_DIE_433" },
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
function action_EVENT_CLIENT_EXECUTE_316(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_433(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_433(context, evt)
	-- 将configid为 2654 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2654, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
