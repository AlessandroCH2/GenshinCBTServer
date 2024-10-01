--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 11, monster_id = 20010301, pos = { x = 2610.0, y = 205.5, z = -54.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 20, drop_id = 303005 },
	{ config_id = 12, monster_id = 20010401, pos = { x = 2608.9, y = 206.0, z = -57.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 20, drop_id = 303005, disableWander = true },
	{ config_id = 20, monster_id = 20010301, pos = { x = 2612.7, y = 205.7, z = -57.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 20, drop_id = 303005 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 40, gadget_id = 70210022, pos = { x = 2607.9, y = 206.9, z = -61.2 }, rot = { x = 0.0, y = 23.4, z = 0.0 }, level = 1, chest_drop_id = 403325, state = GadgetState.ChestLocked, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 57, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2610.1, y = 206.1, z = -58.4 } },
	{ config_id = 90, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2607.6, y = 205.8, z = -55.3 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_57", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_57", action = "action_EVENT_ANY_MONSTER_DIE_57" },
	{ name = "CLIENT_EXECUTE_90", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_90", trigger_count = 0 }
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
		monsters = { 11, 12, 20 },
		gadgets = { 40 },
		regions = { 57, 90 },
		triggers = { "ANY_MONSTER_DIE_57", "CLIENT_EXECUTE_90" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_57(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_57(context, evt)
	-- 解锁目标40
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 40, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_90(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
