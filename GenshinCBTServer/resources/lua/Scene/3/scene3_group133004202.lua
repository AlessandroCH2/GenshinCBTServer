--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 532, monster_id = 22010301, pos = { x = 2529.1, y = 205.0, z = -775.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 12, drop_id = 303143 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1160, gadget_id = 70900039, pos = { x = 2534.3, y = 205.2, z = -775.8 }, rot = { x = 0.0, y = 280.4, z = 0.0 }, level = 1, state = GadgetState.GearStop, persistent = true },
	{ config_id = 1161, gadget_id = 70690006, pos = { x = 2534.4, y = 205.2, z = -775.8 }, rot = { x = 0.0, y = 168.7, z = 0.0 }, level = 1 },
	{ config_id = 1221, gadget_id = 70690001, pos = { x = 2534.4, y = 219.4, z = -775.8 }, rot = { x = 270.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1222, gadget_id = 70690001, pos = { x = 2534.4, y = 235.1, z = -775.8 }, rot = { x = 270.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1223, gadget_id = 70690001, pos = { x = 2534.4, y = 250.1, z = -775.8 }, rot = { x = 270.0, y = 0.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 234, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2534.1, y = 205.1, z = -774.7 } },
	{ config_id = 235, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2533.2, y = 205.3, z = -776.6 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_234", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_234", action = "action_EVENT_ANY_MONSTER_DIE_234" },
	{ name = "GADGET_STATE_CHANGE_235", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_235", action = "action_EVENT_GADGET_STATE_CHANGE_235" }
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
		monsters = { 532 },
		gadgets = { 1160 },
		regions = { 234, 235 },
		triggers = { "ANY_MONSTER_DIE_234", "GADGET_STATE_CHANGE_235" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_234(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_234(context, evt)
	-- 解锁目标1160
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 1160, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_235(context, evt)
	if 1160 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_235(context, evt)
	-- 创建id为1161的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1161 }) then
	  return -1
	end
	
	-- 创建id为1221的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1221 }) then
	  return -1
	end
	
	-- 创建id为1222的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1222 }) then
	  return -1
	end
	
	-- 创建id为1223的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 1223 }) then
	  return -1
	end
	
	return 0
end
