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
	{ config_id = 2887, gadget_id = 70210021, pos = { x = 1728.6, y = 236.8, z = -1156.4 }, rot = { x = 10.3, y = 314.8, z = 0.0 }, level = 1, chest_drop_id = 403302, isOneoff = true, persistent = true },
	{ config_id = 2888, gadget_id = 70220021, pos = { x = 1729.5, y = 236.4, z = -1157.6 }, rot = { x = 0.0, y = 211.2, z = 3.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 423, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1727.7, y = 238.2, z = -1155.1 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_423", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_423", action = "action_EVENT_ANY_GADGET_DIE_423" }
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
		gadgets = { 2888 },
		regions = { 423 },
		triggers = { "ANY_GADGET_DIE_423" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_423(context, evt)
	if 2888 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_423(context, evt)
	-- 创建id为2887的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2887 }) then
	  return -1
	end
	
	return 0
end
