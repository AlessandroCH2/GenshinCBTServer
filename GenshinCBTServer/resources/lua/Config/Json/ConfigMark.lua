--************************************************************************
--  工具自动生成的类型定义代码(UTF-8 With BOM)，请勿编辑！
--  File Name:    ConfigMark.lua
--  Purpose:      lua类型定义文件
--  Copyright (c) 2017-2100 miHoYo.com, Inc. All rights reserved.
--************************************************************************

--标记类型
MarkVisibleType =
{
	NONE = 0, -- 无标记
	ALWAYS = 1, -- 总是显示
	AROUND = 2, -- 周围显示
	CONDITION_ONLY = 3, -- 只根据条件出现
	OTHER = 4, -- 占位
}

--标记表现类型
MarkViewType =
{
	NONE = 0, -- 无表现
	MAP_MARK_NORMAL = 1, -- 普通地图标记，跟着比例尺和玩家位置在小地图中做相对运动
	MAP_MARK_LOCAL_AVATAR = 2, -- 本地玩家地图标记，永远位于地图中心且跟着旋转
	MAP_MARK_LOCAL_SIGHT = 3, -- 本地视线标记，永远位于地图中心且跟着本地镜头旋转
	MAP_MARK_SOUTH = 4, -- 指南针，跟着南方转
	MAP_MARK_MINI_OTHER = 5, -- 除了本地角色以外的单位所在的组
	MAP_MARK_CUSTOM = 6, -- 本地自定义标记，永远在小地图显示，超出范围则在边缘
	OTHER = 7, -- 占位
}

--自定义标记类型
MarkCustomType =
{
	RedCircle = 0, -- 红圈
	BlueCircle = 1, -- 篮圈
	OTHER = 2, -- 占位
}

--图标层级
MarkLayerType =
{
	NORMAL = 0, -- 根据加入顺序
	FIRST = 1, -- 最底层
	LAST = 2, -- 最顶层
}

