----------------------
-- 这是Lua端GadgetFactory，包含了创建特殊GadgetActor的方法
-- @module GadgetFactory
actorMgr = actorMgr or require('Actor/ActorManager')

local GadgetFactory = {}

GadgetFactory.PATH_QUEST_AREA = "Actor/Gadget/QuestArea"

GadgetFactory.PostProcessCreateActor = function(alias, actor)
	local preAlias = actor:PreGetAlias()
	actor:OnPreInit()
	if alias == nil or alias == '' then
		if preAlias ~= nil then
			alias = preAlias
		else
			alias = actor.defaultAlias
		end
	end

	actor.alias = alias
	actorMgr.ActorDic[alias] = actor

	actor:OnInit(alias)
	actor:OnPostInit()
end

--- 创建任务区域
GadgetFactory.CreateQuestArea = function(alias, configID, bornPos, areaRadius, delayTime, OnAreaIn, OnAreaOut, OnAreaDelayOut)
	local actor = actorMgr:GetActor(alias)
	if actor ==  nil then
		local metaActor = require(GadgetFactory.PATH_QUEST_AREA)
		actor = metaActor:new()
		actor.configID = configID
		actor.bornPos = bornPos
		actor.areaRadius = areaRadius
		actor.targetTime = delayTime
		actor.questAreaInHandler = OnAreaIn
		actor.questAreaOutHandler = OnAreaOut
		actor.questAreaDelayOutHandler = OnAreaDelayOut
		actor.isAutoStart = true

		GadgetFactory.PostProcessCreateActor(alias, actor)
	else
		if actor.SetPos ~= nil then
			actor:SetPos(bornPos)
		end
	end
	return actor
end

return GadgetFactory