--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 154, monster_id = 20011001, pos = { x = 2060.5, y = 268.6, z = -377.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13, drop_id = 303043 },
	{ config_id = 155, monster_id = 20011001, pos = { x = 2061.2, y = 270.4, z = -378.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13, drop_id = 303043 },
	{ config_id = 156, monster_id = 20011001, pos = { x = 2065.4, y = 270.7, z = -382.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 159, gadget_id = 70500000, pos = { x = 2075.1, y = 260.7, z = -342.6 }, rot = { x = 8.3, y = 127.4, z = 324.4 }, level = 1, point_type = 1001 },
	{ config_id = 161, gadget_id = 70500000, pos = { x = 2075.6, y = 260.8, z = -351.9 }, rot = { x = 3.6, y = 351.8, z = 29.0 }, level = 1, point_type = 1001 },
	{ config_id = 199, gadget_id = 70210022, pos = { x = 2062.2, y = 265.7, z = -380.6 }, rot = { x = 11.7, y = 153.6, z = 11.8 }, level = 1, chest_drop_id = 403343, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 47, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2062.4, y = 265.4, z = -386.9 } },
	{ config_id = 55, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2062.9, y = 265.3, z = -387.2 } },
	{ config_id = 101, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2063.3, y = 263.1, z = -386.0 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_47", event = EventType.EVENT_ENTER_REGION, source = "", condition = "", action = "action_EVENT_ENTER_REGION_47" },
	{ name = "ANY_MONSTER_DIE_55", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_55", action = "action_EVENT_ANY_MONSTER_DIE_55" },
	{ name = "CLIENT_EXECUTE_101", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_101", trigger_count = 0 }
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
		monsters = { },
		gadgets = { 159, 161, 199 },
		regions = { 47, 55, 101 },
		triggers = { "ENTER_REGION_47", "ANY_MONSTER_DIE_55", "CLIENT_EXECUTE_101" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件

-- 触发操作
function action_EVENT_ENTER_REGION_47(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 154, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 155, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 156, delay_time = 0 }) then
	  return -1
	end
	
	-- 将configid为 199 的物件更改为状态 GadgetState.ChestLocked
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 199, GadgetState.ChestLocked) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_55(context, evt)
	-- 判断指定group组剩余怪物数量是否是0 
	if ScriptLib.GetGroupMonsterCountByGroupId(context, 133004040) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_55(context, evt)
	-- 解锁目标199
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 199, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_101(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
