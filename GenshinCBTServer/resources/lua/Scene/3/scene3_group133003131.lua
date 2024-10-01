--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 563, monster_id = 21010501, pos = { x = 2517.0, y = 310.9, z = -1629.6 }, rot = { x = 0.0, y = 136.9, z = 0.0 }, level = 11, drop_id = 303043 },
	{ config_id = 564, monster_id = 21010501, pos = { x = 2522.0, y = 311.3, z = -1624.3 }, rot = { x = 0.0, y = 133.1, z = 0.0 }, level = 11, drop_id = 303043 },
	{ config_id = 565, monster_id = 21010701, pos = { x = 2521.6, y = 311.7, z = -1628.3 }, rot = { x = 0.0, y = 156.5, z = 0.0 }, level = 11, drop_id = 303043, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2831, gadget_id = 70220021, pos = { x = 2502.6, y = 306.3, z = -1632.9 }, rot = { x = 338.9, y = 31.8, z = 9.9 }, level = 1 },
	{ config_id = 3750, gadget_id = 70220021, pos = { x = 2503.5, y = 307.3, z = -1632.7 }, rot = { x = 19.7, y = 271.4, z = 10.4 }, level = 1 },
	{ config_id = 3878, gadget_id = 70210032, pos = { x = 2551.9, y = 323.2, z = -1659.0 }, rot = { x = 11.8, y = 302.6, z = 0.0 }, level = 1, chest_drop_id = 403143, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 105, shape = RegionShape.SPHERE, radius = 9.9, pos = { x = 2545.4, y = 322.3, z = -1653.8 } },
	{ config_id = 482, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2546.6, y = 323.4, z = -1658.1 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_105", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_105", action = "action_EVENT_ENTER_REGION_105" },
	{ name = "ANY_MONSTER_DIE_482", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_482", action = "action_EVENT_ANY_MONSTER_DIE_482" }
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
		gadgets = { 2831, 3750, 3878 },
		regions = { 105, 482 },
		triggers = { "ENTER_REGION_105", "ANY_MONSTER_DIE_482" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_105(context, evt)
	if evt.param1 ~= 105 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_105(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 565, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 563, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 564, delay_time = 0 }) then
	  return -1
	end
	
	-- 将configid为 3878 的物件更改为状态 GadgetState.ChestLocked
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3878, GadgetState.ChestLocked) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_482(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_482(context, evt)
	-- 解锁目标3878
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3878, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
