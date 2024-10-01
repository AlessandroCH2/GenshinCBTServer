--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 2, monster_id = 20011201, pos = { x = 259.5, y = -10.5, z = -131.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, disableWander = true },
	{ config_id = 3, monster_id = 20011201, pos = { x = 265.3, y = -10.5, z = -131.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, disableWander = true },
	{ config_id = 4, monster_id = 20011201, pos = { x = 271.7, y = -10.5, z = -131.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, disableWander = true }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 61, gadget_id = 70900208, pos = { x = 259.4, y = -10.5, z = -146.0 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 62, gadget_id = 70900208, pos = { x = 259.4, y = -10.5, z = -142.9 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 63, gadget_id = 70900208, pos = { x = 259.4, y = -10.5, z = -139.8 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 64, gadget_id = 70900208, pos = { x = 259.3, y = -10.5, z = -136.7 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 65, gadget_id = 70900208, pos = { x = 259.4, y = -10.6, z = -133.7 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 66, gadget_id = 70350004, pos = { x = 261.3, y = -10.5, z = -138.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 68, gadget_id = 70900208, pos = { x = 265.5, y = -10.6, z = -146.0 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 69, gadget_id = 70900208, pos = { x = 265.5, y = -10.6, z = -142.9 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 70, gadget_id = 70900208, pos = { x = 265.5, y = -10.6, z = -139.8 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 71, gadget_id = 70900208, pos = { x = 265.4, y = -10.6, z = -136.7 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 72, gadget_id = 70900208, pos = { x = 265.5, y = -10.7, z = -133.8 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 73, gadget_id = 70350004, pos = { x = 267.4, y = -10.6, z = -138.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 75, gadget_id = 70900208, pos = { x = 271.9, y = -10.6, z = -146.0 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 76, gadget_id = 70900208, pos = { x = 271.8, y = -10.6, z = -142.9 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 77, gadget_id = 70900208, pos = { x = 271.8, y = -10.6, z = -139.8 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 78, gadget_id = 70900208, pos = { x = 271.8, y = -10.6, z = -136.7 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 79, gadget_id = 70900208, pos = { x = 271.8, y = -10.7, z = -133.7 }, rot = { x = 0.0, y = 74.6, z = 0.0 }, level = 1 },
	{ config_id = 80, gadget_id = 70350004, pos = { x = 273.7, y = -10.6, z = -138.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 11, shape = RegionShape.SPHERE, radius = 5, pos = { x = 265.9, y = -10.5, z = -138.3 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_11", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_11", action = "action_EVENT_ANY_MONSTER_DIE_11" }
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
		monsters = { 2, 3, 4 },
		gadgets = { 61, 62, 63, 64, 65, 66, 68, 69, 70, 71, 72, 73, 75, 76, 77, 78, 79, 80 },
		regions = { 11 },
		triggers = { "ANY_MONSTER_DIE_11" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_11(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_11(context, evt)
	-- 将configid为 66 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 66, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 73 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 73, GadgetState.GearStart) then
			return -1
		end 
	
	-- 将configid为 80 的物件更改为状态 GadgetState.GearStart
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 80, GadgetState.GearStart) then
			return -1
		end 
	
	return 0
end
