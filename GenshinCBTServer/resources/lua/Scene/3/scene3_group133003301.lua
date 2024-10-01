--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 984, monster_id = 20011001, pos = { x = 2324.9, y = 211.8, z = -1116.2 }, rot = { x = 0.0, y = 141.8, z = 0.0 }, level = 1, drop_id = 303041, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3213, gadget_id = 70210011, pos = { x = 2322.2, y = 211.4, z = -1121.6 }, rot = { x = 0.0, y = 108.1, z = 0.0 }, level = 1, chest_drop_id = 403300, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 223, shape = RegionShape.SPHERE, radius = 1.5, pos = { x = 2327.0, y = 208.3, z = -1119.3 } },
	{ config_id = 379, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2327.0, y = 208.2, z = -1119.9 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_223", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_223", action = "action_EVENT_ENTER_REGION_223" },
	{ name = "CLIENT_EXECUTE_379", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_379", trigger_count = 0 }
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
		gadgets = { 3213 },
		regions = { 223, 379 },
		triggers = { "ENTER_REGION_223", "CLIENT_EXECUTE_379" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_223(context, evt)
	if evt.param1 ~= 223 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_223(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 984, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_379(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
