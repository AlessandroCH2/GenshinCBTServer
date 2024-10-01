--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 541, monster_id = 21020201, pos = { x = 2421.6, y = 240.9, z = -398.6 }, rot = { x = 0.0, y = 156.3, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true },
	{ config_id = 542, monster_id = 21010901, pos = { x = 2422.4, y = 240.9, z = -403.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true },
	{ config_id = 543, monster_id = 21010101, pos = { x = 2420.3, y = 240.9, z = -402.4 }, rot = { x = 0.0, y = 71.0, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true },
	{ config_id = 544, monster_id = 21030101, pos = { x = 2423.9, y = 240.9, z = -399.2 }, rot = { x = 0.0, y = 212.0, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true },
	{ config_id = 545, monster_id = 20011001, pos = { x = 2424.3, y = 240.9, z = -401.9 }, rot = { x = 0.0, y = 289.1, z = 0.0 }, level = 12, drop_id = 303003, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1178, gadget_id = 70210032, pos = { x = 2419.1, y = 240.9, z = -400.3 }, rot = { x = 4.7, y = 100.4, z = 0.7 }, level = 1, chest_drop_id = 403344, state = GadgetState.ChestLocked, isOneoff = true },
	{ config_id = 1179, gadget_id = 70220013, pos = { x = 2418.5, y = 240.9, z = -405.2 }, rot = { x = 4.1, y = 170.3, z = 8.6 }, level = 1 },
	{ config_id = 1180, gadget_id = 70220013, pos = { x = 2420.5, y = 240.8, z = -407.6 }, rot = { x = 0.0, y = 117.4, z = 0.0 }, level = 1 },
	{ config_id = 1181, gadget_id = 70310001, pos = { x = 2422.1, y = 240.9, z = -395.2 }, rot = { x = 0.0, y = 233.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 1182, gadget_id = 70220014, pos = { x = 2427.3, y = 202.4, z = -403.3 }, rot = { x = 0.0, y = 358.7, z = 0.0 }, level = 1 },
	{ config_id = 1183, gadget_id = 70220014, pos = { x = 2426.4, y = 240.9, z = -402.5 }, rot = { x = 0.0, y = 77.2, z = 0.0 }, level = 1 },
	{ config_id = 1185, gadget_id = 70310004, pos = { x = 2422.3, y = 240.9, z = -401.1 }, rot = { x = 0.0, y = 256.8, z = 0.0 }, level = 1 },
	{ config_id = 1350, gadget_id = 70310001, pos = { x = 2445.2, y = 241.0, z = -402.0 }, rot = { x = 0.0, y = 316.3, z = 0.0 }, level = 1 },
	{ config_id = 1351, gadget_id = 70310001, pos = { x = 2444.6, y = 240.9, z = -405.9 }, rot = { x = 0.0, y = 66.3, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 225, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2427.1, y = 240.8, z = -409.5 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_225", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_225", action = "action_EVENT_ANY_MONSTER_DIE_225" }
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
		monsters = { 541, 542, 543, 544, 545 },
		gadgets = { 1178, 1179, 1180, 1181, 1182, 1183, 1185, 1350 },
		regions = { 225 },
		triggers = { "ANY_MONSTER_DIE_225" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_225(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_225(context, evt)
	-- 解锁目标1178
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 1178, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
