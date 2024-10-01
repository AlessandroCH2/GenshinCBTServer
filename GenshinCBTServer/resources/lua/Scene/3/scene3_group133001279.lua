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
	{ config_id = 1980, gadget_id = 70210011, pos = { x = 1686.2, y = 220.2, z = -1484.9 }, rot = { x = 0.0, y = 106.2, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true, persistent = true },
	{ config_id = 1981, gadget_id = 70220021, pos = { x = 1686.2, y = 219.3, z = -1485.0 }, rot = { x = 7.8, y = 290.8, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 426, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1686.6, y = 220.9, z = -1484.6 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_426", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_426", action = "action_EVENT_ENTER_REGION_426" }
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
		gadgets = { 1980, 1981 },
		regions = { 426 },
		triggers = { "ENTER_REGION_426" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_426(context, evt)
	if evt.param1 ~= 426 then return false end
	
	if 1981 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_426(context, evt)
	-- 创建id为1980的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1980 }) then
	  return -1
	end
	
	return 0
end
