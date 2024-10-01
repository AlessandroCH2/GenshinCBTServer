--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 586, monster_id = 28020102, pos = { x = 2249.3, y = 270.6, z = -1745.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 2839, gadget_id = 70220021, pos = { x = 2231.1, y = 272.2, z = -1768.4 }, rot = { x = 301.8, y = 345.4, z = 199.3 }, level = 1 },
	{ config_id = 2840, gadget_id = 70210021, pos = { x = 2231.4, y = 273.0, z = -1766.1 }, rot = { x = 8.3, y = 326.0, z = 356.5 }, level = 1, chest_drop_id = 403322, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 149, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2229.8, y = 273.7, z = -1765.9 } },
	{ config_id = 307, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2235.2, y = 273.8, z = -1765.1 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_149", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_149", action = "action_EVENT_ANY_GADGET_DIE_149" },
	{ name = "CLIENT_EXECUTE_307", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_307", trigger_count = 0 }
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
		monsters = { 586 },
		gadgets = { 2839 },
		regions = { 149, 307 },
		triggers = { "ANY_GADGET_DIE_149", "CLIENT_EXECUTE_307" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_149(context, evt)
	if 2839 ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_149(context, evt)
	-- 创建id为2840的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2840 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_307(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
