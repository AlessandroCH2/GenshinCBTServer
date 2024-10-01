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
	{ config_id = 3478, gadget_id = 70900008, pos = { x = 2362.8, y = 299.4, z = -1790.7 }, rot = { x = 0.0, y = 337.0, z = 0.0 }, level = 1, persistent = true }
}

-- 区域
regions = {
	{ config_id = 414, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2422.6, y = 320.4, z = -1738.9 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_414", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "", action = "action_EVENT_GADGET_STATE_CHANGE_414" }
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
		gadgets = { },
		regions = { },
		triggers = { },
		rand_weight = 100
	},
	{
		-- suite_id = 1,
		-- description = suite_2,
		monsters = { },
		gadgets = { 3478 },
		regions = { 414 },
		triggers = { "GADGET_STATE_CHANGE_414" },
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
function action_EVENT_GADGET_STATE_CHANGE_414(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133003351, suite = 2 }) then
			return -1
		end
	
	-- 触发镜头注目，注目位置为坐标（2327，308，-1756），持续时间为3秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=2327, y=308, z=-1756}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 3, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end
