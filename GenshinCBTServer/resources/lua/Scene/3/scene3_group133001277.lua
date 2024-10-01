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
	{ config_id = 2369, gadget_id = 70210021, pos = { x = 2151.8, y = 199.5, z = -1742.8 }, rot = { x = 0.0, y = 211.4, z = 0.0 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true },
	{ config_id = 2370, gadget_id = 70220021, pos = { x = 2152.0, y = 198.9, z = -1743.6 }, rot = { x = 0.0, y = 280.7, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 424, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2151.4, y = 200.5, z = -1742.5 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_424", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_424", action = "action_EVENT_ANY_GADGET_DIE_424" }
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
		gadgets = { 2370 },
		regions = { 424 },
		triggers = { "ANY_GADGET_DIE_424" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_424(context, evt)
	if 2370 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_424(context, evt)
	-- 创建id为2369的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2369 }) then
	  return -1
	end
	
	return 0
end
