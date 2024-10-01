--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1, monster_id = 20010601, pos = { x = 162.7, y = 60.4, z = -15.9 }, rot = { x = 0.0, y = 110.5, z = 0.0 }, level = 0 },
	{ config_id = 2, monster_id = 20010701, pos = { x = 166.6, y = 60.4, z = -27.9 }, rot = { x = 0.0, y = 44.6, z = 0.0 }, level = 0 },
	{ config_id = 3, monster_id = 20011001, pos = { x = 162.7, y = 60.6, z = -27.4 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 0 },
	{ config_id = 4, monster_id = 20011001, pos = { x = 160.0, y = 60.5, z = -13.0 }, rot = { x = 0.0, y = 99.7, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1, gadget_id = 70220004, pos = { x = 197.7, y = 60.5, z = -17.4 }, rot = { x = 0.0, y = 258.2, z = 0.0 }, level = 1 },
	{ config_id = 2, gadget_id = 70220004, pos = { x = 194.8, y = 60.5, z = -20.8 }, rot = { x = 0.0, y = 87.3, z = 0.0 }, level = 1 },
	{ config_id = 3, gadget_id = 70220004, pos = { x = 187.1, y = 60.5, z = -24.8 }, rot = { x = 0.0, y = 308.9, z = 0.0 }, level = 1 },
	{ config_id = 4, gadget_id = 70350005, pos = { x = 184.8, y = 60.4, z = -22.0 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 5, gadget_id = 70350005, pos = { x = 151.1, y = 60.4, z = -22.1 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 },
	{ config_id = 6, gadget_id = 70220004, pos = { x = 178.5, y = 60.5, z = -29.9 }, rot = { x = 0.0, y = 140.3, z = 0.0 }, level = 1 },
	{ config_id = 7, gadget_id = 70220004, pos = { x = 163.0, y = 60.5, z = -19.1 }, rot = { x = 0.0, y = 12.7, z = 0.0 }, level = 1 },
	{ config_id = 8, gadget_id = 70220004, pos = { x = 170.9, y = 60.5, z = -36.8 }, rot = { x = 0.0, y = 61.0, z = 0.0 }, level = 1 },
	{ config_id = 9, gadget_id = 70220004, pos = { x = 165.3, y = 60.5, z = -14.1 }, rot = { x = 0.0, y = 345.9, z = 0.0 }, level = 1 },
	{ config_id = 10, gadget_id = 70210032, pos = { x = 169.6, y = 60.4, z = -21.6 }, rot = { x = 0.0, y = 91.2, z = 0.0 }, level = 1, chest_drop_id = 1400604, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 11, gadget_id = 70210011, pos = { x = 175.3, y = 60.5, z = -7.9 }, rot = { x = 0.0, y = 184.2, z = 0.0 }, level = 1, chest_drop_id = 1400601, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 17, gadget_id = 70210011, pos = { x = 116.0, y = 56.2, z = -23.0 }, rot = { x = 0.0, y = 64.9, z = 0.0 }, level = 1, chest_drop_id = 1400601, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 18, gadget_id = 70210011, pos = { x = 99.8, y = 56.4, z = -22.2 }, rot = { x = 0.0, y = 347.0, z = 0.0 }, level = 1, chest_drop_id = 1400601, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST }
}

-- 区域
regions = {
	{ config_id = 1, shape = RegionShape.CUBIC, size = { x = 15.0, y = 1.0, z = 35.0 }, pos = { x = 171.4, y = 60.5, z = -22.2 } },
	{ config_id = 2, shape = RegionShape.SPHERE, radius = 5, pos = { x = 164.9, y = 60.5, z = -21.6 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_1", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_1", action = "action_EVENT_ENTER_REGION_1" },
	{ name = "ANY_MONSTER_DIE_2", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_2", action = "action_EVENT_ANY_MONSTER_DIE_2" }
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
		gadgets = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 17, 18 },
		regions = { 1, 2 },
		triggers = { "ENTER_REGION_1", "ANY_MONSTER_DIE_2" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_1(context, evt)
	if evt.param1 ~= 1 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_1(context, evt)
	-- 将configid为 4 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 4, GadgetState.Default) then
			return -1
		end 
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 2, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 3, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 4, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_2(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_2(context, evt)
	-- 将configid为 5 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 5, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 10 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 10, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
