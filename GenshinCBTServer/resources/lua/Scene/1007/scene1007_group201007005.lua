--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 16, monster_id = 23040101, pos = { x = 147.6, y = 34.5, z = 168.8 }, rot = { x = 0.0, y = 270.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 17, monster_id = 23040101, pos = { x = 143.5, y = 34.5, z = 186.1 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 18, monster_id = 23040101, pos = { x = 130.4, y = 34.5, z = 186.1 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 19, monster_id = 23040101, pos = { x = 115.6, y = 34.5, z = 185.8 }, rot = { x = 0.0, y = 180.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 20, monster_id = 23040101, pos = { x = 144.1, y = 34.5, z = 151.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 21, monster_id = 23040101, pos = { x = 131.8, y = 34.5, z = 150.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 22, monster_id = 23040101, pos = { x = 116.5, y = 34.5, z = 151.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 12, gadget_id = 70350002, pos = { x = 92.5, y = 38.4, z = 169.0 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 7, shape = RegionShape.SPHERE, radius = 10.19, pos = { x = 48.8, y = 36.2, z = 170.2 } },
	{ config_id = 8, shape = RegionShape.SPHERE, radius = 5, pos = { x = 104.6, y = 38.5, z = 169.0 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_7", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_7", action = "action_EVENT_ENTER_REGION_7", trigger_count = 0 },
	{ name = "ENTER_REGION_8", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_8", action = "action_EVENT_ENTER_REGION_8" }
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
		monsters = { 16 },
		gadgets = { },
		regions = { },
		triggers = { },
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
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_8(context, evt)
	if evt.param1 ~= 8 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_8(context, evt)
	-- 将configid为 12 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 12, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
