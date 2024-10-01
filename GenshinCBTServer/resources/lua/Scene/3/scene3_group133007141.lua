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
	{ config_id = 479, gadget_id = 70210021, pos = { x = 2754.4, y = 211.2, z = 346.8 }, rot = { x = 0.0, y = 51.0, z = 0.0 }, level = 1, chest_drop_id = 403325, isOneoff = true, persistent = true },
	{ config_id = 480, gadget_id = 70220021, pos = { x = 2753.1, y = 210.1, z = 348.2 }, rot = { x = 8.8, y = 206.0, z = 10.5 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 255, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2755.7, y = 212.0, z = 346.6 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_255", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_255", action = "action_EVENT_ANY_GADGET_DIE_255", tlog_tag = "风龙_141_碎石堆宝箱_成功" }
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
		gadgets = { 480 },
		regions = { 255 },
		triggers = { "ANY_GADGET_DIE_255" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_255(context, evt)
	if 480 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_255(context, evt)
	-- 创建id为479的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 479 }) then
	  return -1
	end
	
	return 0
end
