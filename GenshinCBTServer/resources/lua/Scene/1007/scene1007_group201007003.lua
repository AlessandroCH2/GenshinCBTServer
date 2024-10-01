--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 5, monster_id = 21010501, pos = { x = -63.1, y = -41.5, z = 46.8 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 6, monster_id = 21010501, pos = { x = -63.1, y = -41.5, z = 54.4 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 7, monster_id = 22010201, pos = { x = -82.2, y = -40.5, z = 58.5 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 8, monster_id = 20010801, pos = { x = -87.6, y = -41.5, z = 42.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 9, monster_id = 20010801, pos = { x = -84.7, y = -41.5, z = 73.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 10, monster_id = 20010801, pos = { x = -98.0, y = -41.5, z = 57.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 10, gadget_id = 70350003, pos = { x = -52.9, y = -46.8, z = 32.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 11, gadget_id = 70350002, pos = { x = -109.4, y = -38.0, z = 58.5 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 3, shape = RegionShape.SPHERE, radius = 5, pos = { x = -83.0, y = -40.5, z = 59.0 } },
	{ config_id = 4, shape = RegionShape.SPHERE, radius = 8, pos = { x = -52.2, y = -42.3, z = 10.9 } },
	{ config_id = 5, shape = RegionShape.CUBIC, size = { x = 22.9, y = 1.0, z = 2.2 }, pos = { x = -53.8, y = -46.5, z = 25.7 } },
	{ config_id = 6, shape = RegionShape.CUBIC, size = { x = 16.5, y = 8.6, z = 3.3 }, pos = { x = -57.1, y = -46.5, z = 40.6 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_3", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_3", action = "action_EVENT_ANY_MONSTER_DIE_3", trigger_count = 0 },
	{ name = "ENTER_REGION_4", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_4", action = "action_EVENT_ENTER_REGION_4", trigger_count = 0 },
	{ name = "ENTER_REGION_5", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_5", action = "action_EVENT_ENTER_REGION_5", trigger_count = 0 },
	{ name = "ENTER_REGION_6", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_6", action = "action_EVENT_ENTER_REGION_6", trigger_count = 0 }
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
		gadgets = { 10 },
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
function condition_EVENT_ANY_MONSTER_DIE_3(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_3(context, evt)
	-- 将configid为 11 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 11, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_4(context, evt)
	if evt.param1 ~= 4 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_4(context, evt)
	-- 将configid为 10 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 10, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_5(context, evt)
	if evt.param1 ~= 5 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_5(context, evt)
	-- 将configid为 10 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 10, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_6(context, evt)
	if evt.param1 ~= 6 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_6(context, evt)
	-- 将configid为 10 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 10, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
