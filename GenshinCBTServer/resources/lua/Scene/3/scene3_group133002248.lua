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
	{ config_id = 2112, gadget_id = 70220007, pos = { x = 1917.4, y = 241.0, z = -1039.3 }, rot = { x = 0.0, y = 357.6, z = 0.0 }, level = 1 },
	{ config_id = 2113, gadget_id = 70220007, pos = { x = 1920.1, y = 241.1, z = -1041.7 }, rot = { x = 0.0, y = 266.8, z = 0.0 }, level = 1 },
	{ config_id = 2114, gadget_id = 70220007, pos = { x = 1917.7, y = 240.8, z = -1044.1 }, rot = { x = 0.0, y = 357.2, z = 0.0 }, level = 1 },
	{ config_id = 2115, gadget_id = 70220007, pos = { x = 1917.9, y = 245.6, z = -1043.8 }, rot = { x = 90.0, y = 352.2, z = 0.0 }, level = 1 },
	{ config_id = 2116, gadget_id = 70220007, pos = { x = 1915.1, y = 241.0, z = -1042.1 }, rot = { x = 0.0, y = 266.8, z = 0.0 }, level = 1 },
	{ config_id = 2117, gadget_id = 70210032, pos = { x = 1917.4, y = 241.4, z = -1041.4 }, rot = { x = 0.0, y = 349.9, z = 0.0 }, level = 1, chest_drop_id = 403222, state = GadgetState.ChestLocked, isOneoff = true, persistent = true, type = GadgetType.GADGET_WORLD_CHECT }
}

-- 区域
regions = {
	{ config_id = 291, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1915.7, y = 242.7, z = -1038.8 } }
}

-- 触发器
triggers = {
	{ name = "ANY_GADGET_DIE_291", event = EventType.EVENT_ANY_GADGET_DIE, source = "", condition = "condition_EVENT_ANY_GADGET_DIE_291", action = "action_EVENT_ANY_GADGET_DIE_291", tlog_tag = "酒庄_248_清泉镇后山石块宝箱_挑战成功" }
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
		gadgets = { 2112, 2113, 2114, 2115, 2116, 2117 },
		regions = { 291 },
		triggers = { "ANY_GADGET_DIE_291" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ANY_GADGET_DIE_291(context, evt)
	if 2112 == evt.param1 then
		return true
	end
	
	if 2113 == evt.param1 then
		return true
	end
	
	if 2114 == evt.param1 then
		return true
	end
	
	if 2115 == evt.param1 then
		return true
	end
	
	if 2116 == evt.param1 then
		return true
	end
	
	return false
end

-- 触发操作
function action_EVENT_ANY_GADGET_DIE_291(context, evt)
		-- 杀死Group内指定的monster和gadget
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133002248, monsters = {}, gadgets = {2112,2113,2114,2115,2116} }) then
			return -1
		end
	
	-- 解锁目标2117
	if 0 ~= ScriptLib.ChangeGroupGadget(context, { config_id = 2117, state = GadgetState.Default }) then
		return -1
	end
	
	return 0
end
