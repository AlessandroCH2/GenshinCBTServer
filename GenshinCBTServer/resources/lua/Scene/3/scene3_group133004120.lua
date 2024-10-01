--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 334, monster_id = 21010901, pos = { x = 2211.1, y = 210.8, z = -514.3 }, rot = { x = 0.0, y = 88.4, z = 0.0 }, level = 11, drop_id = 303003, disableWander = true },
	{ config_id = 335, monster_id = 21030101, pos = { x = 2203.2, y = 211.2, z = -513.8 }, rot = { x = 0.0, y = 28.1, z = 0.0 }, level = 11, drop_id = 303003, disableWander = true },
	{ config_id = 336, monster_id = 21010301, pos = { x = 2206.7, y = 211.1, z = -514.0 }, rot = { x = 0.0, y = 324.4, z = 0.0 }, level = 11, drop_id = 303003, disableWander = true },
	{ config_id = 337, monster_id = 21010301, pos = { x = 2204.4, y = 210.9, z = -510.6 }, rot = { x = 0.0, y = 188.0, z = 0.0 }, level = 11, drop_id = 303003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 490, gadget_id = 70210032, pos = { x = 2204.2, y = 211.3, z = -516.3 }, rot = { x = 0.0, y = 1.5, z = 358.2 }, level = 1, chest_drop_id = 403123, state = GadgetState.ChestLocked, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 162, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2204.9, y = 210.9, z = -511.6 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_162", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_162", action = "action_EVENT_ANY_MONSTER_DIE_162", tlog_tag = "奔狼岭_120_怪物营地_结算" }
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
		monsters = { 334, 335, 336, 337 },
		gadgets = { 490 },
		regions = { 162 },
		triggers = { "ANY_MONSTER_DIE_162" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_162(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_162(context, evt)
	-- 解锁目标490
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 490, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
