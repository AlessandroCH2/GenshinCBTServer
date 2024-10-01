--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 25, monster_id = 20010901, pos = { x = 11.3, y = 13.2, z = 45.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, disableWander = true },
	{ config_id = 28, monster_id = 21010501, pos = { x = 58.2, y = 9.5, z = 30.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, disableWander = true },
	{ config_id = 45, monster_id = 20011001, pos = { x = 15.3, y = 13.5, z = 41.9 }, rot = { x = 0.0, y = 345.7, z = 0.0 }, level = 0 },
	{ config_id = 46, monster_id = 20011001, pos = { x = 10.7, y = 13.2, z = 41.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 74, monster_id = 20010801, pos = { x = 0.2, y = 13.0, z = 61.3 }, rot = { x = 0.0, y = 165.1, z = 0.0 }, level = 0 },
	{ config_id = 75, monster_id = 21010201, pos = { x = 57.0, y = 9.4, z = 26.5 }, rot = { x = 0.0, y = 332.2, z = 0.0 }, level = 0, pose_id = 9003 },
	{ config_id = 76, monster_id = 21010201, pos = { x = 58.8, y = 9.5, z = 41.7 }, rot = { x = 0.0, y = 216.3, z = 0.0 }, level = 0, disableWander = true, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 38, gadget_id = 70220007, pos = { x = 405.1, y = -34.6, z = 27.8 }, rot = { x = 0.0, y = 270.7, z = 0.0 }, level = 1 },
	{ config_id = 64, gadget_id = 70210011, pos = { x = 35.2, y = 16.4, z = 39.5 }, rot = { x = 0.0, y = 25.9, z = 0.0 }, level = 1, chest_drop_id = 1400301, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 65, gadget_id = 70220005, pos = { x = 58.8, y = 9.6, z = 28.1 }, rot = { x = 0.0, y = 137.6, z = 0.0 }, level = 1 },
	{ config_id = 67, gadget_id = 70320002, pos = { x = 58.2, y = 9.2, z = 55.7 }, rot = { x = 0.0, y = 272.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 71, gadget_id = 70210011, pos = { x = 0.5, y = 12.7, z = 58.4 }, rot = { x = 0.0, y = 348.3, z = 0.0 }, level = 1, chest_drop_id = 1400301, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 72, gadget_id = 70210011, pos = { x = 51.6, y = 9.5, z = 64.5 }, rot = { x = 0.0, y = 187.3, z = 0.0 }, level = 1, chest_drop_id = 1400301, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 73, gadget_id = 70210011, pos = { x = 33.2, y = 13.5, z = 65.6 }, rot = { x = 0.0, y = 318.9, z = 0.0 }, level = 1, chest_drop_id = 1400301, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 108, gadget_id = 70220013, pos = { x = 59.3, y = 9.4, z = 26.1 }, rot = { x = 0.0, y = 80.2, z = 0.0 }, level = 1 },
	{ config_id = 109, gadget_id = 70220013, pos = { x = 58.0, y = 9.4, z = 24.2 }, rot = { x = 0.0, y = 83.2, z = 0.0 }, level = 1 },
	{ config_id = 110, gadget_id = 70220013, pos = { x = 56.0, y = 9.4, z = 24.7 }, rot = { x = 0.0, y = 140.5, z = 0.0 }, level = 1 },
	{ config_id = 113, gadget_id = 70210022, pos = { x = 11.4, y = 13.2, z = 48.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, chest_drop_id = 1400302, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 114, gadget_id = 70220013, pos = { x = 18.4, y = 12.9, z = 33.6 }, rot = { x = 0.0, y = 243.9, z = 0.0 }, level = 1 },
	{ config_id = 115, gadget_id = 70220013, pos = { x = 15.3, y = 13.0, z = 33.3 }, rot = { x = 0.0, y = 332.8, z = 0.0 }, level = 1 },
	{ config_id = 116, gadget_id = 70220013, pos = { x = 17.0, y = 12.9, z = 31.8 }, rot = { x = 0.0, y = 228.2, z = 0.0 }, level = 1 },
	{ config_id = 117, gadget_id = 70220014, pos = { x = 16.7, y = 13.0, z = 34.0 }, rot = { x = 0.0, y = 347.8, z = 0.0 }, level = 1 },
	{ config_id = 124, gadget_id = 70310002, pos = { x = 105.8, y = -8.8, z = 14.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 125, gadget_id = 70310002, pos = { x = 105.8, y = -8.4, z = 60.7 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1 },
	{ config_id = 126, gadget_id = 70310002, pos = { x = 159.8, y = -12.4, z = 9.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 127, gadget_id = 70310002, pos = { x = 159.7, y = -12.0, z = 55.8 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1 },
	{ config_id = 128, gadget_id = 70310002, pos = { x = 231.4, y = -26.9, z = 9.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 129, gadget_id = 70310002, pos = { x = 231.3, y = -26.9, z = 55.1 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1 },
	{ config_id = 130, gadget_id = 70210012, pos = { x = 60.0, y = 9.5, z = 21.9 }, rot = { x = 0.0, y = 43.1, z = 0.0 }, level = 1, chest_drop_id = 1400301, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 131, gadget_id = 70310001, pos = { x = 3.5, y = 13.2, z = 40.5 }, rot = { x = 0.0, y = 2.2, z = 0.0 }, level = 1 },
	{ config_id = 165, gadget_id = 70220003, pos = { x = 33.2, y = 13.5, z = 70.6 }, rot = { x = 0.0, y = 1.9, z = 0.0 }, level = 1 },
	{ config_id = 166, gadget_id = 70220003, pos = { x = 30.4, y = 13.5, z = 64.8 }, rot = { x = 0.0, y = 274.7, z = 0.0 }, level = 1 },
	{ config_id = 167, gadget_id = 70220003, pos = { x = 30.5, y = 13.5, z = 68.5 }, rot = { x = 0.0, y = 289.2, z = 0.0 }, level = 1 },
	{ config_id = 168, gadget_id = 70220013, pos = { x = 49.8, y = 9.5, z = 66.2 }, rot = { x = 0.0, y = 91.1, z = 0.0 }, level = 1 },
	{ config_id = 169, gadget_id = 70220013, pos = { x = 51.9, y = 9.5, z = 66.3 }, rot = { x = 0.0, y = 151.1, z = 0.0 }, level = 1 },
	{ config_id = 170, gadget_id = 70220013, pos = { x = 54.7, y = 9.5, z = 66.0 }, rot = { x = 0.0, y = 288.8, z = 0.0 }, level = 1 },
	{ config_id = 171, gadget_id = 70210021, pos = { x = 197.9, y = -34.0, z = 25.5 }, rot = { x = 0.0, y = 202.0, z = 0.0 }, level = 1, chest_drop_id = 1400302, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST }
}

-- 区域
regions = {
	{ config_id = 11, shape = RegionShape.SPHERE, radius = 5, pos = { x = 30.0, y = 13.2, z = 56.0 } },
	{ config_id = 12, shape = RegionShape.SPHERE, radius = 5, pos = { x = 20.0, y = 13.0, z = 70.0 } },
	{ config_id = 13, shape = RegionShape.SPHERE, radius = 5, pos = { x = 20.0, y = 13.0, z = 70.0 } },
	{ config_id = 14, shape = RegionShape.SPHERE, radius = 5, pos = { x = 22.0, y = 13.0, z = 72.0 } },
	{ config_id = 35, shape = RegionShape.CUBIC, size = { x = 3.0, y = 5.0, z = 3.0 }, pos = { x = 0.5, y = 13.0, z = 58.5 } },
	{ config_id = 36, shape = RegionShape.SPHERE, radius = 5, pos = { x = 12.6, y = 13.4, z = 47.5 } },
	{ config_id = 41, shape = RegionShape.CUBIC, size = { x = 20.0, y = 20.0, z = 50.0 }, pos = { x = 179.0, y = -14.1, z = 32.5 } },
	{ config_id = 51, shape = RegionShape.SPHERE, radius = 5, pos = { x = 11.5, y = 13.4, z = 48.7 } },
	{ config_id = 52, shape = RegionShape.CUBIC, size = { x = 18.0, y = 5.0, z = 40.0 }, pos = { x = 57.0, y = 9.5, z = 40.7 } },
	{ config_id = 56, shape = RegionShape.CUBIC, size = { x = 15.0, y = 15.0, z = 40.0 }, pos = { x = 93.2, y = -7.7, z = 39.6 } },
	{ config_id = 57, shape = RegionShape.CUBIC, size = { x = 15.0, y = 15.0, z = 40.0 }, pos = { x = 151.5, y = -11.7, z = 33.7 } },
	{ config_id = 58, shape = RegionShape.CUBIC, size = { x = 15.0, y = 15.0, z = 40.0 }, pos = { x = 219.4, y = -23.6, z = 30.4 } },
	{ config_id = 59, shape = RegionShape.SPHERE, radius = 5, pos = { x = 61.0, y = 9.6, z = 37.5 } },
	{ config_id = 61, shape = RegionShape.SPHERE, radius = 5, pos = { x = 3.8, y = 13.2, z = 41.3 } },
	{ config_id = 68, shape = RegionShape.CUBIC, size = { x = 35.0, y = 5.0, z = 5.0 }, pos = { x = 11.2, y = 13.2, z = 51.8 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_11", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_11", action = "action_EVENT_ANY_MONSTER_DIE_11" },
	{ name = "GADGET_CREATE_12", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_12", action = "action_EVENT_GADGET_CREATE_12" },
	{ name = "SELECT_OPTION_13", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_13", action = "action_EVENT_SELECT_OPTION_13", trigger_count = 0 },
	{ name = "SELECT_OPTION_14", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_14", action = "action_EVENT_SELECT_OPTION_14" },
	{ name = "ENTER_REGION_35", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_35", action = "action_EVENT_ENTER_REGION_35" },
	{ name = "ANY_MONSTER_DIE_36", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_36", action = "action_EVENT_ANY_MONSTER_DIE_36" },
	{ name = "ENTER_REGION_41", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_41", action = "action_EVENT_ENTER_REGION_41" },
	{ name = "ANY_MONSTER_DIE_51", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_51", action = "action_EVENT_ANY_MONSTER_DIE_51" },
	{ name = "ENTER_REGION_52", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_52", action = "action_EVENT_ENTER_REGION_52" },
	{ name = "ENTER_REGION_56", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_56", action = "action_EVENT_ENTER_REGION_56" },
	{ name = "ENTER_REGION_57", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_57", action = "action_EVENT_ENTER_REGION_57" },
	{ name = "ENTER_REGION_58", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_58", action = "action_EVENT_ENTER_REGION_58" },
	{ name = "ANY_MONSTER_DIE_59", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_59", action = "action_EVENT_ANY_MONSTER_DIE_59" },
	{ name = "GADGET_CREATE_61", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_61", action = "action_EVENT_GADGET_CREATE_61" },
	{ name = "ENTER_REGION_68", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_68", action = "action_EVENT_ENTER_REGION_68" }
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
		monsters = { 25, 28, 45, 46, 75, 76 },
		gadgets = { 38, 64, 65, 67, 71, 72, 73, 108, 109, 110, 113, 114, 115, 116, 117, 124, 125, 126, 127, 128, 129, 130, 131, 165, 166, 167, 168, 169, 170, 171 },
		regions = { 11, 12, 13, 14, 35, 36, 41, 51, 52, 56, 57, 58, 59, 61, 68 },
		triggers = { "ANY_MONSTER_DIE_11", "GADGET_CREATE_12", "SELECT_OPTION_13", "SELECT_OPTION_14", "ENTER_REGION_35", "ANY_MONSTER_DIE_36", "ENTER_REGION_41", "ANY_MONSTER_DIE_51", "ENTER_REGION_52", "ENTER_REGION_56", "ENTER_REGION_57", "ENTER_REGION_58", "ANY_MONSTER_DIE_59", "GADGET_CREATE_61", "ENTER_REGION_68" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_11(context, evt)
	-- 判断剩余怪物数量是否是3
	if ScriptLib.GetGroupMonsterCount(context) ~= 3 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_11(context, evt)
	-- 将configid为 9 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 9, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_12(context, evt)
	if 12 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_12(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {1}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_13(context, evt)
	-- 判断是gadgetid 12
	if 12 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_13(context, evt)
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 10, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_14(context, evt)
	-- 判断是gadgetid 12
	if 12 ~= evt.param1 then
			return false
		end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_14(context, evt)
	-- 根据不同的选项做不同的操作
	if 1 == evt.param2 then
		if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 12, GadgetState.GearStart) then
			return -1
		end 
		return 0
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_35(context, evt)
	if evt.param1 ~= 35 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_35(context, evt)
	-- 延迟0.5秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 74, delay_time = 0.5 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_36(context, evt)
	-- 判断剩余怪物数量是否是3
	if ScriptLib.GetGroupMonsterCount(context) ~= 3 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_36(context, evt)
	-- 将configid为 11 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 11, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_41(context, evt)
	if evt.param1 ~= 41 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_41(context, evt)
	-- 调用提示id为 1042021 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1042021) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_51(context, evt)
	--判断死亡怪物的configid是否为 25
	if evt.param1 ~= 25 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_51(context, evt)
	-- 将configid为 113 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 113, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_52(context, evt)
	if evt.param1 ~= 52 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_52(context, evt)
	-- 将configid为 11 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 11, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 9 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 9, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_56(context, evt)
	if evt.param1 ~= 56 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_56(context, evt)
	-- 将configid为 124 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 124, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 125 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 125, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_57(context, evt)
	if evt.param1 ~= 57 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_57(context, evt)
	-- 将configid为 126 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 126, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 127 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 127, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_58(context, evt)
	if evt.param1 ~= 58 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_58(context, evt)
	-- 将configid为 128 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 128, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 129 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 129, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_59(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_59(context, evt)
	-- 将configid为 130 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 130, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 180 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 180, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_61(context, evt)
	if 131 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_61(context, evt)
	-- 将configid为 131 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 131, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_68(context, evt)
	if evt.param1 ~= 68 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_68(context, evt)
	-- 将configid为 10 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 10, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
