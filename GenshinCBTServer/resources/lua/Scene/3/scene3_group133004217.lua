--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 632, monster_id = 22010101, pos = { x = 2676.0, y = 285.2, z = -399.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 15, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1199, gadget_id = 70210032, pos = { x = 2675.7, y = 285.3, z = -403.6 }, rot = { x = 15.1, y = 271.4, z = 357.7 }, level = 1, chest_drop_id = 403343, state = GadgetState.ChestLocked, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 233, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2675.7, y = 285.4, z = -404.1 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_233", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_233", action = "action_EVENT_ANY_MONSTER_DIE_233", tlog_tag = "奔狼岭_217_怪物营地_结算" }
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
		monsters = { 632 },
		gadgets = { 1199 },
		regions = { 233 },
		triggers = { "ANY_MONSTER_DIE_233" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_233(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_233(context, evt)
	-- 解锁目标1199
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 1199, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
