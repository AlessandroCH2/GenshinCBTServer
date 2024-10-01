--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1228, monster_id = 20011201, pos = { x = 2193.1, y = 209.2, z = -1048.5 }, rot = { x = 0.0, y = 131.6, z = 0.0 }, level = 0, drop_id = 100011 },
	{ config_id = 1229, monster_id = 20011201, pos = { x = 2194.0, y = 209.3, z = -1047.6 }, rot = { x = 0.0, y = 131.6, z = 0.0 }, level = 0, drop_id = 100011 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3542, gadget_id = 70210023, pos = { x = 2193.0, y = 209.0, z = -1050.2 }, rot = { x = 353.6, y = 59.7, z = 0.9 }, level = 1, chest_drop_id = 403320, state = GadgetState.ChestBramble, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 443, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2196.6, y = 208.7, z = -1052.9 } },
	{ config_id = 478, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2192.9, y = 209.1, z = -1049.6 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_443", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_443", trigger_count = 0 },
	{ name = "ENTER_REGION_478", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_478", action = "action_EVENT_ENTER_REGION_478" }
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
		monsters = { },
		gadgets = { 3542 },
		regions = { 443, 478 },
		triggers = { "CLIENT_EXECUTE_443", "ENTER_REGION_478" },
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
function action_EVENT_CLIENT_EXECUTE_443(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end

-- 触发条件
function condition_EVENT_ENTER_REGION_478(context, evt)
	if evt.param1 ~= 478 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_478(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1228, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1229, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end
