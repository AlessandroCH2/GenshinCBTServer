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
	{ config_id = 59, gadget_id = 70900201, pos = { x = -2.3, y = 1.0, z = -34.9 }, rot = { x = 0.0, y = 211.4, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 13, shape = RegionShape.SPHERE, radius = 12.5, pos = { x = 138.3, y = 60.6, z = -23.4 } },
	{ config_id = 14, shape = RegionShape.SPHERE, radius = 16.8, pos = { x = 2.2, y = 1.1, z = -37.4 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_13", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_13", action = "action_EVENT_ENTER_REGION_13" },
	{ name = "ENTER_REGION_14", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_14", action = "action_EVENT_ENTER_REGION_14" }
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
		gadgets = { },
		regions = { 13, 14 },
		triggers = { "ENTER_REGION_13", "ENTER_REGION_14" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_13(context, evt)
	if evt.param1 ~= 13 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_13(context, evt)
	-- 创生gadget 59
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 59 }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_14(context, evt)
	if evt.param1 ~= 14 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_14(context, evt)
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 240007006, monsters = {}, gadgets = {59} }) then
			return -1
		end
	
	return 0
end
