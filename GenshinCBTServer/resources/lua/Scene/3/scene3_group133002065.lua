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
	{ config_id = 977, gadget_id = 70500000, pos = { x = 1850.4, y = 275.4, z = -695.4 }, rot = { x = 0.0, y = 261.6, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 978, gadget_id = 70690001, pos = { x = 1850.3, y = 255.6, z = -695.5 }, rot = { x = 90.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 979, gadget_id = 70690001, pos = { x = 1850.3, y = 263.3, z = -695.5 }, rot = { x = 90.0, y = 64.8, z = 0.0 }, level = 1 },
	{ config_id = 980, gadget_id = 70690001, pos = { x = 1850.2, y = 270.0, z = -695.4 }, rot = { x = 90.0, y = 152.7, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 54, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1850.2, y = 251.9, z = -694.8 } }
}

-- 触发器
triggers = {
	{ name = "GATHER_54", event = EventType.EVENT_GATHER, source = "977", condition = "", action = "action_EVENT_GATHER_54" }
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
		gadgets = { 977, 978, 979, 980 },
		regions = { 54 },
		triggers = { "GATHER_54" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件

-- 触发操作
function action_EVENT_GATHER_54(context, evt)
		-- 杀死Group内所有实体
		if 0 ~= ScriptLib.KillGroupEntity(context, { group_id = 133002065, kill_policy = GroupKillPolicy.GROUP_KILL_ALL }) then
			return -1
		end
		
	
	return 0
end
