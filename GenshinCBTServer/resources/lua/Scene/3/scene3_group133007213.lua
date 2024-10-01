--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 377, monster_id = 21010301, pos = { x = 2139.3, y = 209.5, z = -61.8 }, rot = { x = 0.0, y = 159.7, z = 0.0 }, level = 18, drop_id = 303004, disableWander = true, pose_id = 9003 },
	{ config_id = 378, monster_id = 21010201, pos = { x = 2141.5, y = 209.5, z = -62.9 }, rot = { x = 0.0, y = 255.0, z = 0.0 }, level = 18, drop_id = 303004, disableWander = true, pose_id = 9003 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 929, gadget_id = 70210022, pos = { x = 2144.3, y = 209.5, z = -64.1 }, rot = { x = 0.0, y = 205.8, z = 0.0 }, level = 1, chest_drop_id = 403104, state = GadgetState.ChestLocked, isOneoff = true, persistent = true },
	{ config_id = 930, gadget_id = 70310004, pos = { x = 2139.9, y = 209.5, z = -63.6 }, rot = { x = 0.0, y = 332.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 962, gadget_id = 70220013, pos = { x = 2141.9, y = 209.5, z = -65.5 }, rot = { x = 0.0, y = 330.8, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 285, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2142.5, y = 209.5, z = -64.4 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_285", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_285", action = "action_EVENT_ANY_MONSTER_DIE_285" }
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
		monsters = { 377, 378 },
		gadgets = { 929, 930, 962 },
		regions = { 285 },
		triggers = { "ANY_MONSTER_DIE_285" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_285(context, evt)
	-- 判断剩余怪物数量是否是0
	if ScriptLib.GetGroupMonsterCount(context) ~= 0 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_285(context, evt)
	-- 将configid为 929 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 929, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
