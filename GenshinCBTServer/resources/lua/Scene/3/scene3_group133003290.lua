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
	{ config_id = 3957, gadget_id = 70900042, pos = { x = 2856.2, y = 274.0, z = -1554.3 }, rot = { x = 349.8, y = 4.9, z = 22.8 }, level = 1 },
	{ config_id = 3958, gadget_id = 70220008, pos = { x = 2855.5, y = 275.7, z = -1554.5 }, rot = { x = 0.0, y = 169.9, z = 177.5 }, level = 1 },
	{ config_id = 3959, gadget_id = 70710002, pos = { x = 2856.1, y = 275.5, z = -1555.7 }, rot = { x = 0.0, y = 308.0, z = 0.0 }, level = 1, route_id = 3003224, save_route = true },
	{ config_id = 3960, gadget_id = 70210031, pos = { x = 2854.7, y = 274.8, z = -1556.3 }, rot = { x = 0.0, y = 316.7, z = 0.0 }, level = 1, chest_drop_id = 403343, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 493, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2855.1, y = 275.9, z = -1554.4 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_493", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "", action = "action_EVENT_ANY_GADGET_DIE_493" }
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
		gadgets = { 3957, 3958, 3959 },
		regions = { 493 },
		triggers = { "ANY_GADGET_DIE_493" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_493(context, evt)
	-- 设置移动平台路径
	if 0 ~= ScriptLib.SetPlatformRouteId(context, 3959, 3003225) then
	  return -1
	end
	
	-- 创建id为3960的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 3960 }) then
	  return -1
	end
	
	return 0
end
