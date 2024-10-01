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
	{ config_id = 66, gadget_id = 70500001, pos = { x = 70.4, y = 30.5, z = 116.6 }, rot = { x = 0.0, y = 25.5, z = 0.0 }, level = 1, point_type = 1000001, isOneoff = true },
	{ config_id = 67, gadget_id = 70210031, pos = { x = 66.1, y = 9.4, z = 121.1 }, rot = { x = 0.0, y = 172.2, z = 0.0 }, level = 1, chest_drop_id = 1100302, showcutscene = true }
}

-- 区域
regions = {
	{ config_id = 48, shape = RegionShape.SPHERE, radius = 5, pos = { x = 67.1, y = 1.7, z = 119.3 } }
}

-- 触发器
triggers = {
	{ name = "GATHER_48", event = EventType.EVENT_GATHER, source = "66", condition = "", action = "action_EVENT_GATHER_48" }
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
		-- description = suite_1,
		monsters = { },
		gadgets = { 66 },
		regions = { 48 },
		triggers = { "GATHER_48" },
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
function action_EVENT_GATHER_48(context, evt)
	-- 创生gadget 67
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 67 }) then
		return -1
	end
	
	return 0
end
