--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 32, monster_id = 20010801, pos = { x = 408.9, y = -23.7, z = 129.5 }, rot = { x = 0.0, y = 207.6, z = 0.0 }, level = 1, affix = { 1002 } },
	{ config_id = 33, monster_id = 20010801, pos = { x = 397.7, y = -24.6, z = 126.2 }, rot = { x = 0.0, y = 128.1, z = 0.0 }, level = 1, affix = { 1002 } },
	{ config_id = 83, monster_id = 21010201, pos = { x = 404.6, y = -24.1, z = 121.1 }, rot = { x = 0.0, y = 128.1, z = 0.0 }, level = 0, disableWander = true, pose_id = 9003 },
	{ config_id = 84, monster_id = 20010801, pos = { x = 402.8, y = -24.1, z = 127.8 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 0, affix = { 1002 } }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 62, gadget_id = 70350002, pos = { x = 416.4, y = -24.3, z = 120.8 }, rot = { x = 0.0, y = 269.6, z = 0.0 }, level = 1 },
	{ config_id = 63, gadget_id = 70210022, pos = { x = 403.3, y = -24.1, z = 122.3 }, rot = { x = 0.0, y = 182.6, z = 0.0 }, level = 1, chest_drop_id = 1400302, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 135, gadget_id = 70310001, pos = { x = 401.8, y = -23.6, z = 141.6 }, rot = { x = 0.0, y = 191.3, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 33, shape = RegionShape.SPHERE, radius = 5, pos = { x = 400.0, y = -23.7, z = 116.0 } },
	{ config_id = 65, shape = RegionShape.CUBIC, size = { x = 30.0, y = 5.0, z = 10.0 }, pos = { x = 401.5, y = -24.1, z = 118.8 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_33", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_33", action = "action_EVENT_ANY_MONSTER_DIE_33" },
	{ name = "ENTER_REGION_65", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_65", action = "action_EVENT_ENTER_REGION_65" }
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
		monsters = { 83 },
		gadgets = { 62, 63, 135 },
		regions = { 33, 65 },
		triggers = { "ANY_MONSTER_DIE_33", "ENTER_REGION_65" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_33(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_33(context, evt)
	-- 将configid为 62 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 62, GadgetState.GearStart) then
			return -1
		end 
	
	-- 解锁目标18
	if 0 ~= ScriptLib.UnlockForce(context, 18) then
		return -1
	end
	
	-- 将configid为 63 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 63, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_65(context, evt)
	if evt.param1 ~= 65 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_65(context, evt)
	-- 延迟0.5秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 32, delay_time = 0.5 }) then
	  return -1
	end
	
	-- 延迟1秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 33, delay_time = 1 }) then
	  return -1
	end
	
	-- 延迟1秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 84, delay_time = 1 }) then
	  return -1
	end
	
	return 0
end
