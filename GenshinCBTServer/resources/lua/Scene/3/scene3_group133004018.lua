--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 30, monster_id = 21020101, pos = { x = 2176.3, y = 236.1, z = -444.0 }, rot = { x = 0.0, y = 144.0, z = 0.0 }, level = 11, drop_id = 303003, disableWander = true, pose_id = 401 },
	{ config_id = 31, monster_id = 21010101, pos = { x = 2175.9, y = 235.5, z = -447.4 }, rot = { x = 0.0, y = 76.0, z = 0.0 }, level = 11, drop_id = 303003, disableWander = true, pose_id = 9003 },
	{ config_id = 32, monster_id = 21010101, pos = { x = 2178.1, y = 235.5, z = -449.2 }, rot = { x = 0.0, y = 66.0, z = 0.0 }, level = 11, drop_id = 303003, disableWander = true, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 270, gadget_id = 70210032, pos = { x = 2180.1, y = 236.1, z = -445.0 }, rot = { x = 13.1, y = 219.9, z = 357.2 }, level = 1, chest_drop_id = 403123, state = GadgetState.ChestLocked, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 67, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2173.8, y = 235.1, z = -447.3 } },
	{ config_id = 93, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2173.2, y = 235.3, z = -448.8 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_67", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_67", action = "action_EVENT_ANY_MONSTER_DIE_67", tlog_tag = "奔狼岭_18_怪物营地_结算" },
	{ name = "CLIENT_EXECUTE_93", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_93", trigger_count = 0 }
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
		monsters = { 30, 31, 32 },
		gadgets = { 270 },
		regions = { 67, 93 },
		triggers = { "ANY_MONSTER_DIE_67", "CLIENT_EXECUTE_93" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_67(context, evt)
	-- 判断指定group组剩余怪物数量是否是0 
	if ScriptLib.GetGroupMonsterCountByGroupId(context, 133004018) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_67(context, evt)
	-- 解锁目标270
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 270, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_93(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
