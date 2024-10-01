--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1064, monster_id = 20011201, pos = { x = 1482.7, y = 263.4, z = -1354.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 303041 },
	{ config_id = 1065, monster_id = 20011201, pos = { x = 1482.6, y = 262.7, z = -1357.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 303041 },
	{ config_id = 1066, monster_id = 20011201, pos = { x = 1482.1, y = 264.7, z = -1351.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 303041 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2680, gadget_id = 70210032, pos = { x = 1480.4, y = 263.6, z = -1355.1 }, rot = { x = 0.0, y = 67.2, z = 350.0 }, level = 1, chest_drop_id = 403341, state = GadgetState.ChestLocked, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 260, shape = RegionShape.SPHERE, radius = 10.2, pos = { x = 1480.6, y = 261.4, z = -1354.9 } },
	{ config_id = 261, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1483.2, y = 263.3, z = -1354.6 } },
	{ config_id = 318, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1489.1, y = 262.1, z = -1354.6 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_260", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_260", action = "action_EVENT_ENTER_REGION_260" },
	{ name = "ANY_MONSTER_DIE_261", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_261", action = "action_EVENT_ANY_MONSTER_DIE_261" },
	{ name = "CLIENT_EXECUTE_318", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_318", trigger_count = 0 }
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
		monsters = { 1064, 1065, 1066 },
		gadgets = { 2680 },
		regions = { 260, 261, 318 },
		triggers = { "ENTER_REGION_260", "ANY_MONSTER_DIE_261", "CLIENT_EXECUTE_318" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_260(context, evt)
	if evt.param1 ~= 260 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_260(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1065, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1066, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1064, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_261(context, evt)
	-- 判断指定group组剩余怪物数量是否是0 
	if ScriptLib.GetGroupMonsterCountByGroupId(context, 133001239) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_261(context, evt)
	-- 将configid为 2680 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 2680, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_318(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
