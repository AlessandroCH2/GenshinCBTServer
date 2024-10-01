--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 33, monster_id = 21010501, pos = { x = 1341.5, y = 278.3, z = -5731.0 }, rot = { x = 0.0, y = 15.7, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 34, monster_id = 21010501, pos = { x = 1302.7, y = 276.8, z = -5797.3 }, rot = { x = 0.0, y = 310.4, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 35, monster_id = 22010101, pos = { x = 1283.9, y = 263.5, z = -5794.1 }, rot = { x = 0.0, y = 310.9, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 36, monster_id = 21030201, pos = { x = 1241.5, y = 263.3, z = -5789.9 }, rot = { x = 0.0, y = 72.3, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 37, monster_id = 21030301, pos = { x = 1262.7, y = 262.3, z = -5751.5 }, rot = { x = 0.0, y = 133.1, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 38, monster_id = 21020201, pos = { x = 1254.4, y = 264.5, z = -5833.5 }, rot = { x = 0.0, y = 11.4, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 39, monster_id = 21010501, pos = { x = 1265.9, y = 277.8, z = -5729.6 }, rot = { x = 0.0, y = 150.6, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 40, monster_id = 21010501, pos = { x = 1226.7, y = 280.2, z = -5775.9 }, rot = { x = 0.0, y = 131.3, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 41, monster_id = 21010201, pos = { x = 1334.7, y = 251.9, z = -5767.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1, gadget_id = 70210032, pos = { x = 1265.7, y = 263.0, z = -5780.4 }, rot = { x = 0.0, y = 58.2, z = 0.0 }, level = 1, chest_drop_id = 303122, state = GadgetState.ChestLocked }
}

-- 区域
regions = {
	{ config_id = 4, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1264.8, y = 262.7, z = -5782.2 } }
}

-- 触发器
triggers = {
	{ name = "ANY_MONSTER_DIE_4", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_4", action = "action_EVENT_ANY_MONSTER_DIE_4" }
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
		monsters = { 33, 34, 35, 36, 37, 38, 39, 40, 41 },
		gadgets = { 1 },
		regions = { 4 },
		triggers = { "ANY_MONSTER_DIE_4" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_MONSTER_DIE_4(context, evt)
	--判断死亡怪物的configid是否为 38
	if evt.param1 ~= 38 then
	    return false
	 end
	  
	
	return true
end

-- 触发操作
function action_EVENT_ANY_MONSTER_DIE_4(context, evt)
	-- 将configid为 1 的物件更改为状态 GadgetState.Default
	if 0 ~= ScriptLib.SetGadgetStateByConfigId(context, 1, GadgetState.Default) then
			return -1
		end 
	
	return 0
end
