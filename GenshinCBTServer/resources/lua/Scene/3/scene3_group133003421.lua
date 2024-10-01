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
	{ config_id = 4047, gadget_id = 70220021, pos = { x = 2662.6, y = 246.3, z = -1330.2 }, rot = { x = 0.0, y = 12.1, z = 0.0 }, level = 1 },
	{ config_id = 4048, gadget_id = 70210032, pos = { x = 2662.5, y = 246.3, z = -1329.0 }, rot = { x = 0.0, y = 17.3, z = 0.0 }, level = 1, chest_drop_id = 403343, state = GadgetState.ChestLocked, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 540, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2660.9, y = 246.9, z = -1326.9 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_540", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_540", action = "action_EVENT_ANY_GADGET_DIE_540" }
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
		gadgets = { 4047, 4048 },
		regions = { 540 },
		triggers = { "ANY_GADGET_DIE_540" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_540(context, evt)
	if 4047 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_540(context, evt)
	-- 解锁目标4048
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 4048, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
