--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 9, monster_id = 21010301, pos = { x = -8.8, y = 1.0, z = -6.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 9003 },
	{ config_id = 10, monster_id = 21010301, pos = { x = -8.3, y = 1.0, z = -2.2 }, rot = { x = 0.0, y = 185.0, z = 0.0 }, level = 0, pose_id = 9003 },
	{ config_id = 11, monster_id = 21010301, pos = { x = 9.1, y = 1.0, z = -12.2 }, rot = { x = 0.0, y = 328.7, z = 0.0 }, level = 0, pose_id = 9003 },
	{ config_id = 12, monster_id = 21010201, pos = { x = 14.4, y = 1.0, z = -3.1 }, rot = { x = 0.0, y = 251.6, z = 0.0 }, level = 0, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 24, gadget_id = 70210021, pos = { x = -28.3, y = 1.0, z = 55.8 }, rot = { x = 0.0, y = 102.1, z = 0.0 }, level = 1, chest_drop_id = 1400602, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 25, gadget_id = 70220004, pos = { x = 4.4, y = -3.0, z = 24.3 }, rot = { x = 0.0, y = 357.8, z = 0.0 }, level = 1 },
	{ config_id = 26, gadget_id = 70220004, pos = { x = 4.7, y = -3.3, z = 31.9 }, rot = { x = 0.0, y = 327.3, z = 0.0 }, level = 1 },
	{ config_id = 27, gadget_id = 70220004, pos = { x = 3.7, y = -3.2, z = 36.3 }, rot = { x = 0.0, y = 219.9, z = 0.0 }, level = 1 },
	{ config_id = 28, gadget_id = 70220004, pos = { x = 5.6, y = -3.0, z = 40.7 }, rot = { x = 0.0, y = 283.7, z = 0.0 }, level = 1 },
	{ config_id = 29, gadget_id = 70220004, pos = { x = 8.6, y = -3.0, z = 46.4 }, rot = { x = 0.0, y = 305.8, z = 0.0 }, level = 1 },
	{ config_id = 30, gadget_id = 70220004, pos = { x = 11.8, y = -3.0, z = 52.8 }, rot = { x = 0.0, y = 258.9, z = 0.0 }, level = 1 },
	{ config_id = 31, gadget_id = 70220004, pos = { x = -0.2, y = -3.0, z = 55.4 }, rot = { x = 0.0, y = 279.9, z = 0.0 }, level = 1 },
	{ config_id = 32, gadget_id = 70220004, pos = { x = -2.2, y = -3.0, z = 50.1 }, rot = { x = 0.0, y = 308.7, z = 0.0 }, level = 1 },
	{ config_id = 33, gadget_id = 70210021, pos = { x = 5.3, y = -2.9, z = 49.9 }, rot = { x = 0.0, y = 196.8, z = 0.0 }, level = 1, chest_drop_id = 1400602, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 34, gadget_id = 70320001, pos = { x = 3.9, y = 1.0, z = -7.1 }, rot = { x = 0.0, y = 267.8, z = 0.0 }, level = 1 },
	{ config_id = 35, gadget_id = 70900007, pos = { x = -8.2, y = 8.0, z = -15.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 36, gadget_id = 70220004, pos = { x = 8.9, y = 1.0, z = -3.2 }, rot = { x = 0.0, y = 310.4, z = 0.0 }, level = 1 },
	{ config_id = 37, gadget_id = 70220004, pos = { x = -2.5, y = 1.0, z = -13.2 }, rot = { x = 0.0, y = 92.5, z = 0.0 }, level = 1 },
	{ config_id = 38, gadget_id = 70220004, pos = { x = -1.0, y = 1.1, z = -2.8 }, rot = { x = 0.0, y = 184.9, z = 0.0 }, level = 1 },
	{ config_id = 39, gadget_id = 70220004, pos = { x = 2.7, y = 1.0, z = -1.5 }, rot = { x = 0.0, y = 202.5, z = 0.0 }, level = 1 },
	{ config_id = 40, gadget_id = 70220004, pos = { x = 9.5, y = 1.0, z = -7.9 }, rot = { x = 0.0, y = 145.5, z = 0.0 }, level = 1 },
	{ config_id = 41, gadget_id = 70220004, pos = { x = -1.4, y = 1.1, z = -7.8 }, rot = { x = 0.0, y = 132.8, z = 0.0 }, level = 1 },
	{ config_id = 42, gadget_id = 70210022, pos = { x = -18.0, y = 1.0, z = -5.5 }, rot = { x = 0.0, y = 86.1, z = 0.0 }, level = 1, chest_drop_id = 1400602, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 43, gadget_id = 70210022, pos = { x = -18.3, y = 1.0, z = -2.8 }, rot = { x = 0.0, y = 57.3, z = 0.0 }, level = 1, chest_drop_id = 1400602, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 44, gadget_id = 70220004, pos = { x = 4.6, y = -3.0, z = 25.7 }, rot = { x = 0.0, y = 164.7, z = 0.0 }, level = 1 },
	{ config_id = 45, gadget_id = 70220004, pos = { x = 5.0, y = -2.9, z = 30.5 }, rot = { x = 0.0, y = 50.4, z = 0.0 }, level = 1 },
	{ config_id = 46, gadget_id = 70220004, pos = { x = 4.9, y = -2.9, z = 27.1 }, rot = { x = 0.0, y = 132.0, z = 0.0 }, level = 1 },
	{ config_id = 47, gadget_id = 70220004, pos = { x = 4.9, y = -2.9, z = 28.9 }, rot = { x = 0.0, y = 48.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 7, shape = RegionShape.SPHERE, radius = 5, pos = { x = -4.1, y = 1.0, z = -5.4 } },
	{ config_id = 8, shape = RegionShape.SPHERE, radius = 5, pos = { x = -12.9, y = 1.1, z = -5.9 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_7", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_7", action = "action_EVENT_GADGET_STATE_CHANGE_7" },
	{ name = "ANY_MONSTER_DIE_8", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_8", action = "action_EVENT_ANY_MONSTER_DIE_8" }
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
		monsters = { 9, 10, 11, 12 },
		gadgets = { 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47 },
		regions = { 7, 8 },
		triggers = { "GADGET_STATE_CHANGE_7", "ANY_MONSTER_DIE_8" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_7(context, evt)
	if 35 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_7(context, evt)
	-- 将configid为 34 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 34, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_8(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_8(context, evt)
	-- 将configid为 42 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 42, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 43 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 43, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
