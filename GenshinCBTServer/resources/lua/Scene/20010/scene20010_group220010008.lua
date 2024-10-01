--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 63, monster_id = 20011501, pos = { x = 481.1, y = -20.0, z = 62.1 }, rot = { x = 0.0, y = 91.4, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 64, monster_id = 20011401, pos = { x = 485.0, y = -20.0, z = 66.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 65, monster_id = 20011401, pos = { x = 484.8, y = -20.0, z = 61.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 66, monster_id = 21010201, pos = { x = 491.8, y = -20.0, z = 55.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 67, monster_id = 21010201, pos = { x = 488.1, y = -20.1, z = 57.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 40, gadget_id = 70350002, pos = { x = 493.5, y = -20.2, z = 67.8 }, rot = { x = 0.0, y = 90.0, z = 0.0 }, level = 1 },
	{ config_id = 41, gadget_id = 70220005, pos = { x = 484.2, y = -20.0, z = 66.8 }, rot = { x = 0.0, y = 70.5, z = 0.0 }, level = 1 },
	{ config_id = 75, gadget_id = 70220004, pos = { x = 486.6, y = -20.0, z = 73.2 }, rot = { x = 0.0, y = 301.8, z = 0.0 }, level = 1 },
	{ config_id = 76, gadget_id = 70220004, pos = { x = 487.4, y = -20.0, z = 58.6 }, rot = { x = 0.0, y = 299.8, z = 0.0 }, level = 1 },
	{ config_id = 77, gadget_id = 70220004, pos = { x = 477.2, y = -20.0, z = 54.2 }, rot = { x = 0.0, y = 275.9, z = 0.0 }, level = 1 },
	{ config_id = 78, gadget_id = 70220004, pos = { x = 477.6, y = -20.0, z = 74.4 }, rot = { x = 0.0, y = 34.2, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 22, shape = RegionShape.SPHERE, radius = 5, pos = { x = 461.0, y = -21.6, z = 70.0 } },
	{ config_id = 23, shape = RegionShape.SPHERE, radius = 5, pos = { x = 463.0, y = -21.6, z = 64.0 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_22", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_22", action = "action_EVENT_ANY_MONSTER_DIE_22" },
	{ name = "ANY_MONSTER_DIE_23", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_23", action = "action_EVENT_ANY_MONSTER_DIE_23" }
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
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_22(context, evt)
	-- 判断剩余怪物数量是否是2
	if ScriptLib.GetGroupMonsterCount(context) ~= 2 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_22(context, evt)
	-- 延迟1秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 66, delay_time = 1 }) then
	  return -1
	end
	
	-- 延迟1秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 67, delay_time = 1 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_23(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_23(context, evt)
	-- 将configid为 40 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 40, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end
