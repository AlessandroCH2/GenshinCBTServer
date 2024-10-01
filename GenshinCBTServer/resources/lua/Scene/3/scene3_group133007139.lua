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
	{ config_id = 472, gadget_id = 70210021, pos = { x = 2901.2, y = 215.7, z = 324.1 }, rot = { x = 0.0, y = 241.9, z = 0.0 }, level = 1, chest_drop_id = 403325, isOneoff = true, persistent = true },
	{ config_id = 473, gadget_id = 70220021, pos = { x = 2902.3, y = 215.4, z = 326.1 }, rot = { x = 8.8, y = 180.4, z = 3.4 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 254, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2899.3, y = 216.2, z = 323.6 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_254", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_254", action = "action_EVENT_ANY_GADGET_DIE_254", tlog_tag = "风龙_139_碎石堆宝箱_成功" }
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
		gadgets = { 473 },
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
	if 473 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_254(context, evt)
	-- 创建id为472的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 472 }) then
	  return -1
	end
	
	return 0
end
