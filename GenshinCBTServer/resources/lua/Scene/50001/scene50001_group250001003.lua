--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 10, monster_id = 21030201, pos = { x = 123.4, y = 40.0, z = 126.2 }, rot = { x = 0.0, y = 265.8, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 11, monster_id = 21010501, pos = { x = 123.1, y = 43.0, z = 116.4 }, rot = { x = 0.0, y = 297.4, z = 0.0 }, level = 0, disableWander = true, pose_id = 32 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 11, gadget_id = 70220003, pos = { x = 82.1, y = 39.5, z = 120.2 }, rot = { x = 0.0, y = 273.3, z = 0.0 }, level = 1 },
	{ config_id = 12, gadget_id = 70220003, pos = { x = 81.7, y = 39.6, z = 115.8 }, rot = { x = 0.0, y = 273.3, z = 0.0 }, level = 1 },
	{ config_id = 13, gadget_id = 70220003, pos = { x = 83.3, y = 39.5, z = 113.4 }, rot = { x = 0.0, y = 273.3, z = 0.0 }, level = 1 },
	{ config_id = 14, gadget_id = 70220003, pos = { x = 83.8, y = 39.5, z = 117.7 }, rot = { x = 0.0, y = 273.3, z = 0.0 }, level = 1 },
	{ config_id = 15, gadget_id = 70320001, pos = { x = 101.8, y = 39.6, z = 121.0 }, rot = { x = 0.0, y = 82.2, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 16, gadget_id = 70210011, pos = { x = 162.9, y = 39.5, z = 127.6 }, rot = { x = 0.0, y = 265.1, z = 0.0 }, level = 1, chest_drop_id = 1300401, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 23, gadget_id = 70350002, pos = { x = 174.3, y = 41.6, z = 120.9 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 },
	{ config_id = 34, gadget_id = 70350002, pos = { x = 191.4, y = 58.4, z = 347.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 35, gadget_id = 70350003, pos = { x = 207.0, y = 57.0, z = 328.6 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 },
	{ config_id = 36, gadget_id = 70350003, pos = { x = 176.2, y = 56.8, z = 328.4 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 },
	{ config_id = 46, gadget_id = 70900205, pos = { x = 191.2, y = 48.5, z = 231.0 }, rot = { x = 0.0, y = 181.4, z = 0.0 }, level = 1 },
	{ config_id = 75, gadget_id = 70900025, pos = { x = 123.8, y = 39.3, z = 116.2 }, rot = { x = 0.0, y = 357.7, z = 0.0 }, level = 1 },
	{ config_id = 77, gadget_id = 70320001, pos = { x = 148.4, y = 39.6, z = 121.0 }, rot = { x = 0.0, y = 358.4, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 23, shape = RegionShape.CUBIC, size = { x = 15.0, y = 10.0, z = 20.0 }, pos = { x = 148.2, y = 39.6, z = 121.0 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_23", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_23", action = "action_EVENT_ENTER_REGION_23" }
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
		monsters = { 10, 11 },
		gadgets = { 11, 12, 13, 14, 15, 16, 23, 34, 35, 36, 46, 75, 77 },
		regions = { 23 },
		triggers = { "ENTER_REGION_23" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_23(context, evt)
	if evt.param1 ~= 23 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_23(context, evt)
	-- 将configid为 77 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 77, GadgetState.GearStart) then
			return -1
		end 
	
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 250001007, suite = 1 }) then
			return -1
		end
	
	return 0
end
