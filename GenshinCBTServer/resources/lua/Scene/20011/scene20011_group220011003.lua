--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 16, monster_id = 21010401, pos = { x = 489.0, y = -24.1, z = 127.0 }, rot = { x = 0.0, y = 240.0, z = 0.0 }, level = 1, drop_id = 1100309, pose_id = 402 },
	{ config_id = 17, monster_id = 21010401, pos = { x = 488.5, y = -23.4, z = 116.2 }, rot = { x = 0.0, y = 305.5, z = 0.0 }, level = 1, drop_id = 1100309, pose_id = 402 },
	{ config_id = 18, monster_id = 20011101, pos = { x = 486.6, y = -23.6, z = 120.9 }, rot = { x = 0.0, y = 269.3, z = 0.0 }, level = 1, drop_id = 1100309, disableWander = true, affix = { 1002 }, isElite = true },
	{ config_id = 19, monster_id = 21010401, pos = { x = 489.8, y = -22.9, z = 121.2 }, rot = { x = 0.0, y = 280.5, z = 0.0 }, level = 1, drop_id = 1100309, pose_id = 402 },
	{ config_id = 21, monster_id = 21010201, pos = { x = 480.1, y = -22.9, z = 126.7 }, rot = { x = 0.0, y = 140.1, z = 0.0 }, level = 1, drop_id = 1100309 },
	{ config_id = 22, monster_id = 21010201, pos = { x = 481.1, y = -22.9, z = 116.1 }, rot = { x = 0.0, y = 53.7, z = 0.0 }, level = 1, drop_id = 1100309 },
	{ config_id = 23, monster_id = 21010201, pos = { x = 492.0, y = -23.0, z = 116.6 }, rot = { x = 0.0, y = 298.0, z = 0.0 }, level = 1, drop_id = 1100309 },
	{ config_id = 24, monster_id = 21010201, pos = { x = 492.0, y = -23.0, z = 126.5 }, rot = { x = 0.0, y = 225.3, z = 0.0 }, level = 1, drop_id = 1100309, isElite = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 18, gadget_id = 70350002, pos = { x = 463.7, y = -9.5, z = 120.9 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 },
	{ config_id = 19, gadget_id = 70350002, pos = { x = 500.9, y = -23.2, z = 121.6 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 50, gadget_id = 70310001, pos = { x = 460.1, y = -7.3, z = 126.8 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 51, gadget_id = 70310001, pos = { x = 460.1, y = -7.2, z = 115.1 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 52, gadget_id = 70310002, pos = { x = 498.7, y = -18.6, z = 127.4 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 53, gadget_id = 70310002, pos = { x = 498.7, y = -18.5, z = 116.0 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 63, gadget_id = 70310002, pos = { x = 430.3, y = -13.3, z = 128.5 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 64, gadget_id = 70310002, pos = { x = 430.3, y = -13.4, z = 114.7 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 65, gadget_id = 70310002, pos = { x = 430.3, y = -19.4, z = 128.5 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 66, gadget_id = 70310002, pos = { x = 430.3, y = -19.4, z = 114.7 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 95, gadget_id = 70900202, pos = { x = 511.9, y = -24.3, z = 121.7 }, rot = { x = 0.0, y = 48.8, z = 0.0 }, level = 1 },
	{ config_id = 96, gadget_id = 70900202, pos = { x = 532.8, y = -23.3, z = 123.1 }, rot = { x = 0.0, y = 215.6, z = 0.0 }, level = 1 },
	{ config_id = 127, gadget_id = 70220013, pos = { x = 458.4, y = -9.4, z = 111.8 }, rot = { x = 0.0, y = 147.1, z = 0.0 }, level = 1 },
	{ config_id = 128, gadget_id = 70220013, pos = { x = 455.7, y = -9.3, z = 111.3 }, rot = { x = 0.0, y = 241.3, z = 0.0 }, level = 1 },
	{ config_id = 129, gadget_id = 70220013, pos = { x = 453.3, y = -9.3, z = 110.2 }, rot = { x = 0.0, y = 163.6, z = 0.0 }, level = 1 },
	{ config_id = 130, gadget_id = 70220013, pos = { x = 459.2, y = -9.3, z = 109.2 }, rot = { x = 0.0, y = 239.0, z = 0.0 }, level = 1 },
	{ config_id = 131, gadget_id = 70210021, pos = { x = 456.4, y = -9.3, z = 107.8 }, rot = { x = 0.0, y = 245.9, z = 0.0 }, level = 1, chest_drop_id = 1100302, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 132, gadget_id = 70220014, pos = { x = 455.0, y = -9.4, z = 109.3 }, rot = { x = 0.0, y = 299.3, z = 0.0 }, level = 1 },
	{ config_id = 133, gadget_id = 70220014, pos = { x = 456.5, y = -9.3, z = 113.2 }, rot = { x = 0.0, y = 34.8, z = 0.0 }, level = 1 },
	{ config_id = 134, gadget_id = 70220014, pos = { x = 454.4, y = -9.4, z = 110.9 }, rot = { x = 0.0, y = 48.8, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 11, shape = RegionShape.SPHERE, radius = 7.3, pos = { x = 435.2, y = -7.7, z = 121.1 } },
	{ config_id = 12, shape = RegionShape.SPHERE, radius = 5, pos = { x = 487.7, y = -22.8, z = 119.2 } },
	{ config_id = 22, shape = RegionShape.SPHERE, radius = 5, pos = { x = 486.7, y = -23.0, z = 120.2 } },
	{ config_id = 26, shape = RegionShape.CUBIC, size = { x = 10.0, y = 8.0, z = 15.0 }, pos = { x = 505.9, y = -22.5, z = 121.3 } },
	{ config_id = 40, shape = RegionShape.SPHERE, radius = 5, pos = { x = 422.8, y = -24.3, z = 120.5 } },
	{ config_id = 41, shape = RegionShape.CUBIC, size = { x = 15.0, y = 3.0, z = 15.0 }, pos = { x = 427.0, y = -17.0, z = 121.8 } },
	{ config_id = 66, shape = RegionShape.SPHERE, radius = 5, pos = { x = 493.9, y = -23.4, z = 122.0 } },
	{ config_id = 67, shape = RegionShape.SPHERE, radius = 5, pos = { x = 489.3, y = -23.4, z = 122.1 } },
	{ config_id = 68, shape = RegionShape.SPHERE, radius = 5, pos = { x = 483.6, y = -23.4, z = 123.2 } },
	{ config_id = 69, shape = RegionShape.SPHERE, radius = 5, pos = { x = 483.2, y = -23.4, z = 124.9 } },
	{ config_id = 70, shape = RegionShape.SPHERE, radius = 5, pos = { x = 493.2, y = -23.4, z = 119.5 } },
	{ config_id = 71, shape = RegionShape.SPHERE, radius = 5, pos = { x = 487.2, y = -23.4, z = 111.5 } },
	{ config_id = 72, shape = RegionShape.SPHERE, radius = 5, pos = { x = 493.1, y = -23.1, z = 110.6 } },
	{ config_id = 73, shape = RegionShape.SPHERE, radius = 5, pos = { x = 486.6, y = -23.4, z = 112.3 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_11", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_11", action = "action_EVENT_ENTER_REGION_11" },
	{ name = "VARIABLE_CHANGE_12", event = EventType.EVENT_VARIABLE_CHANGE, source = "", condition = "condition_EVENT_VARIABLE_CHANGE_12", action = "action_EVENT_VARIABLE_CHANGE_12" },
	{ name = "ANY_MONSTER_DIE_22", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_22", action = "action_EVENT_ANY_MONSTER_DIE_22" },
	{ name = "ENTER_REGION_26", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_26", action = "action_EVENT_ENTER_REGION_26" },
	{ name = "ENTER_REGION_40", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_40", action = "action_EVENT_ENTER_REGION_40" },
	{ name = "ENTER_REGION_41", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_41", action = "action_EVENT_ENTER_REGION_41" },
	{ name = "ANY_MONSTER_DIE_66", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_66", action = "action_EVENT_ANY_MONSTER_DIE_66" },
	{ name = "ANY_MONSTER_DIE_67", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_67", action = "action_EVENT_ANY_MONSTER_DIE_67" },
	{ name = "ANY_MONSTER_DIE_68", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_68", action = "action_EVENT_ANY_MONSTER_DIE_68" },
	{ name = "ANY_MONSTER_DIE_69", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_69", action = "action_EVENT_ANY_MONSTER_DIE_69" },
	{ name = "ANY_MONSTER_DIE_70", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_70", action = "action_EVENT_ANY_MONSTER_DIE_70" },
	{ name = "ANY_MONSTER_DIE_71", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_71", action = "action_EVENT_ANY_MONSTER_DIE_71" },
	{ name = "ANY_MONSTER_DIE_72", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_72", action = "action_EVENT_ANY_MONSTER_DIE_72" },
	{ name = "ANY_MONSTER_DIE_73", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_73", action = "action_EVENT_ANY_MONSTER_DIE_73" }
}

-- 变量
variables = {
	{ name = "Key", value = 0, persistent = false }
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
		monsters = { 16, 17, 18, 19 },
		gadgets = { 18, 19, 50, 51, 52, 53, 63, 64, 65, 66, 127, 128, 129, 130, 131, 132, 133, 134 },
		regions = { 11, 12, 22, 26, 40, 41, 66, 67, 68, 69, 70, 71, 72, 73 },
		triggers = { "ENTER_REGION_11", "VARIABLE_CHANGE_12", "ANY_MONSTER_DIE_22", "ENTER_REGION_26", "ENTER_REGION_40", "ENTER_REGION_41", "ANY_MONSTER_DIE_66", "ANY_MONSTER_DIE_67", "ANY_MONSTER_DIE_68", "ANY_MONSTER_DIE_69", "ANY_MONSTER_DIE_70", "ANY_MONSTER_DIE_71", "ANY_MONSTER_DIE_72", "ANY_MONSTER_DIE_73" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_11(context, evt)
	if evt.param1 ~= 11 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_11(context, evt)
	-- 将configid为 18 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 18, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 50 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 50, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 51 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 51, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_VARIABLE_CHANGE_12(context, evt)
	-- 判断变量"Key"为8
	if ScriptLib.GetGroupVariableValue(context, "Key") ~= 8 then
			return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_VARIABLE_CHANGE_12(context, evt)
	-- 将configid为 19 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 19, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 52 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 52, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 53 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 53, GadgetState.GearStart) then
			return -1
		end 
	
	-- 创生gadget 95
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 95 }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_22(context, evt)
	-- 判断剩余怪物数量是否是1
	if ScriptLib.GetGroupMonsterCount(context) ~= 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_22(context, evt)
	-- 调用提示id为 1037001 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1037001) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_26(context, evt)
	if evt.param1 ~= 26 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_26(context, evt)
	-- 调用提示id为 1041022 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 1041022) then
		return -1
	end
	
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 220011003, monsters = {}, gadgets = {95} }) then
			return -1
		end
	
	-- 创生gadget 96
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 96 }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_40(context, evt)
	if evt.param1 ~= 40 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_40(context, evt)
	-- 将configid为 65 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 65, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 66 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 66, GadgetState.GearStart) then
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
	-- 将configid为 63 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 63, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 64 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 64, GadgetState.GearStart) then
			return -1
		end 
	
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 220011002, monsters = {}, gadgets = {94} }) then
			return -1
		end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_66(context, evt)
	--判断死亡怪物的configid是否为 21
	if evt.param1 ~= 21 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_66(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_67(context, evt)
	if 22 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_67(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_68(context, evt)
	if 23 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_68(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_69(context, evt)
	if 24 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_69(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_70(context, evt)
	--判断死亡怪物的configid是否为 17
	if evt.param1 ~= 17 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_70(context, evt)
	-- 延迟1秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 22, delay_time = 1 }) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_71(context, evt)
	--判断死亡怪物的configid是否为 16
	if evt.param1 ~= 16 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_71(context, evt)
	-- 延迟1秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 21, delay_time = 1 }) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_72(context, evt)
	--判断死亡怪物的configid是否为 19
	if evt.param1 ~= 19 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_72(context, evt)
	-- 延迟1秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 23, delay_time = 1 }) then
	  return -1
	end
	
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	-- 延迟1秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 24, delay_time = 1 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_73(context, evt)
	--判断死亡怪物的configid是否为 18
	if evt.param1 ~= 18 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_73(context, evt)
	-- 针对当前group内变量名为 "Key" 的变量，进行修改，变化值为 1
	if 0 ~= ScriptLib.ChangeGroupVariableValue(context, "Key", 1) then
	  return -1
	end
	
	return 0
end
