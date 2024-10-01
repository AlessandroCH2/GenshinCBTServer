--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 833, monster_id = 21010201, pos = { x = 1889.9, y = 238.5, z = -797.6 }, rot = { x = 0.0, y = 290.9, z = 0.0 }, level = 6, drop_id = 303002, disableWander = true, pose_id = 9003 },
	{ config_id = 834, monster_id = 21010201, pos = { x = 1886.8, y = 238.0, z = -790.6 }, rot = { x = 0.0, y = 278.2, z = 0.0 }, level = 6, drop_id = 303002, pose_id = 0 },
	{ config_id = 835, monster_id = 21010201, pos = { x = 1888.8, y = 238.1, z = -794.9 }, rot = { x = 0.0, y = 214.1, z = 0.0 }, level = 6, drop_id = 303002, disableWander = true, pose_id = 9002 },
	{ config_id = 836, monster_id = 21030301, pos = { x = 1884.4, y = 238.1, z = -797.1 }, rot = { x = 0.0, y = 94.7, z = 0.0 }, level = 6, drop_id = 303002, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2132, gadget_id = 70210032, pos = { x = 1887.1, y = 238.2, z = -797.2 }, rot = { x = 0.0, y = 343.5, z = 0.0 }, level = 1, chest_drop_id = 403122, state = GadgetState.ChestLocked, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 2133, gadget_id = 70220005, pos = { x = 1890.4, y = 238.3, z = -796.1 }, rot = { x = 0.0, y = 47.3, z = 0.0 }, level = 1 },
	{ config_id = 2134, gadget_id = 70220013, pos = { x = 1881.9, y = 238.0, z = -799.7 }, rot = { x = 0.0, y = 125.3, z = 0.0 }, level = 1 },
	{ config_id = 2135, gadget_id = 70220013, pos = { x = 1881.0, y = 237.8, z = -797.5 }, rot = { x = 0.0, y = 194.9, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 296, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1885.7, y = 238.1, z = -797.3 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_296", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_296", action = "action_EVENT_ANY_MONSTER_DIE_296" }
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
		monsters = { 833, 834, 835, 836 },
		gadgets = { 2132, 2133, 2134, 2135 },
		regions = { 296 },
		triggers = { "ANY_MONSTER_DIE_296" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_296(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_296(context, evt)
	-- 解锁目标2132
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 2132, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
