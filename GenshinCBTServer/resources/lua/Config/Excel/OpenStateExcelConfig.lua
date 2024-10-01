--************************************************************************
--  工具自动生成的类型定义代码(UTF-8 With BOM)，请勿编辑！
--  File Name:    OpenStateExcelConfig.lua
--  Purpose:      lua类型定义文件
--  Copyright (c) 2017-2100 miHoYo.com, Inc. All rights reserved.
--************************************************************************

--开启状态类型枚举
OpenStateType =
{
	OPEN_STATE_NONE = 0, -- 无效
	OPEN_STATE_PAIMON = 1, -- 派蒙开关
	OPEN_STATE_PAIMON_NAVIGATION = 2, -- 派蒙指引开关
	OPEN_STATE_AVATAR_PROMOTE = 3, -- 角色突破
	OPEN_STATE_AVATAR_TALENT = 4, -- 角色天赋
	OPEN_STATE_WEAPON_PROMOTE = 5, -- 武器突破
	OPEN_STATE_WEAPON_AWAKEN = 6, -- 武器觉醒
	OPEN_STATE_QUEST_REMIND = 7, -- 任务提示
	OPEN_STATE_GAME_GUIDE = 8, -- 游戏指引
}

--开启功能所需的条件
OpenStateCondType =
{
	OPEN_STATE_COND_NONE = 0, -- 无效
	OPEN_STATE_COND_PLAYER_LEVEL = 1, -- 玩家等级
	OPEN_STATE_COND_QUEST = 2, -- 任务
}

