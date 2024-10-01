--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1382, monster_id = 21030301, pos = { x = 2710.9, y = 285.6, z = -1401.8 }, rot = { x = 0.0, y = 186.1, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true },
	{ config_id = 1383, monster_id = 20010301, pos = { x = 2713.1, y = 285.6, z = -1403.2 }, rot = { x = 0.0, y = 225.3, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true },
	{ config_id = 1384, monster_id = 21010701, pos = { x = 2708.9, y = 284.9, z = -1402.9 }, rot = { x = 0.0, y = 86.7, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true },
	{ config_id = 1385, monster_id = 21010101, pos = { x = 2712.6, y = 285.4, z = -1405.6 }, rot = { x = 0.0, y = 304.1, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3966, gadget_id = 70210032, pos = { x = 2711.7, y = 285.4, z = -1396.9 }, rot = { x = 0.0, y = 203.0, z = 355.0 }, level = 1, chest_drop_id = 403123, state = GadgetState.ChestLocked, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 3967, gadget_id = 70310003, pos = { x = 2713.3, y = 285.3, z = -1400.6 }, rot = { x = 0.0, y = 216.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 3968, gadget_id = 70220013, pos = { x = 2708.1, y = 284.8, z = -1399.6 }, rot = { x = 8.9, y = 312.2, z = 0.0 }, level = 1 },
	{ config_id = 3969, gadget_id = 70220013, pos = { x = 2705.8, y = 284.4, z = -1400.8 }, rot = { x = 8.3, y = 290.1, z = 0.0 }, level = 1 },
	{ config_id = 3970, gadget_id = 70220014, pos = { x = 2704.1, y = 284.1, z = -1400.2 }, rot = { x = 0.0, y = 204.4, z = 352.9 }, level = 1 },
	{ config_id = 3971, gadget_id = 70310004, pos = { x = 2711.0, y = 285.3, z = -1403.5 }, rot = { x = 0.0, y = 157.6, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 494, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2711.2, y = 285.3, z = -1403.3 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_494", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_494", action = "action_EVENT_ANY_MONSTER_DIE_494" }
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
		monsters = { 1382, 1383, 1384, 1385 },
		gadgets = { 3966, 3967, 3968, 3969, 3970, 3971 },
		regions = { 494 },
		triggers = { "ANY_MONSTER_DIE_494" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_494(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_494(context, evt)
	-- 解锁目标3966
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3966, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
