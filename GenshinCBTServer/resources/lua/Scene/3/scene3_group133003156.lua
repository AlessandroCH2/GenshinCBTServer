--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 634, monster_id = 28030401, pos = { x = 2615.2, y = 216.8, z = -1603.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 635, monster_id = 28030401, pos = { x = 2616.1, y = 216.7, z = -1601.0 }, rot = { x = 0.0, y = 260.7, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 636, monster_id = 28030401, pos = { x = 2616.9, y = 216.2, z = -1603.0 }, rot = { x = 0.0, y = 341.1, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 1108, monster_id = 28030401, pos = { x = 2618.4, y = 221.6, z = -1304.1 }, rot = { x = 0.0, y = 324.4, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 1109, monster_id = 28030401, pos = { x = 2617.9, y = 221.6, z = -1306.6 }, rot = { x = 0.0, y = 301.7, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 1110, monster_id = 28030401, pos = { x = 2621.0, y = 222.5, z = -1304.2 }, rot = { x = 0.0, y = 324.4, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 1111, monster_id = 28030401, pos = { x = 2620.4, y = 222.3, z = -1303.6 }, rot = { x = 0.0, y = 168.3, z = 0.0 }, level = 0, pose_id = 2 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2873, gadget_id = 70210031, pos = { x = 2659.7, y = 250.9, z = -1471.2 }, rot = { x = 0.0, y = 269.5, z = 0.0 }, level = 1, chest_drop_id = 403300, isOneoff = true },
	{ config_id = 3794, gadget_id = 70210021, pos = { x = 2621.8, y = 224.2, z = -1356.7 }, rot = { x = 0.5, y = 176.3, z = 352.6 }, level = 1, chest_drop_id = 403300, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 328, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2620.7, y = 214.6, z = -1606.3 } },
	{ config_id = 541, shape = RegionShape.SPHERE, radius = 8.3, pos = { x = 2618.5, y = 214.6, z = -1605.2 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_328", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_328", trigger_count = 0 },
	{ name = "ENTER_REGION_541", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_541", action = "action_EVENT_ENTER_REGION_541" }
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
		monsters = { 1108, 1109, 1110, 1111 },
		gadgets = { 2873, 3794 },
		regions = { 328, 541 },
		triggers = { "CLIENT_EXECUTE_328", "ENTER_REGION_541" },
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
function action_EVENT_CLIENT_EXECUTE_328(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件
function condition_EVENT_ENTER_REGION_541(context, evt)
	if evt.param1 ~= 541 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_541(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 634, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 635, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 636, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end
