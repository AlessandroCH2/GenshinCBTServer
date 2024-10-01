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
	{ config_id = 686, gadget_id = 70900039, pos = { x = 2645.1, y = 213.0, z = -185.0 }, rot = { x = 0.0, y = 120.0, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
	{ config_id = 224, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2645.3, y = 213.0, z = -184.8 } }
}

-- 触发器
triggers = {
	{ name = "GADGET_STATE_CHANGE_224", event = EventType.EVENT_GADGET_STATE_CHANGE, source = "", condition = "condition_EVENT_GADGET_STATE_CHANGE_224", action = "action_EVENT_GADGET_STATE_CHANGE_224", trigger_count = 0, tlog_tag = "风龙_191_风场机关_触发" }
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
		gadgets = { 686 },
		regions = { 224 },
		triggers = { "GADGET_STATE_CHANGE_224" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_GADGET_STATE_CHANGE_224(context, evt)
	if 686 ~= evt.param2 or GadgetState.GearStart ~= evt.param1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_GADGET_STATE_CHANGE_224(context, evt)
		-- 重新生成指定group，指定suite
		if 0 ~= ScriptLib.RefreshGroup(context, { group_id = 133007192, suite = 2 }) then
			return -1
		end
	
	-- 触发镜头注目，注目位置为坐标（2648，213，-186），持续时间为2秒，并且为强制注目形式，不广播其他玩家
		local pos = {x=2648, y=213, z=-186}
	    if 0 ~= ScriptLib.BeginCameraSceneLook(context, { look_pos = pos, duration = 2, is_force = true, is_broadcast = false }) then
					return -1
				end 
	
	return 0
end
