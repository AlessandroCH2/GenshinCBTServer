--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 16, monster_id = 22010101, pos = { x = 343.2, y = -18.9, z = 343.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 17, monster_id = 21010701, pos = { x = 352.3, y = -19.0, z = 331.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 18, monster_id = 21010701, pos = { x = 343.0, y = -18.4, z = 332.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 19, monster_id = 21010701, pos = { x = 333.9, y = -19.2, z = 331.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 20, monster_id = 20011201, pos = { x = 350.9, y = -18.9, z = 342.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 21, monster_id = 20011201, pos = { x = 336.9, y = -18.9, z = 349.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 22, monster_id = 22010201, pos = { x = 343.2, y = -18.9, z = 343.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 23, monster_id = 20010801, pos = { x = 350.0, y = -18.9, z = 340.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 24, monster_id = 20010801, pos = { x = 337.2, y = -18.9, z = 347.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 25, monster_id = 21010401, pos = { x = 358.1, y = -14.2, z = 336.3 }, rot = { x = 0.0, y = 327.9, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 26, monster_id = 21010401, pos = { x = 358.4, y = -16.9, z = 339.4 }, rot = { x = 0.0, y = 323.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 27, monster_id = 20010601, pos = { x = 347.2, y = -18.9, z = 342.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 28, monster_id = 20010701, pos = { x = 337.8, y = -18.9, z = 343.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 29, monster_id = 20010501, pos = { x = 348.1, y = -18.9, z = 348.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 30, monster_id = 20010501, pos = { x = 336.5, y = -18.9, z = 338.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 14, gadget_id = 70350003, pos = { x = 353.2, y = -18.6, z = 322.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 15, gadget_id = 70350003, pos = { x = 343.2, y = -18.4, z = 322.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 16, gadget_id = 70350003, pos = { x = 333.3, y = -18.5, z = 322.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 207, gadget_id = 70220005, pos = { x = 357.4, y = -19.4, z = 350.5 }, rot = { x = 0.0, y = 29.7, z = 0.0 }, level = 1 },
	{ config_id = 211, gadget_id = 70220005, pos = { x = 360.5, y = -14.3, z = 336.7 }, rot = { x = 0.0, y = 146.3, z = 0.0 }, level = 1 },
	{ config_id = 212, gadget_id = 70210031, pos = { x = 366.1, y = -14.3, z = 332.6 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1, chest_drop_id = 1400401, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 213, gadget_id = 70220004, pos = { x = 357.3, y = -19.3, z = 346.4 }, rot = { x = 0.0, y = 119.2, z = 0.0 }, level = 3 },
	{ config_id = 214, gadget_id = 70220004, pos = { x = 358.3, y = -16.9, z = 344.4 }, rot = { x = 0.0, y = 131.0, z = 0.0 }, level = 3 },
	{ config_id = 215, gadget_id = 70220004, pos = { x = 358.2, y = -16.9, z = 340.8 }, rot = { x = 0.0, y = 339.0, z = 0.0 }, level = 3 },
	{ config_id = 216, gadget_id = 70220004, pos = { x = 357.9, y = -16.9, z = 338.4 }, rot = { x = 0.0, y = 266.0, z = 0.0 }, level = 3 },
	{ config_id = 217, gadget_id = 70220004, pos = { x = 357.9, y = -14.3, z = 337.3 }, rot = { x = 0.0, y = 91.7, z = 0.0 }, level = 3 },
	{ config_id = 218, gadget_id = 70220005, pos = { x = 357.3, y = -19.3, z = 345.5 }, rot = { x = 0.0, y = 21.3, z = 0.0 }, level = 1 },
	{ config_id = 251, gadget_id = 70310001, pos = { x = 362.0, y = -14.3, z = 336.5 }, rot = { x = 0.0, y = 17.8, z = 0.0 }, level = 1 },
	{ config_id = 282, gadget_id = 70310001, pos = { x = 358.6, y = -16.9, z = 354.6 }, rot = { x = 0.0, y = 17.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 283, gadget_id = 70310001, pos = { x = 358.6, y = -16.9, z = 350.2 }, rot = { x = 0.0, y = 17.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 284, gadget_id = 70310001, pos = { x = 358.6, y = -16.9, z = 345.2 }, rot = { x = 0.0, y = 17.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 285, gadget_id = 70310001, pos = { x = 358.7, y = -16.9, z = 340.3 }, rot = { x = 0.0, y = 17.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 286, gadget_id = 70310001, pos = { x = 358.7, y = -14.3, z = 335.2 }, rot = { x = 0.0, y = 17.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 287, gadget_id = 70310001, pos = { x = 358.8, y = -14.3, z = 330.2 }, rot = { x = 0.0, y = 17.8, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 6, shape = RegionShape.SPHERE, radius = 5, pos = { x = 343.4, y = -18.9, z = 346.3 } },
	{ config_id = 7, shape = RegionShape.SPHERE, radius = 49.11, pos = { x = 342.5, y = -18.9, z = 315.0 } },
	{ config_id = 66, shape = RegionShape.SPHERE, radius = 5, pos = { x = 360.4, y = -14.3, z = 333.5 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_6", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_6", action = "action_EVENT_ANY_MONSTER_DIE_6" },
	{ name = "ENTER_REGION_7", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_7", action = "action_EVENT_ENTER_REGION_7", trigger_count = 0 },
	{ name = "CLIENT_EXECUTE_66", event = EventType.EVENT_CLIENT_EXECUTE, source = "FireSourceChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_66", trigger_count = 0 }
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
		monsters = { 16, 17, 18, 19, 20, 21 },
		gadgets = { 14, 15, 16, 212, 251 },
		regions = { 6, 7, 66 },
		triggers = { "ANY_MONSTER_DIE_6", "ENTER_REGION_7", "CLIENT_EXECUTE_66" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { 22, 23, 24, 25, 26 },
		gadgets = { 14, 15, 16, 212, 213, 214, 215, 216, 217, 218, 251 },
		regions = { 6, 7, 66 },
		triggers = { "ANY_MONSTER_DIE_6", "ENTER_REGION_7", "CLIENT_EXECUTE_66" },
		rand_weight = 100
	},
	{
		-- suite_id = 2,
		-- description = suite_3,
		monsters = { 27, 28, 29, 30 },
		gadgets = { 14, 15, 16, 212, 251 },
		regions = { 6, 7, 66 },
		triggers = { "ANY_MONSTER_DIE_6", "ENTER_REGION_7", "CLIENT_EXECUTE_66" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

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
	-- 将configid为 14 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 14, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 15 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 15, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 16 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 16, GadgetState.GearStart) then
			return -1
		end 
	
	-- 调用提示id为 10050701 的提示UI，会显示在屏幕中央偏下位置，id索引自 ReminderData表格
	if 0 ~= ScriptLib.ShowReminder(context, 10050701) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_7(context, evt)
	if evt.param1 ~= 7 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_7(context, evt)
	-- 将configid为 8 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 8, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 9 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 9, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 10 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 10, GadgetState.Default) then
			return -1
		end 
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_66(context, evt)
	-- 针对groupid为 220013003 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
		if evt.param1 == 1 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 220013003, this_gadget, GadgetState.GearStart )
			return 0
		end
	
		if evt.param1 == 0 then
			ScriptLib.SetGroupGadgetStateByConfigId(context, 220013003, this_gadget, GadgetState.Default )
			return 0
		end
	
	return 0
end
