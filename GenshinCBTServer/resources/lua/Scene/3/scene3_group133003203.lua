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
	{ config_id = 2945, gadget_id = 70290008, pos = { x = 2389.0, y = 260.6, z = -1242.9 }, rot = { x = 0.0, y = 128.8, z = 0.0 }, level = 1 },
	{ config_id = 2946, gadget_id = 70500000, pos = { x = 2389.0, y = 260.6, z = -1242.9 }, rot = { x = 0.0, y = 128.8, z = 0.0 }, level = 1, point_type = 3008, owner = 2945 },
	{ config_id = 2949, gadget_id = 70290010, pos = { x = 2455.6, y = 308.7, z = -1668.8 }, rot = { x = 10.7, y = 357.9, z = 6.0 }, level = 1 },
	{ config_id = 2950, gadget_id = 70500000, pos = { x = 2455.6, y = 308.7, z = -1668.8 }, rot = { x = 10.7, y = 357.9, z = 6.0 }, level = 1, point_type = 3006, owner = 2949 },
	{ config_id = 2951, gadget_id = 70290010, pos = { x = 2454.5, y = 308.8, z = -1670.5 }, rot = { x = 354.2, y = 110.3, z = 15.4 }, level = 1 },
	{ config_id = 2952, gadget_id = 70500000, pos = { x = 2454.5, y = 308.8, z = -1670.5 }, rot = { x = 354.2, y = 110.3, z = 15.4 }, level = 1, point_type = 3006, owner = 2951 },
	{ config_id = 2953, gadget_id = 70290007, pos = { x = 2454.6, y = 308.6, z = -1669.4 }, rot = { x = 356.5, y = 98.5, z = 7.8 }, level = 1 },
	{ config_id = 2954, gadget_id = 70290007, pos = { x = 2454.5, y = 308.4, z = -1668.3 }, rot = { x = 353.5, y = 195.0, z = 348.8 }, level = 1 },
	{ config_id = 3097, gadget_id = 70290010, pos = { x = 2161.2, y = 226.0, z = -1351.3 }, rot = { x = 356.7, y = 0.0, z = 19.6 }, level = 1 },
	{ config_id = 3098, gadget_id = 70500000, pos = { x = 2161.2, y = 226.0, z = -1351.3 }, rot = { x = 356.7, y = 0.0, z = 19.6 }, level = 1, point_type = 3006, owner = 3097 },
	{ config_id = 3100, gadget_id = 70290008, pos = { x = 2210.5, y = 235.9, z = -1403.3 }, rot = { x = 1.3, y = 354.8, z = 0.0 }, level = 1 },
	{ config_id = 3101, gadget_id = 70500000, pos = { x = 2210.5, y = 235.9, z = -1403.3 }, rot = { x = 1.3, y = 354.8, z = 0.0 }, level = 1, point_type = 3008, owner = 3100 },
	{ config_id = 3102, gadget_id = 70290005, pos = { x = 2209.9, y = 236.0, z = -1402.6 }, rot = { x = 0.0, y = 148.5, z = 0.0 }, level = 1 },
	{ config_id = 3103, gadget_id = 70290008, pos = { x = 2209.4, y = 235.8, z = -1405.6 }, rot = { x = 0.0, y = 69.5, z = 0.0 }, level = 1 },
	{ config_id = 3104, gadget_id = 70500000, pos = { x = 2209.4, y = 235.8, z = -1405.6 }, rot = { x = 0.0, y = 69.5, z = 0.0 }, level = 1, point_type = 3008, owner = 3103 },
	{ config_id = 3451, gadget_id = 70290009, pos = { x = 2068.6, y = 224.4, z = -1588.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 3452, gadget_id = 70500000, pos = { x = 2068.6, y = 224.4, z = -1588.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3005, owner = 3451 },
	{ config_id = 4190, gadget_id = 70290011, pos = { x = 2498.0, y = 213.0, z = -1282.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 4191, gadget_id = 70500000, pos = { x = 2498.0, y = 213.0, z = -1282.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3009, owner = 4190 },
	{ config_id = 4192, gadget_id = 70290011, pos = { x = 2495.5, y = 212.9, z = -1282.3 }, rot = { x = 0.0, y = 12.8, z = 0.0 }, level = 1 },
	{ config_id = 4193, gadget_id = 70500000, pos = { x = 2495.5, y = 212.9, z = -1282.3 }, rot = { x = 0.0, y = 12.8, z = 0.0 }, level = 1, point_type = 3009, owner = 4192 },
	{ config_id = 4194, gadget_id = 70290011, pos = { x = 2486.7, y = 211.7, z = -1268.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 4195, gadget_id = 70500000, pos = { x = 2486.7, y = 211.7, z = -1268.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3009, owner = 4194 }
}

-- 区域
regions = {
	{ config_id = 170, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2385.4, y = 260.2, z = -1245.6 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_170", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElementFlora", condition = "", action = "action_EVENT_CLIENT_EXECUTE_170", trigger_count = 0 }
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
		gadgets = { 2945, 2946, 2949, 2950, 2951, 2952, 2953, 2954, 3097, 3098, 3100, 3101, 3102, 3103, 3104, 3451, 3452, 4190, 4191, 4192, 4193, 4194, 4195 },
		regions = { 170 },
		triggers = { "CLIENT_EXECUTE_170" },
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
function action_EVENT_CLIENT_EXECUTE_170(context, evt)
	-- 针对groupid为 133003203 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
	 ScriptLib.SetGadgetEnableInteract(context, 133003203, this_gadget, true)
	return 0
end
