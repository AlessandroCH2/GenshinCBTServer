--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 123, monster_id = 23040101, pos = { x = 1557.2, y = 243.8, z = -595.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 20, drop_id = 303145, disableWander = true, pose_id = 100 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
	{ config_id = 42, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1524.6, y = 249.6, z = -551.5 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_42", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_42", action = "action_EVENT_ANY_MONSTER_DIE_42" }
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
		monsters = { 123 },
		gadgets = { },
		regions = { 42 },
		triggers = { "ANY_MONSTER_DIE_42" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_42(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_42(context, evt)
	-- 创生gadget 953
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 953 }) then
		return -1
	end
	
	return 0
end
