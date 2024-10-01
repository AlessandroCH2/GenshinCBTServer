--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 229, monster_id = 21010501, pos = { x = 2143.0, y = 232.8, z = -458.4 }, rot = { x = 0.0, y = 280.5, z = 0.0 }, level = 11, drop_id = 303003, disableWander = true },
	{ config_id = 230, monster_id = 21010501, pos = { x = 2139.7, y = 232.6, z = -456.6 }, rot = { x = 0.0, y = 274.3, z = 0.0 }, level = 11, drop_id = 303003, disableWander = true },
	{ config_id = 231, monster_id = 21010201, pos = { x = 2134.0, y = 230.6, z = -450.4 }, rot = { x = 0.0, y = 73.4, z = 0.0 }, level = 11, drop_id = 303003, disableWander = true },
	{ config_id = 232, monster_id = 21010301, pos = { x = 2136.5, y = 230.8, z = -448.4 }, rot = { x = 0.0, y = 184.5, z = 0.0 }, level = 11, drop_id = 303003, disableWander = true },
	{ config_id = 333, monster_id = 21010101, pos = { x = 2138.3, y = 228.1, z = -452.6 }, rot = { x = 0.0, y = 229.2, z = 0.0 }, level = 11, drop_id = 303003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 313, gadget_id = 70220013, pos = { x = 2133.9, y = 231.0, z = -447.6 }, rot = { x = 0.0, y = 274.0, z = 13.2 }, level = 1 },
	{ config_id = 314, gadget_id = 70310004, pos = { x = 2136.4, y = 230.6, z = -450.5 }, rot = { x = 0.0, y = 314.2, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 62, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2118.9, y = 232.2, z = -449.4 } },
	{ config_id = 108, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2134.2, y = 231.4, z = -447.9 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_62", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_62", action = "action_EVENT_ENTER_REGION_62" },
	{ name = "CLIENT_EXECUTE_108", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_108", trigger_count = 0 }
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
		monsters = { 229, 230, 231, 232, 333 },
		gadgets = { 313, 314 },
		regions = { 62, 108 },
		triggers = { "ENTER_REGION_62", "CLIENT_EXECUTE_108" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_62(context, evt)
	if evt.param1 ~= 62 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_62(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 215, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 216, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_108(context, evt)
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
	local this_group = ScriptLib.GetContextGroupId(context)
	if evt.param1 == 1 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.GearStart )
		return 0
	end
	if evt.param1 == 0 then
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_gadget, GadgetState.Default )
		return 0
	end
	return 0
end
