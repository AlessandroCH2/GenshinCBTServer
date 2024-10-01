--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1091, monster_id = 23040101, pos = { x = 2852.9, y = 254.1, z = -1738.0 }, rot = { x = 0.0, y = 316.2, z = 0.0 }, level = 15, drop_id = 303104, pose_id = 101 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3422, gadget_id = 70220006, pos = { x = 2851.2, y = 248.7, z = -1734.6 }, rot = { x = 356.8, y = 55.4, z = 358.9 }, level = 1 },
	{ config_id = 3426, gadget_id = 70210042, pos = { x = 2851.1, y = 254.8, z = -1734.9 }, rot = { x = 0.2, y = 326.7, z = 359.7 }, level = 1, chest_drop_id = 403143, state = GadgetState.ChestLocked, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 270, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2852.4, y = 254.8, z = -1730.9 } },
	{ config_id = 393, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2853.4, y = 254.8, z = -1731.0 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_270", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_270", action = "action_EVENT_ANY_MONSTER_DIE_270", tlog_tag = "望风山地_317_封印宝箱_结算" },
	{ name = "CLIENT_EXECUTE_393", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_393", trigger_count = 0 }
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
		monsters = { 1091 },
		gadgets = { 3422, 3426 },
		regions = { 270, 393 },
		triggers = { "ANY_MONSTER_DIE_270", "CLIENT_EXECUTE_393" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_270(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_270(context, evt)
	-- 解锁目标3426
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3426, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_393(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
