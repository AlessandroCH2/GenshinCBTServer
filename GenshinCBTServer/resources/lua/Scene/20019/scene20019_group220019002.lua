--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 8, monster_id = 21010301, pos = { x = -4.3, y = 33.7, z = -29.7 }, rot = { x = 0.0, y = 172.0, z = 0.0 }, level = 0, disableWander = true, pose_id = 9003 },
	{ config_id = 9, monster_id = 21010301, pos = { x = 3.4, y = 33.7, z = -29.9 }, rot = { x = 0.0, y = 202.2, z = 0.0 }, level = 0, disableWander = true, pose_id = 9003 },
	{ config_id = 10, monster_id = 20010501, pos = { x = 7.8, y = 33.7, z = -19.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 11, monster_id = 20010501, pos = { x = 10.5, y = 33.7, z = -20.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 12, monster_id = 20010501, pos = { x = 6.4, y = 33.7, z = -21.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 13, monster_id = 20011401, pos = { x = -12.2, y = 33.7, z = -19.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 14, monster_id = 20011401, pos = { x = -5.1, y = 33.7, z = -21.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 15, monster_id = 20011401, pos = { x = -9.5, y = 33.7, z = -20.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 7, gadget_id = 70690007, pos = { x = 0.0, y = 34.0, z = -21.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 15, gadget_id = 70350006, pos = { x = 7.8, y = 33.8, z = -24.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 16, gadget_id = 70350006, pos = { x = -8.2, y = 33.8, z = -24.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 11, shape = RegionShape.SPHERE, radius = 5, pos = { x = -2.1, y = 33.7, z = -34.5 } },
	{ config_id = 12, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2.6, y = 33.7, z = -37.6 } },
	{ config_id = 13, shape = RegionShape.SPHERE, radius = 5, pos = { x = 0.6, y = 33.7, z = -39.5 } }
}

-- 触发器
triggers = {
	{ name = "MONSTER_BATTLE_11", event = EventType.EVENT_MONSTER_BATTLE, source = "", condition = "condition_EVENT_MONSTER_BATTLE_11", action = "action_EVENT_MONSTER_BATTLE_11" },
	{ name = "MONSTER_BATTLE_12", event = EventType.EVENT_MONSTER_BATTLE, source = "", condition = "condition_EVENT_MONSTER_BATTLE_12", action = "action_EVENT_MONSTER_BATTLE_12" },
	{ name = "ANY_MONSTER_DIE_13", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_13", action = "action_EVENT_ANY_MONSTER_DIE_13" }
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
		monsters = { 8, 9, 10, 11, 12, 13, 14, 15 },
		gadgets = { 7, 15, 16 },
		regions = { 11, 12, 13 },
		triggers = { "MONSTER_BATTLE_11", "MONSTER_BATTLE_12", "ANY_MONSTER_DIE_13" },
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
function condition_EVENT_MONSTER_BATTLE_11(context, evt)
	if 9 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_MONSTER_BATTLE_11(context, evt)
	-- 将configid为 15 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 15, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_MONSTER_BATTLE_12(context, evt)
	if 8 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_MONSTER_BATTLE_12(context, evt)
	-- 将configid为 16 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 16, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_13(context, evt)
	-- 判断指定group组剩余怪物数量是否是0 
	if ScriptLib.GetGroupMonsterCountByGroupId(context, 220019002) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_13(context, evt)
	-- 将configid为 7 的物件更改为状态 GadgetState.GearAction1
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 7, GadgetState.GearAction1) then
			return -1
		end 
	
	return 0
end
