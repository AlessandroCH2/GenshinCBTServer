--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 27, gadget_id = 70900008, pos = { x = 442.4, y = -5.6, z = 111.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 39, gadget_id = 70350002, pos = { x = 463.9, y = -9.6, z = 120.8 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 147, gadget_id = 70310002, pos = { x = 432.3, y = -14.4, z = 126.1 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1 },
	{ config_id = 148, gadget_id = 70310002, pos = { x = 432.7, y = -14.4, z = 117.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 149, gadget_id = 70310002, pos = { x = 432.8, y = -19.0, z = 126.1 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1 },
	{ config_id = 150, gadget_id = 70310002, pos = { x = 431.9, y = -18.7, z = 117.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 173, gadget_id = 70210022, pos = { x = 445.5, y = -9.3, z = 133.0 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1, chest_drop_id = 1400302, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 174, gadget_id = 70210022, pos = { x = 456.3, y = -9.3, z = 132.8 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 1, chest_drop_id = 1400302, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 175, gadget_id = 70210022, pos = { x = 456.4, y = -9.3, z = 110.6 }, rot = { x = 0.0, y = 6.2, z = 0.0 }, level = 1, chest_drop_id = 1400302, state = GadgetState.ChestLocked, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST }
}

-- 区域
regions = {
	{ config_id = 70, shape = RegionShape.SPHERE, radius = 5, pos = { x = 421.7, y = -24.3, z = 120.5 } },
	{ config_id = 76, shape = RegionShape.SPHERE, radius = 5, pos = { x = 450.8, y = -9.3, z = 123.0 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_70", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_70", action = "action_EVENT_ENTER_REGION_70" },
	{ name = "GADGET_STATE_CHANGE_76", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_76", action = "action_EVENT_GADGET_STATE_CHANGE_76" }
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
		gadgets = { 27, 39, 147, 148, 149, 150, 173, 174, 175 },
		regions = { 70, 76 },
		triggers = { "ENTER_REGION_70", "GADGET_STATE_CHANGE_76" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_70(context, evt)
	if evt.param1 ~= 70 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_70(context, evt)
	-- 将configid为 147 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 147, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 148 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 148, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 149 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 149, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 150 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 150, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_76(context, evt)
	if 27 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_76(context, evt)
	-- 将configid为 173 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 173, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 174 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 174, GadgetState.Default) then
			return -1
		end 
	
	-- 将configid为 175 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 175, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
