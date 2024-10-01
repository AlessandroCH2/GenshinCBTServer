--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 1054, monster_id = 20010501, pos = { x = 2664.7, y = 236.1, z = -1168.6 }, rot = { x = 0.0, y = 289.2, z = 0.0 }, level = 10, drop_id = 303042, disableWander = true },
	{ config_id = 1055, monster_id = 20010501, pos = { x = 2664.4, y = 236.1, z = -1170.1 }, rot = { x = 0.0, y = 280.8, z = 0.0 }, level = 10, drop_id = 303042, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 3308, gadget_id = 70290010, pos = { x = 2665.4, y = 236.2, z = -1169.5 }, rot = { x = 0.0, y = 137.2, z = 0.0 }, level = 1 },
	{ config_id = 3309, gadget_id = 70500000, pos = { x = 2665.4, y = 236.2, z = -1169.5 }, rot = { x = 0.0, y = 137.2, z = 0.0 }, level = 1, point_type = 3006, owner = 3308 }
}

-- 区域
regions = {
	{ config_id = 250, shape = RegionShape.SPHERE, radius = 3, pos = { x = 2665.2, y = 236.3, z = -1169.6 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_250", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_250", action = "action_EVENT_ENTER_REGION_250" }
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
		gadgets = { 3308, 3309 },
		regions = { 250 },
		triggers = { "ENTER_REGION_250" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_250(context, evt)
	if evt.param1 ~= 250 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_250(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1054, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 1055, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end
