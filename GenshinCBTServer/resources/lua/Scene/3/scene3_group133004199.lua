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
	{ config_id = 1149, gadget_id = 70210011, pos = { x = 2684.8, y = 251.0, z = -369.8 }, rot = { x = 0.0, y = 0.0, z = 15.1 }, level = 1, chest_drop_id = 403303, isOneoff = true, type = GadgetType.GADGET_WORLD_CHECT },
	{ config_id = 1150, gadget_id = 70220024, pos = { x = 2683.6, y = 249.3, z = -369.3 }, rot = { x = 0.0, y = 170.2, z = 350.6 }, level = 1 },
	{ config_id = 1341, gadget_id = 70500000, pos = { x = 2691.0, y = 253.8, z = -372.9 }, rot = { x = 0.0, y = 5.4, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 254, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2685.9, y = 251.5, z = -368.3 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_254", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_254", action = "action_EVENT_ANY_GADGET_DIE_254" }
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
		gadgets = { 1150, 1341 },
		regions = { 254 },
		triggers = { "ANY_GADGET_DIE_254" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_254(context, evt)
	if 1150 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_254(context, evt)
	-- 创建id为1149的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1149 }) then
	  return -1
	end
	
	return 0
end
