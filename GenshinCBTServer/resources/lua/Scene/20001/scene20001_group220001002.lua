--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 3, monster_id = 20011201, pos = { x = -150.3, y = 10.1, z = 7.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 20, ban_excel_drop = true },
	{ config_id = 4, monster_id = 20011201, pos = { x = -148.9, y = 10.1, z = 0.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 20 },
	{ config_id = 5, monster_id = 20011201, pos = { x = -144.0, y = 10.1, z = 3.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 20, ban_excel_drop = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 11, gadget_id = 70210012, pos = { x = -145.4, y = 10.1, z = 8.4 }, rot = { x = 0.0, y = 321.3, z = 0.0 }, level = 1, chest_drop_id = 201000, state = GadgetState.ChestLocked }
}

-- 区域
regions = {
	{ config_id = 1, shape = RegionShape.SPHERE, radius = 5, pos = { x = -145.2, y = 10.1, z = 8.2 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_1", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_1", action = "action_EVENT_ANY_MONSTER_DIE_1" }
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
		monsters = { 3, 4, 5 },
		gadgets = { 11 },
		regions = { 1 },
		triggers = { "ANY_MONSTER_DIE_1" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_1(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_1(context, evt)
	-- 解锁目标11
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 11, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
