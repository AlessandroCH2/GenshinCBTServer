--************************************************************************
--  工具自动生成的类型定义代码(UTF-8 With BOM)，请勿编辑！
--  File Name:    ConfigCutscene.lua
--  Purpose:      lua类型定义文件
--  Copyright (c) 2017-2100 miHoYo.com, Inc. All rights reserved.
--************************************************************************

--Cutscene类型
CutsceneType =
{
	NONE = 0, -- 无
	TIME_LINE_ASSET = 1, -- 基于Timeline Asset的Cutscene
	TIME_LINE_PREFAB = 2, -- 基于Timeline Prefab的Cutscene
	TIME_LINE_SCENE = 3, -- 基于Timeline Scene的Cutscene
	Other = 4, -- 占位
}

--Cutscene初始点类型
CutsceneInitPosType =
{
	FREE = 0, -- 相对预制本身的偏移
	RELATIVE_TO_LOCAL_AVATAR = 1, -- 先挪到主角位置，再做偏移
	Other = 2, -- 占位
}

