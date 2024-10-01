--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 553, monster_id = 21010501, pos = { x = 2456.3, y = 266.4, z = -1517.6 }, rot = { x = 0.0, y = 15.2, z = 0.0 }, level = 9, drop_id = 303002, disableWander = true, pose_id = 9003 },
	{ config_id = 554, monster_id = 21010501, pos = { x = 2464.3, y = 264.3, z = -1508.3 }, rot = { x = 0.0, y = 80.1, z = 0.0 }, level = 9, drop_id = 303002, disableWander = true },
	{ config_id = 555, monster_id = 21010201, pos = { x = 2457.1, y = 264.3, z = -1506.0 }, rot = { x = 0.0, y = 295.6, z = 0.0 }, level = 9, drop_id = 303002, disableWander = true },
	{ config_id = 1201, monster_id = 21010301, pos = { x = 2452.9, y = 264.8, z = -1508.1 }, rot = { x = 0.0, y = 305.9, z = 0.0 }, level = 9, drop_id = 303002 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3813, gadget_id = 70310001, pos = { x = 2466.7, y = 264.6, z = -1506.3 }, rot = { x = 0.0, y = 35.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 3814, gadget_id = 70210022, pos = { x = 2466.0, y = 264.4, z = -1508.1 }, rot = { x = 0.0, y = 86.2, z = 0.0 }, level = 1, chest_drop_id = 403102, state = GadgetState.ChestLocked, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 3815, gadget_id = 70220014, pos = { x = 2457.2, y = 264.7, z = -1503.4 }, rot = { x = 0.0, y = 270.5, z = 0.0 }, level = 1 },
	{ config_id = 3816, gadget_id = 70220014, pos = { x = 2458.1, y = 267.2, z = -1520.8 }, rot = { x = 0.0, y = 270.5, z = 0.0 }, level = 1 },
	{ config_id = 3817, gadget_id = 70220013, pos = { x = 2467.2, y = 264.7, z = -1510.2 }, rot = { x = 0.0, y = 181.6, z = 0.0 }, level = 1 },
	{ config_id = 3818, gadget_id = 70220013, pos = { x = 2460.0, y = 264.4, z = -1504.0 }, rot = { x = 0.0, y = 222.3, z = 0.0 }, level = 1 },
	{ config_id = 3819, gadget_id = 70220005, pos = { x = 2459.8, y = 264.3, z = -1505.6 }, rot = { x = 0.0, y = 270.6, z = 0.0 }, level = 1 },
	{ config_id = 3820, gadget_id = 70310001, pos = { x = 2452.2, y = 266.5, z = -1515.9 }, rot = { x = 0.0, y = 35.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 3822, gadget_id = 70310004, pos = { x = 2460.8, y = 264.3, z = -1509.3 }, rot = { x = 0.0, y = 5.8, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 476, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2459.7, y = 264.5, z = -1511.5 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_476", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_476", action = "action_EVENT_ANY_MONSTER_DIE_476" }
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
		monsters = { 553, 554, 555, 1201 },
		gadgets = { 3813, 3814, 3815, 3816, 3817, 3818, 3819, 3820, 3822 },
		regions = { 476 },
		triggers = { "ANY_MONSTER_DIE_476" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_476(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_476(context, evt)
	-- 解锁目标3814
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3814, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
