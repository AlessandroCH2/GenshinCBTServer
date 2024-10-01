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
	{ config_id = 2561, gadget_id = 70710002, pos = { x = 2307.7, y = 250.7, z = -1471.5 }, rot = { x = 0.0, y = 149.0, z = 0.0 }, level = 1, route_id = 124, save_route = true },
	{ config_id = 2635, gadget_id = 70210031, pos = { x = 2410.2, y = 257.3, z = -1337.8 }, rot = { x = 0.0, y = 205.2, z = 0.0 }, level = 1, chest_drop_id = 403222, isOneoff = true },
	{ config_id = 2830, gadget_id = 70220021, pos = { x = 2410.7, y = 254.4, z = -1337.8 }, rot = { x = 342.6, y = 121.0, z = 353.1 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 100, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2307.5, y = 249.3, z = -1471.2 } },
	{ config_id = 144, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2413.7, y = 257.1, z = -1341.3 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_100", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_100", action = "action_EVENT_ENTER_REGION_100", tlog_tag = "神殿_精灵草_去碎石_开始" },
	{ name = "ANY_GADGET_DIE_144", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_144", action = "action_EVENT_ANY_GADGET_DIE_144", tlog_tag = "神殿_精灵草_去碎石_结束" }
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
	rand_suite = false,
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
		gadgets = { 2561, 2830 },
		regions = { 100, 144 },
		triggers = { "ENTER_REGION_100", "ANY_GADGET_DIE_144" },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
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
function condition_EVENT_ENTER_REGION_100(context, evt)
	if evt.param1 ~= 100 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_100(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 2561, 125) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_144(context, evt)
	if 2830 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_144(context, evt)
	-- 创建id为2635的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2635 }) then
	  return -1
	end
	
	return 0
end
