--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 441, monster_id = 20010301, pos = { x = 1928.2, y = 250.6, z = -450.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042 },
	{ config_id = 442, monster_id = 20010301, pos = { x = 1928.2, y = 250.7, z = -444.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 7, drop_id = 303042 },
	{ config_id = 443, monster_id = 20010301, pos = { x = 1927.3, y = 250.4, z = -447.9 }, rot = { x = 0.0, y = 262.0, z = 0.0 }, level = 7, drop_id = 303042 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1406, gadget_id = 70220019, pos = { x = 1930.2, y = 251.3, z = -447.9 }, rot = { x = 0.0, y = 289.3, z = 0.0 }, level = 1 },
	{ config_id = 1409, gadget_id = 70210021, pos = { x = 1930.0, y = 257.8, z = -448.0 }, rot = { x = 0.0, y = 206.8, z = 0.0 }, level = 1, chest_drop_id = 403222, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 155, shape = RegionShape.SPHERE, radius = 7.6, pos = { x = 1929.6, y = 250.9, z = -447.5 } },
	{ config_id = 262, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1916.6, y = 251.7, z = -456.6 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_155", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_155", action = "action_EVENT_ENTER_REGION_155" },
	{ name = "CLIENT_EXECUTE_262", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_262", trigger_count = 0 }
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
		gadgets = { 1406, 1409 },
		regions = { 155, 262 },
		triggers = { "ENTER_REGION_155", "CLIENT_EXECUTE_262" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_155(context, evt)
	if evt.param1 ~= 155 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_155(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 441, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 442, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 443, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_262(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
