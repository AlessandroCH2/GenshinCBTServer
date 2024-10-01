--************************************************************************
--  工具自动生成的类型定义代码(UTF-8 With BOM)，请勿编辑！
--  File Name:    ConfigInteraction.lua
--  Purpose:      lua类型定义文件
--  Copyright (c) 2017-2100 miHoYo.com, Inc. All rights reserved.
--************************************************************************

--优先级类型
InterPriorityType =
{
	OVERRIDE = 0, -- 清空老的全结束，覆盖
	INSERT = 1, -- 追加在最先
	ADDITIVE = 2, -- 追加在后面
	FREE_TO_DO = 3, -- 队列里没别的事情时候才加上
}

--交互类型
InteractionType =
{
	NONE = 0, -- 无
	DIALOG = 1, -- 对话
	DIALOG_NEXT = 2, -- 请求下一个对话
	DIALOG_FINISH = 3, -- 对话结束
	DIALOG_SELECT = 4, -- 对话选择
	BODY_LANG = 5, -- 肢体语言
	STEER_TO = 6, -- 朝向转动
	LOOK_AT = 7, -- 注意主角
	CAMERA_MOVE = 8, -- 运镜
	SOUND = 9, -- 声响
	CUTSCENE = 10, -- 过场
	SHOP_EXCHANGE = 11, -- 商店交换
	GADGET_TOUCH = 12, -- 道具互动
	EMO_SYNC = 13, -- 说话动画
	UI_TRIGGER = 14, -- 打开UI页面
	EMOTION = 15, -- 做一个表情
	VISIBLE = 16, -- 是否可见
	LUA_ACTION = 17, -- 执行交互中的Lua回调
	BLACK_SCREEN = 18, -- 黑屏操作
	GODDESS = 19, -- 女神像元素共鸣
	SHOW_MESSAGE = 20, -- 显示提示
	CAMERA_FOCUS = 21, -- 专注相机
	DIALOG_CLEAR = 22, -- 对话清除
	Other = 23, -- 占位
}

--对话类型
DialogType =
{
	LOCK_FRAME = 0, -- 锁定对话框可带选项
	BUBBLE = 1, -- 头顶气泡
	NARRATION = 2, -- 锁定旁白，用于CutScene
	Other = 3, -- 占位
}

--朝向类型
DialogSteerType =
{
	FREE = 0, -- 根据参数自由
	ABSOLUTE = 1, -- 目标绝对位置
	TO_LOCAL_AVATAR = 2, -- 朝向本地主角位置
	RETURN = 3, -- 还原位置
	Other = 4, -- 占位
}

--运镜相机位置类型
StoryCameraPosType =
{
	ABSOLUTE = 0, -- 绝对位置
	RELATIVE_TO_INTEE = 1, -- 相对位置对于交互反馈者,和交互发起者连线间取值
	RELATIVE_TO_INTER = 2, -- 相对位置对于交互发起者,和交互反馈者连线间取值
	RELATIVE_POS_TO_INTEE = 3, -- 绝对位置对于交互反馈者，位于连线
	RELATIVE_POS_TO_INTER = 4, -- 绝对位置对于交互发起者，位于连线
	EXIT = 5, -- 退出运镜模式
	RELATIVE_TO_INTEE_ONLY = 6, -- 相对位置只相对于交互反馈者
	RELATIVE_TO_INTER_ONLY = 7, -- 相对位置只相对于交互发起者
	Other = 8, -- 占位
}

--运镜相机朝向
StoryCameraTargetType =
{
	ABSOLUTE = 0, -- 绝对朝向
	TO_INTEE = 1, -- 朝向交互反馈者
	TO_INTER = 2, -- 朝向交互发起者
	TO_MID = 3, -- 朝向两者中点
	Other = 4, -- 占位
}

--黑屏方式
BlackScreenType =
{
	TO_KEEP_FROM_BLACK = 0, -- 进入并离开黑屏
	TO_BLACK = 1, -- 进入黑屏
	FROM_BLACK = 2, -- 离开黑屏
	BLEND_OUT = 3, -- 混合淡出
}

