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
	{ config_id = 2889, gadget_id = 70210021, pos = { x = 1662.9, y = 238.6, z = -1219.8 }, rot = { x = 2.4, y = 272.4, z = 3.4 }, level = 1, chest_drop_id = 403302, isOneoff = true, persistent = true },
	{ config_id = 2890, gadget_id = 70220021, pos = { x = 1663.7, y = 236.9, z = -1218.9 }, rot = { x = 0.0, y = 211.2, z = 3.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 422, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1656.2, y = 237.2, z = -1221.0 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_422", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_422", action = "action_EVENT_ANY_GADGET_DIE_422" }
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
		gadgets = { 2890 },
		regions = { 422 },
		triggers = { "ANY_GADGET_DIE_422" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_422(context, evt)
	if 2890 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_422(context, evt)
	-- 创建id为2889的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2889 }) then
	  return -1
	end
	
	return 0
end
