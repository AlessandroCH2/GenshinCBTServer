--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1, monster_id = 20011501, pos = { x = 10.7, y = 42.0, z = 123.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 2, monster_id = 20011401, pos = { x = 10.0, y = 42.0, z = 121.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 5, monster_id = 20010601, pos = { x = 20.5, y = 42.0, z = 107.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 6, monster_id = 20010701, pos = { x = 20.7, y = 42.0, z = 103.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 7, monster_id = 22010301, pos = { x = 0.4, y = 42.0, z = 106.3 }, rot = { x = 0.0, y = 188.0, z = 0.0 }, level = 0, disableWander = true, affix = { 1001, 1002, 1003 } }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1, gadget_id = 70350006, pos = { x = 3.3, y = 42.1, z = 118.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3, gadget_id = 70900010, pos = { x = -2.0, y = 41.5, z = 100.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 12, gadget_id = 70350006, pos = { x = 15.8, y = 42.4, z = 106.2 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 1 },
	{ config_id = 13, gadget_id = 70350002, pos = { x = -1.9, y = 42.0, z = 78.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 14, gadget_id = 70360002, pos = { x = 1.1, y = 42.1, z = 75.7 }, rot = { x = 0.0, y = 95.4, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 7, shape = RegionShape.CUBIC, size = { x = 40.0, y = 10.0, z = 40.0 }, pos = { x = -1.7, y = 42.0, z = 106.7 } },
	{ config_id = 9, shape = RegionShape.SPHERE, radius = 5, pos = { x = 0.4, y = 41.9, z = 72.9 } },
	{ config_id = 10, shape = RegionShape.SPHERE, radius = 5, pos = { x = -4.2, y = 41.9, z = 71.7 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_7", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_7", action = "action_EVENT_ENTER_REGION_7" },
	{ name = "GADGET_CREATE_9", event = EventType.EVENT_GADGET_CREATE, source = "", condition = "condition_EVENT_GADGET_CREATE_9", action = "action_EVENT_GADGET_CREATE_9" },
	{ name = "SELECT_OPTION_10", event = EventType.EVENT_SELECT_OPTION, source = "", condition = "condition_EVENT_SELECT_OPTION_10", action = "action_EVENT_SELECT_OPTION_10" }
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
		monsters = { 1, 2, 5, 6, 7 },
		gadgets = { 1, 12, 13, 14 },
		regions = { 7, 9, 10 },
		triggers = { "ENTER_REGION_7", "GADGET_CREATE_9", "SELECT_OPTION_10" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

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
	-- 将configid为 12 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 12, GadgetState.GearStart) then
			return -1
		end 
	
	-- 通知groupid为220019001中,configid为：5的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 5, 220019001) then
	  return -1
	end
	
	-- 通知groupid为220019001中,configid为：6的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 6, 220019001) then
	  return -1
	end
	
	-- 将configid为 1 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1, GadgetState.GearStart) then
			return -1
		end 
	
	-- 通知groupid为220019001中,configid为：1的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 1, 220019001) then
	  return -1
	end
	
	-- 通知groupid为220019001中,configid为：2的怪物入战或者脱战，set为1是入战，为0是脱战
	if 0 ~= ScriptLib.SetMonsterBattleByGroup(context, 1, 2, 220019001) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_CREATE_9(context, evt)
	if 14 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_CREATE_9(context, evt)
	-- 设置操作台选项
	if 0 ~= ScriptLib.SetWorktopOptions(context, {1}) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_SELECT_OPTION_10(context, evt)
	-- 判断是gadgetid 14 option_id 1
	if 14 ~= evt.param1 then
		if 1 == evt.param2 then
			return false
		end
	end
	
	return true
end

-- 触发操作
function action_EVENT_SELECT_OPTION_10(context, evt)
	-- 将configid为 13 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 13, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end
