--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 20, monster_id = 21010301, pos = { x = 177.9, y = 42.0, z = 120.2 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 21, monster_id = 21010301, pos = { x = 177.9, y = 42.0, z = 121.6 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 22, monster_id = 21010301, pos = { x = 180.0, y = 42.0, z = 120.1 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 23, monster_id = 21010301, pos = { x = 180.1, y = 42.0, z = 121.6 }, rot = { x = 0.0, y = 273.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 24, monster_id = 20010901, pos = { x = 190.4, y = 42.1, z = 120.9 }, rot = { x = 0.0, y = 274.7, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 19, gadget_id = 70320001, pos = { x = 86.3, y = 39.5, z = 119.8 }, rot = { x = 0.0, y = 323.1, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 20, gadget_id = 70320001, pos = { x = 98.6, y = 39.5, z = 123.8 }, rot = { x = 0.0, y = 144.1, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 21, gadget_id = 70350002, pos = { x = 173.9, y = 42.0, z = 121.0 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 22, gadget_id = 70350002, pos = { x = 190.5, y = 42.0, z = 137.7 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1 },
	{ config_id = 23, gadget_id = 70320001, pos = { x = 112.9, y = 39.5, z = 120.8 }, rot = { x = 0.0, y = 133.6, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 5, shape = RegionShape.SPHERE, radius = 12.11, pos = { x = 139.8, y = 39.5, z = 121.4 } },
	{ config_id = 6, shape = RegionShape.SPHERE, radius = 5, pos = { x = 191.3, y = 42.0, z = 126.8 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_5", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_5", action = "action_EVENT_ENTER_REGION_5" },
	{ name = "ANY_MONSTER_DIE_6", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_6", action = "action_EVENT_ANY_MONSTER_DIE_6", trigger_count = 0 }
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
		-- description = suite_1,
		monsters = { 24 },
		gadgets = { 19, 20, 21, 22, 23 },
		regions = { 5, 6 },
		triggers = { "ENTER_REGION_5", "ANY_MONSTER_DIE_6" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

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
	-- 将configid为 21 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 21, GadgetState.GearStart) then
			return -1
		end 
	
	-- 延迟2秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 20, delay_time = 2 }) then
	  return -1
	end
	
	-- 延迟2秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 21, delay_time = 2 }) then
	  return -1
	end
	
	-- 延迟2秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 22, delay_time = 2 }) then
	  return -1
	end
	
	-- 延迟2秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 23, delay_time = 2 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_6(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_6(context, evt)
	-- 将configid为 22 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 22, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end
