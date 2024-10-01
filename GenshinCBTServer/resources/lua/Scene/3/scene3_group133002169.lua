--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 490, monster_id = 20010501, pos = { x = 1716.1, y = 273.7, z = -892.9 }, rot = { x = 0.0, y = 83.8, z = 0.0 }, level = 7, drop_id = 100014, disableWander = true },
	{ config_id = 491, monster_id = 20010501, pos = { x = 1720.8, y = 274.7, z = -896.8 }, rot = { x = 0.0, y = 7.8, z = 0.0 }, level = 7, drop_id = 100014, disableWander = true },
	{ config_id = 492, monster_id = 20010501, pos = { x = 1719.0, y = 272.8, z = -887.6 }, rot = { x = 0.0, y = 210.4, z = 0.0 }, level = 7, drop_id = 100014, disableWander = true },
	{ config_id = 493, monster_id = 20010501, pos = { x = 1724.8, y = 273.9, z = -892.0 }, rot = { x = 0.0, y = 261.2, z = 0.0 }, level = 7, drop_id = 100014, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1476, gadget_id = 70500000, pos = { x = 1720.5, y = 274.4, z = -895.5 }, rot = { x = 0.0, y = 82.1, z = 0.0 }, level = 1, point_type = 3007, isOneoff = true },
	{ config_id = 1477, gadget_id = 70500000, pos = { x = 1720.3, y = 273.1, z = -888.9 }, rot = { x = 0.0, y = 291.9, z = 0.0 }, level = 1, point_type = 3007, isOneoff = true },
	{ config_id = 1478, gadget_id = 70500000, pos = { x = 1717.1, y = 273.6, z = -891.9 }, rot = { x = 351.9, y = 183.7, z = 0.0 }, level = 1, point_type = 3007, isOneoff = true },
	{ config_id = 1479, gadget_id = 70500000, pos = { x = 1723.5, y = 273.9, z = -892.3 }, rot = { x = 0.0, y = 291.9, z = 0.0 }, level = 1, point_type = 3007, isOneoff = true },
	{ config_id = 1480, gadget_id = 70500000, pos = { x = 1718.2, y = 274.0, z = -894.2 }, rot = { x = 0.0, y = 122.1, z = 0.0 }, level = 1, point_type = 3007, isOneoff = true },
	{ config_id = 1481, gadget_id = 70500000, pos = { x = 1717.8, y = 273.2, z = -889.7 }, rot = { x = 352.3, y = 210.9, z = 358.8 }, level = 1, point_type = 3007, isOneoff = true },
	{ config_id = 1482, gadget_id = 70500000, pos = { x = 1722.7, y = 274.2, z = -894.4 }, rot = { x = 15.9, y = 10.9, z = 356.9 }, level = 1, point_type = 3007, isOneoff = true },
	{ config_id = 1483, gadget_id = 70500000, pos = { x = 1722.7, y = 273.4, z = -889.7 }, rot = { x = 7.6, y = 278.6, z = 350.2 }, level = 1, point_type = 3007, isOneoff = true },
	{ config_id = 1484, gadget_id = 70210022, pos = { x = 1720.5, y = 273.8, z = -892.2 }, rot = { x = 0.0, y = 1.4, z = 0.0 }, level = 1, chest_drop_id = 403223, state = GadgetState.ChestLocked, showcutscene = true, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 176, shape = RegionShape.SPHERE, radius = 2, pos = { x = 1720.3, y = 273.8, z = -892.3 } },
	{ config_id = 177, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1719.9, y = 273.7, z = -892.1 } },
	{ config_id = 269, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1720.6, y = 273.4, z = -890.1 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_176", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_176", action = "action_EVENT_ENTER_REGION_176" },
	{ name = "ANY_MONSTER_DIE_177", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_177", action = "action_EVENT_ANY_MONSTER_DIE_177" },
	{ name = "CLIENT_EXECUTE_269", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_269", trigger_count = 0 }
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
		gadgets = { 1476, 1477, 1478, 1479, 1480, 1481, 1482, 1483 },
		regions = { 176, 177, 269 },
		triggers = { "ENTER_REGION_176", "ANY_MONSTER_DIE_177", "CLIENT_EXECUTE_269" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_176(context, evt)
	if evt.param1 ~= 176 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_176(context, evt)
	-- 创生gadget 1484
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1484 }) then
		return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 490, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 491, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 492, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 493, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_177(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_177(context, evt)
	-- 解锁目标1484
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 1484, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_269(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
