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
	{ config_id = 2007, gadget_id = 70220021, pos = { x = 2013.3, y = 209.3, z = -1423.5 }, rot = { x = 13.2, y = 176.2, z = 1.1 }, level = 1 },
	{ config_id = 2086, gadget_id = 70210011, pos = { x = 2013.2, y = 210.0, z = -1424.1 }, rot = { x = 0.0, y = 341.2, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true, persistent = true }
}

-- 区域
regions = {
	{ config_id = 425, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2011.6, y = 212.7, z = -1424.7 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_425", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_425", action = "action_EVENT_ANY_GADGET_DIE_425" }
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
		gadgets = { 2007 },
		regions = { 425 },
		triggers = { "ANY_GADGET_DIE_425" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_425(context, evt)
	if 2007 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_425(context, evt)
	-- 创建id为2086的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2086 }) then
	  return -1
	end
	
	return 0
end
