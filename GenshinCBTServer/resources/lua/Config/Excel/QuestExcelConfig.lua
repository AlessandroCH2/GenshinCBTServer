--************************************************************************
--  工具自动生成的类型定义代码(UTF-8 With BOM)，请勿编辑！
--  File Name:    QuestExcelConfig.lua
--  Purpose:      lua类型定义文件
--  Copyright (c) 2017-2100 miHoYo.com, Inc. All rights reserved.
--************************************************************************

--任务类型
QuestType =
{
	AQ = 0, -- Archon Quest 魔神任务
	FQ = 1, -- Fractions Quest 帮派任务
	LQ = 2, -- Legend Quest 传说任务
	EQ = 3, -- Event Quest 活动任务
	DQ = 4, -- Daily Quest 日常任务
	IQ = 5, -- Indescribable Quest 不可描述的任务
}

--任务状态
QuestState =
{
	QUEST_STATE_NONE = 0, -- 不能领取
	QUEST_STATE_UNSTARTED = 1, -- 未开始
	QUEST_STATE_UNFINISHED = 2, -- 未完成
	QUEST_STATE_FINISHED = 3, -- 已完成
	QUEST_STATE_FAILED = 4, -- 已失败
}

--显示状态
QuestShowType =
{
	QUEST_SHOW = 0, -- 显示
	QUEST_HIDDEN = 1, -- 隐藏
}

--任务条件类型
QuestCondType =
{
	QUEST_COND_NONE = 0, -- 未定义
	QUEST_COND_STATE_EQUAL = 1, -- 任务状态等于
	QUEST_COND_STATE_NOT_EQUAL = 2, -- 任务状态不等于
	QUEST_COND_PACK_HAVE_ITEM = 3, -- 背包有道具
	QUEST_COND_AVATAR_ELEMENT_EQUAL = 4, -- 角色元素等于
	QUEST_COND_AVATAR_ELEMENT_NOT_EQUAL = 5, -- 角色元素不等于
	QUEST_COND_AVATAR_CAN_CHANGE_ELEMENT = 6, -- 角色是否可以改变元素
	QUEST_COND_WORLD_AREA_LEVEL_EQUAL_GREATER = 7, -- 一级区域等级大于或等于
}

--任务指引类型
QuestGuideType =
{
	QUEST_GUIDE_NONE = 0, -- 未定义
	QUEST_GUIDE_LOCATION = 1, -- 地点
	QUEST_GUIDE_NPC = 2, -- NPC
}

--场景内指引类型
ShowQuestGuideType =
{
	QUEST_GUIDE_ITEM_ENABLE = 0, -- 是
	QUEST_GUIDE_ITEM_DISABLE = 1, -- 不启用
	QUEST_GUIDE_ITEM_MOVE_HIDE = 2, -- 移动中隐藏
}

--任务指引自动开启或关闭
QuestGuideAuto =
{
	QUEST_GUIDE_AUTO_NONE = 0, -- 未定义
	QUEST_GUIDE_AUTO_ENABLE = 1, -- 自动开启
	QUEST_GUIDE_AUTO_DISABLE = 2, -- 自动关闭
}

--任务指引层级
QuestGuideLayer =
{
	QUEST_GUIDE_LAYER_NONE = 0, -- 未定义
	QUEST_GUIDE_LAYER_UI = 1, -- UI层级
	QUEST_GUIDE_LAYER_SCENE = 2, -- 场景层级
}

--任务执行类型
QuestExecType =
{
	QUEST_EXEC_NONE = 0, -- 未定义
	QUEST_EXEC_DEL_PACK_ITEM = 1, -- 删除背包中道具
	QUEST_EXEC_UNLOCK_POINT = 2, -- 解锁传送点
	QUEST_EXEC_UNLOCK_AREA = 3, -- 解锁区域
	QUEST_EXEC_UNLOCK_FORCE = 4, -- 解锁力场
	QUEST_EXEC_LOCK_FORCE = 5, -- 锁住力场
	QUEST_EXEC_CHANGE_AVATAR_ELEMET = 6, -- 改变角色元素
	QUEST_EXEC_REFRESH_GROUP_MONSTER = 7, -- 刷新怪物营地
	QUEST_EXEC_SET_IS_FLYABLE = 8, -- 设置飞行能力
	QUEST_EXEC_SET_IS_WEATHER_LOCKED = 9, -- 设置天气锁定状态
	QUEST_EXEC_SET_IS_GAME_TIME_LOCKED = 10, -- 设置游戏时间锁定状态
	QUEST_EXEC_SET_IS_TRANSFERABLE = 11, -- 设置传送能力
	QUEST_EXEC_GRANT_TRIAL_AVATAR = 12, -- 发放试用角色
	QUEST_EXEC_OPEN_BORED = 13, -- 开放无聊度系统
	QUEST_EXEC_ROLLBACK_QUEST = 14, -- 回滚任务
	QUEST_EXEC_NOTIFY_GROUP_LUA = 15, -- 通知group脚本
	QUEST_EXEC_SET_OPEN_STATE = 16, -- 设置开启状态
	QUEST_EXEC_LOCK_POINT = 17, -- 锁点
	QUEST_EXEC_DEL_PACK_ITEM_BATCH = 18, -- 批量删除背包中道具
	QUEST_EXEC_REFRESH_GROUP_SUITE = 19, -- 刷新指定Group指定的Suite
	QUEST_EXEC_REMOVE_TRIAL_AVATAR = 20, -- 删除试用角色
}

--对话触发方式
TalkBeginWay =
{
	TALK_BEGIN_NONE = 0, -- 未定义
	TALK_BEGIN_AUTO = 1, -- 自动触发
	TALK_BEGIN_MANUAL = 2, -- 手动触发
}

--对话角色类型
TalkRoleType =
{
	TALK_ROLE_NONE = 0, -- 未定义
	TALK_ROLE_NPC = 1, -- NPC
	TALK_ROLE_PLAYER = 2, -- 玩家
}

--对话显示类型
TalkShowType =
{
	TALK_SHOW_DEFAULT = 0, -- 默认：单句显示多局选择
	TALK_SHOW_FORCE_SELECT = 1, -- 强制成为选项
}

