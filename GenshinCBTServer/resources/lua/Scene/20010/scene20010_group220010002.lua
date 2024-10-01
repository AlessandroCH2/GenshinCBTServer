--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 29, monster_id = 21010701, pos = { x = 394.3, y = -34.4, z = 26.5 }, rot = { x = 0.0, y = 291.3, z = 0.0 }, level = 1, disableWander = true },
	{ config_id = 30, monster_id = 21010701, pos = { x = 385.2, y = -34.4, z = 38.0 }, rot = { x = 0.0, y = 232.0, z = 0.0 }, level = 1, disableWander = true },
	{ config_id = 31, monster_id = 21010601, pos = { x = 390.8, y = -34.4, z = 22.4 }, rot = { x = 0.0, y = 312.2, z = 0.0 }, level = 1, disableWander = true },
	{ config_id = 77, monster_id = 21010501, pos = { x = 361.6, y = -34.5, z = 34.3 }, rot = { x = 0.0, y = 272.8, z = 0.0 }, level = 0, disableWander = true, affix = { 1001 }, pose_id = 32 },
	{ config_id = 82, monster_id = 21010501, pos = { x = 361.7, y = -34.5, z = 30.4 }, rot = { x = 0.0, y = 267.8, z = 0.0 }, level = 0, disableWander = true, affix = { 1001 }, pose_id = 32 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 8, gadget_id = 70350003, pos = { x = 392.4, y = -34.4, z = 40.2 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 },
	{ config_id = 36, gadget_id = 70220007, pos = { x = 390.6, y = -34.6, z = 18.5 }, rot = { x = 0.0, y = 358.5, z = 0.0 }, level = 1 },
	{ config_id = 37, gadget_id = 70220007, pos = { x = 383.7, y = -34.6, z = 47.9 }, rot = { x = 0.0, y = 179.3, z = 0.0 }, level = 1 },
	{ config_id = 74, gadget_id = 70210012, pos = { x = 401.5, y = -34.5, z = 38.9 }, rot = { x = 0.0, y = 274.1, z = 0.0 }, level = 1, chest_drop_id = 1400301, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 118, gadget_id = 70220014, pos = { x = 399.5, y = -34.5, z = 40.3 }, rot = { x = 0.0, y = 295.3, z = 0.0 }, level = 1 },
	{ config_id = 119, gadget_id = 70220013, pos = { x = 399.7, y = -34.5, z = 38.7 }, rot = { x = 0.0, y = 243.7, z = 0.0 }, level = 1 },
	{ config_id = 120, gadget_id = 70220013, pos = { x = 398.9, y = -34.6, z = 36.7 }, rot = { x = 0.0, y = 290.0, z = 0.0 }, level = 1 },
	{ config_id = 121, gadget_id = 70220013, pos = { x = 401.1, y = -34.5, z = 40.7 }, rot = { x = 0.0, y = 155.7, z = 0.0 }, level = 1 },
	{ config_id = 122, gadget_id = 70220014, pos = { x = 398.1, y = -34.6, z = 38.3 }, rot = { x = 0.0, y = 303.3, z = 0.0 }, level = 1 },
	{ config_id = 123, gadget_id = 70350003, pos = { x = 374.8, y = -34.5, z = 32.8 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 },
	{ config_id = 134, gadget_id = 70310001, pos = { x = 390.5, y = -34.5, z = 31.4 }, rot = { x = 0.0, y = 281.0, z = 0.0 }, level = 1 },
	{ config_id = 145, gadget_id = 70310002, pos = { x = 374.4, y = -29.7, z = 37.8 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 146, gadget_id = 70310002, pos = { x = 374.4, y = -29.5, z = 27.9 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 172, gadget_id = 70380001, pos = { x = 410.0, y = -35.5, z = 70.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, route_id = 20010007, start_route = false }
}

-- 区域
regions = {
	{ config_id = 10, shape = RegionShape.SPHERE, radius = 5, pos = { x = 400.0, y = -34.4, z = 36.0 } },
	{ config_id = 37, shape = RegionShape.SPHERE, radius = 5, pos = { x = 397.3, y = -34.6, z = 40.2 } },
	{ config_id = 53, shape = RegionShape.CUBIC, size = { x = 10.0, y = 8.0, z = 30.0 }, pos = { x = 387.3, y = -34.5, z = 32.2 } },
	{ config_id = 55, shape = RegionShape.SPHERE, radius = 5, pos = { x = 372.0, y = -34.6, z = 32.7 } },
	{ config_id = 62, shape = RegionShape.SPHERE, radius = 5, pos = { x = 390.4, y = -34.5, z = 31.7 } },
	{ config_id = 69, shape = RegionShape.CUBIC, size = { x = 20.0, y = 20.0, z = 13.0 }, pos = { x = 349.5, y = -34.5, z = 32.9 } },
	{ config_id = 74, shape = RegionShape.SPHERE, radius = 5, pos = { x = 409.0, y = -34.5, z = 60.7 } },
	{ config_id = 75, shape = RegionShape.CUBIC, size = { x = 5.0, y = 3.0, z = 5.0 }, pos = { x = 409.5, y = -34.4, z = 71.2 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_10", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_10", action = "action_EVENT_ANY_MONSTER_DIE_10" },
	{ name = "ANY_MONSTER_DIE_37", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_37", action = "action_EVENT_ANY_MONSTER_DIE_37" },
	{ name = "ENTER_REGION_53", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_53", action = "action_EVENT_ENTER_REGION_53" },
	{ name = "ANY_MONSTER_DIE_55", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_55", action = "action_EVENT_ANY_MONSTER_DIE_55" },
	{ name = "GADGET_CREATE_62", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_62", action = "action_EVENT_GADGET_CREATE_62" },
	{ name = "ENTER_REGION_69", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_69", action = "action_EVENT_ENTER_REGION_69" },
	{ name = "GADGET_CREATE_74", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_74", action = "action_EVENT_GADGET_CREATE_74" },
	{ name = "ENTER_REGION_75", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_75", action = "action_EVENT_ENTER_REGION_75" }
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
		monsters = { 29, 30, 31, 77, 82 },
		gadgets = { 8, 36, 37, 74, 118, 119, 120, 121, 122, 123, 134, 145, 146, 172 },
		regions = { 10, 37, 53, 55, 62, 69, 74, 75 },
		triggers = { "ANY_MONSTER_DIE_10", "ANY_MONSTER_DIE_37", "ENTER_REGION_53", "ANY_MONSTER_DIE_55", "GADGET_CREATE_62", "ENTER_REGION_69", "GADGET_CREATE_74", "ENTER_REGION_75" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_10(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_10(context, evt)
	-- 将configid为 8 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 8, GadgetState.GearStart) then
			return -1
		end 
	
	-- 解锁目标11
	if 0 ~= ScriptLib.UnlockForce(context, 11) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_37(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_37(context, evt)
	-- 解锁目标74
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 74, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_53(context, evt)
	if evt.param1 ~= 53 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_53(context, evt)
	-- 将configid为 123 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 123, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_55(context, evt)
	-- 判断剩余怪物数量是否是3
	if ScriptLib.GetGroupMonsterCount(context) ~= 3 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_55(context, evt)
	-- 将configid为 123 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 123, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_62(context, evt)
	if 134 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_62(context, evt)
	-- 将configid为 134 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 134, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_69(context, evt)
	if evt.param1 ~= 69 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_69(context, evt)
	-- 将configid为 145 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 145, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 146 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 146, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_74(context, evt)
	if 172 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_74(context, evt)
	-- 停止移动平台
	if 0 ~= ScriptLib.StopPlatform(context, 172) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_75(context, evt)
	if evt.param1 ~= 75 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_75(context, evt)
	-- 启动移动平台
	if 0 ~= ScriptLib.StartPlatform(context, 172) then
	  return -1
	end
	
	return 0
end
