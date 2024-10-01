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
	{ config_id = 462, gadget_id = 70210021, pos = { x = 3036.2, y = 212.3, z = 161.5 }, rot = { x = 0.0, y = 288.0, z = 0.0 }, level = 1, chest_drop_id = 403325, isOneoff = true, persistent = true },
	{ config_id = 463, gadget_id = 70220021, pos = { x = 3035.7, y = 212.0, z = 163.0 }, rot = { x = 0.0, y = 76.6, z = 11.6 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 253, shape = RegionShape.SPHERE, radius = 5, pos = { x = 3034.2, y = 212.8, z = 162.9 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_253", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_253", action = "action_EVENT_ANY_GADGET_DIE_253", tlog_tag = "风龙_135_碎石堆宝箱_成功" }
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
		gadgets = { 463 },
		regions = { 253 },
		triggers = { "ANY_GADGET_DIE_253" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_253(context, evt)
	if 463 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_253(context, evt)
	-- 创建id为462的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 462 }) then
	  return -1
	end
	
	return 0
end
