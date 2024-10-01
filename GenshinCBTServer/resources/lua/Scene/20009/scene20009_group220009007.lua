--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 21, monster_id = 21010301, pos = { x = -100.8, y = -12.9, z = 127.2 }, rot = { x = 0.0, y = 89.3, z = 0.0 }, level = 0, drop_id = 1100109 },
	{ config_id = 22, monster_id = 21010301, pos = { x = -100.6, y = -12.9, z = 124.2 }, rot = { x = 0.0, y = 89.3, z = 0.0 }, level = 0, drop_id = 1100109 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 40, shape = RegionShape.SPHERE, radius = 5, pos = { x = -81.5, y = -15.4, z = 120.2 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_40", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_40", action = "action_EVENT_ANY_MONSTER_DIE_40" }
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
		monsters = { 21, 22 },
		gadgets = { },
		regions = { 40 },
		triggers = { "ANY_MONSTER_DIE_40" },
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
function condition_EVENT_ANY_MONSTER_DIE_40(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_40(context, evt)
	-- 改变指定group组220009002中， configid为56的gadget的state
	if 0 ~= ScriptLib.SetGroupGadgetStateByConfigId(context, 220009002, 56, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end
