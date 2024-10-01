--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 956, monster_id = 21020201, pos = { x = 2827.1, y = 271.4, z = -1445.8 }, rot = { x = 0.0, y = 250.2, z = 0.0 }, level = 13, drop_id = 303103, disableWander = true, pose_id = 401 },
	{ config_id = 957, monster_id = 21010301, pos = { x = 2823.1, y = 271.4, z = -1444.2 }, rot = { x = 0.0, y = 143.4, z = 0.0 }, level = 13, drop_id = 303003, disableWander = true, pose_id = 9003 },
	{ config_id = 958, monster_id = 21010401, pos = { x = 2824.7, y = 271.2, z = -1448.3 }, rot = { x = 0.0, y = 2.9, z = 0.0 }, level = 13, drop_id = 303003, disableWander = true, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3143, gadget_id = 70210032, pos = { x = 2825.9, y = 271.9, z = -1440.9 }, rot = { x = 7.3, y = 185.3, z = 358.0 }, level = 1, chest_drop_id = 403143, state = GadgetState.ChestLocked, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 199, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2826.4, y = 271.3, z = -1446.1 } },
	{ config_id = 371, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2825.9, y = 271.2, z = -1446.3 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_199", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_199", action = "action_EVENT_ANY_MONSTER_DIE_199", tlog_tag = "望风山地_291_怪物营地_结算" },
	{ name = "CLIENT_EXECUTE_371", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_371", trigger_count = 0 }
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
		monsters = { 956, 957, 958 },
		gadgets = { 3143 },
		regions = { 199, 371 },
		triggers = { "ANY_MONSTER_DIE_199", "CLIENT_EXECUTE_371" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_199(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_199(context, evt)
	-- 解锁目标3143
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3143, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_371(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
