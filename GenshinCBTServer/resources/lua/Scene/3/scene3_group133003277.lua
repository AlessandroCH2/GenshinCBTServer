--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 927, monster_id = 22010101, pos = { x = 2727.5, y = 286.9, z = -1573.2 }, rot = { x = 0.0, y = 120.9, z = 0.0 }, level = 13, drop_id = 303103, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3027, gadget_id = 70210032, pos = { x = 2728.6, y = 286.5, z = -1574.0 }, rot = { x = 0.0, y = 123.7, z = 0.0 }, level = 1, chest_drop_id = 403343, state = GadgetState.ChestLocked, isOneoff = true },
	{ config_id = 4085, gadget_id = 70310001, pos = { x = 2724.9, y = 286.1, z = -1574.1 }, rot = { x = 0.0, y = 45.3, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 4086, gadget_id = 70310001, pos = { x = 2727.2, y = 286.3, z = -1570.5 }, rot = { x = 0.0, y = 13.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 4087, gadget_id = 70220019, pos = { x = 2726.2, y = 280.4, z = -1572.4 }, rot = { x = 0.0, y = 32.4, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 190, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2727.3, y = 286.3, z = -1573.4 } },
	{ config_id = 362, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2728.3, y = 283.1, z = -1574.8 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_190", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_190", action = "action_EVENT_ANY_MONSTER_DIE_190", tlog_tag = "望风山地_277_封印宝箱_结算" },
	{ name = "CLIENT_EXECUTE_362", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_362", trigger_count = 0 }
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
		monsters = { 927 },
		gadgets = { 3027 },
		regions = { 190, 362 },
		triggers = { "ANY_MONSTER_DIE_190", "CLIENT_EXECUTE_362" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_190(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_190(context, evt)
	-- 解锁目标3027
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3027, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_362(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
