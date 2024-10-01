--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1031, monster_id = 20011101, pos = { x = 2706.1, y = 273.7, z = -1581.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13, drop_id = 303043 },
	{ config_id = 1032, monster_id = 20011001, pos = { x = 2708.9, y = 273.9, z = -1580.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13, drop_id = 303043 },
	{ config_id = 1033, monster_id = 20011001, pos = { x = 2706.5, y = 273.7, z = -1578.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 13, drop_id = 303043 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3286, gadget_id = 70210032, pos = { x = 2706.9, y = 273.7, z = -1580.0 }, rot = { x = 0.0, y = 322.5, z = 0.0 }, level = 1, chest_drop_id = 403323, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 233, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2707.3, y = 273.7, z = -1579.8 } },
	{ config_id = 234, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2706.8, y = 273.7, z = -1579.8 } },
	{ config_id = 392, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2707.2, y = 273.8, z = -1580.1 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_233", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_233", action = "action_EVENT_ENTER_REGION_233" },
	{ name = "ANY_MONSTER_DIE_234", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_234", action = "action_EVENT_ANY_MONSTER_DIE_234" },
	{ name = "CLIENT_EXECUTE_392", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_392", trigger_count = 0 }
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
		gadgets = { 3286 },
		regions = { 233, 234, 392 },
		triggers = { "ENTER_REGION_233", "ANY_MONSTER_DIE_234", "CLIENT_EXECUTE_392" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_233(context, evt)
	if evt.param1 ~= 233 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_233(context, evt)
	-- 将configid为 3286 的物件更改为状态 GadgetState.ChestLocked
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 3286, GadgetState.ChestLocked) then
			return -1
		end 
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1032, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1033, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1031, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_234(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_234(context, evt)
	-- 解锁目标3286
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 3286, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_392(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
