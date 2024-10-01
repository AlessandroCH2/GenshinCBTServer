--************************************************************************
--  工具自动生成的类型定义代码(UTF-8 With BOM)，请勿编辑！
--  File Name:    ConfigLuaDefine.lua
--  Purpose:      lua类型定义文件
--  Copyright (c) 2017-2100 miHoYo.com, Inc. All rights reserved.
--************************************************************************

--Actor类型
ActorType =
{
	INVALID = 0, -- 不可用
	BASE_ENTITY = 1, -- 基础Entity
	NPC_ACTOR = 2, -- Npc的Actor
	QUEST_ACTOR = 3, -- 任务的Actor
	GLOBAL_ACTOR = 4, -- 全局的上帝
	GADGET_ACTOR = 5, -- 特定功能的Actor
	SUB_GLOBAL_ACTOR = 6, -- 自由注册的全局Actor
	CUTSCENE_ACTOR = 7, -- 操作Cutscene的Actor
	INTERACTION_ACTOR = 8, -- 交互时触发的Actor
}

--Task的不同轨道
TaskID =
{
	MOVE_TASK_ID = 0, -- 移动用的轨道id
	NARRATOR_TASK_ID = 1, -- 旁白id
	LOCK_TASK_ID = 2, -- 锁区id
	THREAD_TASK_ID = 3, -- 仇恨监听id
	TRANSMIT_BTN_ID = 4, -- 传送按钮监听
	WARNING_TASK_ID = 5, -- 警告id,这个track放最后
}

--交互时机类型
InterTimingType =
{
	ENTER = 0, -- 进入范围时
	BTN = 1, -- 交互按钮
	EXIT = 2, -- 出交互范围时
}

--Actor消息通知范围类型
ActorEvtTargetType =
{
	SINGLE = 0, -- 通知单个
	ALL = 1, -- 通知所有人
}

--天气类型
WeatherType =
{
	ClearSky = 0, -- 晴天
	Cloudy = 1, -- 阴天
	Foggy = 2, -- 雾天
	Rain = 3, -- 下雨
	Snow = 4, -- 下雪
	Storm = 5, -- 暴风雨
}

--LuaTask类型
LuaTaskType =
{
	NORMAL = 0, -- 普通
	MOVE = 1, -- 移动
	THREAT = 2, -- 警戒
	FREE_STYLE = 3, -- 做一个动作
	LIMIT_REGION = 4, -- 限制区域
	BTN_TRANS = 5, -- 检查传送按钮
	STEER = 6, -- 转身
}

--被跟随状态
BeFollowState =
{
	ING = 0, -- 正在跟随
	WAITING = 1, -- 正在等待
	TRANS = 2, -- 预失败
	PRE_FAILED = 3, -- 预失败
	FAILED = 4, -- 失败
	SUCCESS = 5, -- 成功
}

--旁白状态
NarratorState =
{
	ING = 0, -- 正在旁白
	PAUSING = 1, -- 暂停
}

--任务状态
QState =
{
	INVALID = -1, -- 不可用
	ACCEPTED = 0, -- 已接
	UPDATED = 1, -- 更新，子任务完成
	FINISHED = 2, -- 完成
	FAILED = 3, -- 失败
}

--距离类型
DistType =
{
	EULER = 0, -- 欧式距离
	EULER_XZ = 1, -- XZ平面欧氏距离
}

