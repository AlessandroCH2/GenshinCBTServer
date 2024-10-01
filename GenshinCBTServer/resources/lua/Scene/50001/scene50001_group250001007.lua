--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 34, monster_id = 20011201, pos = { x = 153.3, y = 39.5, z = 115.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 35, monster_id = 20011201, pos = { x = 153.2, y = 39.5, z = 120.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 36, monster_id = 20011201, pos = { x = 152.7, y = 39.5, z = 125.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 37, monster_id = 20011201, pos = { x = 148.3, y = 39.6, z = 116.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 38, monster_id = 20011201, pos = { x = 148.5, y = 39.5, z = 124.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 2, shape = RegionShape.SPHERE, radius = 5, pos = { x = 169.0, y = 42.0, z = 121.4 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_2", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_2", action = "action_EVENT_ANY_MONSTER_DIE_2" }
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
	suite = 2,
	rand_suite = false,
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
		monsters = { 34, 35, 36, 37, 38 },
		gadgets = { },
		regions = { 2 },
		triggers = { "ANY_MONSTER_DIE_2" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_2(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_2(context, evt)
	-- 改变指定group组250001003中， configid为77的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 250001003, 77, GadgetState.Default) then
			return -1
		end 
	
	-- 改变指定group组250001003中， configid为23的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 250001003, 23, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end
