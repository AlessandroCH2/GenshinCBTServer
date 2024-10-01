--************************************************************************
--  工具自动生成的类型定义代码(UTF-8 With BOM)，请勿编辑！
--  File Name:    CommonScriptConfig.lua
--  Purpose:      lua类型定义文件
--  Copyright (c) 2017-2100 miHoYo.com, Inc. All rights reserved.
--************************************************************************

--区域形状
RegionShape =
{
	REGION_NONE = 0, -- 无
	REGION_SPHERE = 1, -- 无
	REGION_CUBIC = 2, -- 立方体
}

--事件类型
EventType =
{
	EVENT_NONE = 0, -- 无
	EVENT_ANY_MONSTER_DIE = 1, -- 任何怪物死亡
	EVENT_ANY_GADGET_DIE = 2, -- 任何物件死亡
	EVENT_VARIABLE_CHANGE = 3, -- 变量改变
	EVENT_ENTER_REGION = 4, -- 进入区域
	EVENT_LEAVE_REGION = 5, -- 离开区域
	EVENT_GADGET_CREATE = 6, -- 物件创建
	EVENT_GADGET_STATE_CHANGE = 7, -- 物件状态改变
	EVENT_DUNGEON_SETTLE = 8, -- 副本结算
	EVENT_SELECT_OPTION = 9, -- 选择选项
	EVENT_CLIENT_EXECUTE = 10, -- 客户端请求执行trigger
	EVENT_ANY_MONSTER_LIVE = 11, -- 任何怪物创生
	EVENT_SPECIFIC_MONSTER_HP_CHANGE = 12, -- 指定config_id的怪物血量变化
	EVENT_AREA_LEVELUP_UNLOCK_DUNGEON_ENTRY = 13, -- area升级后执行UNLOCK_DUNGEON_ENTRY的动作
	EVENT_DUNGEON_BROADCAST_ONTIMER = 14, -- 副本group定时事件，广播给所有group
	EVENT_TIMER_EVENT = 15, -- 延时调用事件
	EVENT_CHALLENGE_SUCCESS = 16, -- 区域挑战成功
	EVENT_CHALLENGE_FAIL = 17, -- 区域挑战失败
	EVENT_SEAL_BATTLE_BEGIN = 18, -- 封印战斗开始
	EVENT_SEAL_BATTLE_END = 19, -- 封印战斗结束
	EVENT_GATHER = 20, -- 采集事件
	EVENT_QUEST_FINISH = 21, -- 任务完成
	EVENT_MONSTER_BATTLE = 22, -- 怪物入战
	EVENT_AREA_LEVELUP = 23, -- 一级区域升级
	EVENT_CUTSCENE_END = 24, -- 所有客户端播放cutscene结束
	EVENT_AVATAR_NEAR_PLATFORM = 25, -- 角色靠近移动平台，这时移动平台已停止(客户端发送)
}

--物件类型
GadgetType =
{
	GADGET_NONE = 0, -- 无
	GADGET_WORLD_CHECT = 1, -- 地表世界宝箱
	GADGET_DUNGEON_SECRET_CHEST = 2, -- 地城秘密宝箱
	GADGET_DUNGEON_PASS_CHEST = 3, -- 地城通关宝箱
}

--组内杀死实体策略
GroupKillPolicy =
{
	GROUP_KILL_NONE = 0, -- 无
	GROUP_KILL_ALL = 1, -- 所有实体
	GROUP_KILL_MONSTER = 2, -- 所有怪物
	GROUP_KILL_GADGET = 3, -- 所有物件
	GROUP_KILL_NPC = 4, -- 所有NPC
}

