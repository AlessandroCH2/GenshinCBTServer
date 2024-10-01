--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 277, monster_id = 21010301, pos = { x = 1955.9, y = 196.8, z = -1171.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 303001 },
	{ config_id = 278, monster_id = 21010101, pos = { x = 1958.8, y = 197.0, z = -1171.9 }, rot = { x = 0.0, y = 198.2, z = 0.0 }, level = 3, drop_id = 303001, pose_id = 9002 },
	{ config_id = 279, monster_id = 21010501, pos = { x = 1950.4, y = 196.9, z = -1162.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 303001, disableWander = true },
	{ config_id = 443, monster_id = 21010101, pos = { x = 1955.7, y = 196.8, z = -1169.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 303001, disableWander = true, pose_id = 9003 },
	{ config_id = 713, monster_id = 21010401, pos = { x = 1953.4, y = 196.2, z = -1175.1 }, rot = { x = 0.0, y = 217.9, z = 0.0 }, level = 3, drop_id = 303001, disableWander = true },
	{ config_id = 714, monster_id = 21010401, pos = { x = 1950.2, y = 196.9, z = -1162.8 }, rot = { x = 0.0, y = 357.3, z = 0.0 }, level = 3, drop_id = 303001, disableWander = true },
	{ config_id = 715, monster_id = 21010201, pos = { x = 1957.9, y = 196.8, z = -1169.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 303001, disableWander = true, pose_id = 9003 },
	{ config_id = 1087, monster_id = 21010201, pos = { x = 1955.7, y = 196.8, z = -1168.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 3, drop_id = 303001, disableWander = true, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1761, gadget_id = 70210022, pos = { x = 1960.8, y = 196.8, z = -1169.7 }, rot = { x = 0.0, y = 292.0, z = 0.0 }, level = 1, chest_drop_id = 403101, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 1762, gadget_id = 70310001, pos = { x = 1959.6, y = 196.3, z = -1177.3 }, rot = { x = 0.0, y = 189.3, z = 0.0 }, level = 1 },
	{ config_id = 1763, gadget_id = 70310001, pos = { x = 1951.7, y = 196.9, z = -1163.1 }, rot = { x = 0.0, y = 189.3, z = 0.0 }, level = 1 },
	{ config_id = 1991, gadget_id = 70220005, pos = { x = 1955.3, y = 196.5, z = -1175.0 }, rot = { x = 0.0, y = 252.2, z = 0.0 }, level = 1 },
	{ config_id = 1992, gadget_id = 70220005, pos = { x = 1959.2, y = 196.4, z = -1176.1 }, rot = { x = 0.0, y = 315.7, z = 0.0 }, level = 1 },
	{ config_id = 2234, gadget_id = 70220005, pos = { x = 1951.3, y = 197.0, z = -1164.6 }, rot = { x = 0.0, y = 252.2, z = 0.0 }, level = 1 },
	{ config_id = 2235, gadget_id = 70220005, pos = { x = 1950.2, y = 197.0, z = -1164.1 }, rot = { x = 0.0, y = 252.2, z = 0.0 }, level = 1 },
	{ config_id = 2273, gadget_id = 70220005, pos = { x = 1961.0, y = 196.5, z = -1174.6 }, rot = { x = 0.0, y = 252.2, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 81, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1958.8, y = 197.1, z = -1168.0 } },
	{ config_id = 273, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2009.8, y = 194.9, z = -1169.9 } },
	{ config_id = 274, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2009.8, y = 194.9, z = -1169.9 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_81", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_81", action = "action_EVENT_ANY_MONSTER_DIE_81", trigger_count = 0, tlog_tag = "小平原_营地_g73_结束" },
	{ name = "CLIENT_EXECUTE_273", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_273", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_274", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_274", trigger_count = 0 }
}

-- 变量
variables = {
	{ name = "allow_spawn_mon", value = 0, persistent = false }
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
		-- description = suite_2,
		monsters = { 278, 443, 713, 714 },
		gadgets = { 1761, 1762, 1763, 1991, 1992, 2234, 2235, 2273 },
		regions = { 81, 273, 274 },
		triggers = { "ANY_MONSTER_DIE_81", "CLIENT_EXECUTE_273", "CLIENT_EXECUTE_274" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_81(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_81(context, evt)
	-- 将configid为 1761 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1761, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_273(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_274(context, evt)
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
