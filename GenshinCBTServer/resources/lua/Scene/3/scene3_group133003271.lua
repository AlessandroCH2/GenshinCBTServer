--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 918, monster_id = 28030101, pos = { x = 2652.2, y = 266.7, z = -1335.0 }, rot = { x = 0.0, y = 298.1, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 919, monster_id = 28030101, pos = { x = 2710.1, y = 261.7, z = -1367.6 }, rot = { x = 0.0, y = 97.3, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 923, monster_id = 20010501, pos = { x = 2678.9, y = 262.5, z = -1418.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 15, drop_id = 303003 },
	{ config_id = 924, monster_id = 20010501, pos = { x = 2677.5, y = 262.5, z = -1417.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 15, drop_id = 303003 },
	{ config_id = 925, monster_id = 20010501, pos = { x = 2676.0, y = 262.3, z = -1418.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 15, drop_id = 303003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3015, gadget_id = 70210011, pos = { x = 2691.3, y = 263.0, z = -1408.1 }, rot = { x = 0.0, y = 336.2, z = 0.0 }, level = 1, chest_drop_id = 403303, isOneoff = true },
	{ config_id = 3016, gadget_id = 70290010, pos = { x = 2677.2, y = 262.2, z = -1419.4 }, rot = { x = 0.0, y = 275.0, z = 0.0 }, level = 1 },
	{ config_id = 3017, gadget_id = 70500000, pos = { x = 2677.2, y = 262.2, z = -1419.4 }, rot = { x = 0.0, y = 275.0, z = 0.0 }, level = 1, point_type = 3006, owner = 3016 },
	{ config_id = 3018, gadget_id = 70500000, pos = { x = 2690.4, y = 263.4, z = -1401.4 }, rot = { x = 13.9, y = 334.3, z = 11.2 }, level = 1, point_type = 1001 },
	{ config_id = 3019, gadget_id = 70500000, pos = { x = 2690.3, y = 263.4, z = -1403.2 }, rot = { x = 331.0, y = 124.0, z = 357.5 }, level = 1, point_type = 1001 },
	{ config_id = 3357, gadget_id = 70500000, pos = { x = 2694.4, y = 262.5, z = -1380.5 }, rot = { x = 0.0, y = 57.9, z = 0.0 }, level = 1, point_type = 2001 }
}

-- 区域
regions = {
	{ config_id = 185, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2677.1, y = 262.4, z = -1419.3 } },
	{ config_id = 360, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2677.7, y = 266.5, z = -1363.8 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_185", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_185", action = "action_EVENT_ENTER_REGION_185" },
	{ name = "CLIENT_EXECUTE_360", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_360", trigger_count = 0 }
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
		monsters = { 918, 919 },
		gadgets = { 3015, 3016, 3017, 3018, 3019, 3357 },
		regions = { 185, 360 },
		triggers = { "ENTER_REGION_185", "CLIENT_EXECUTE_360" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_185(context, evt)
	if evt.param1 ~= 185 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_185(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 923, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 924, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 925, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_360(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
