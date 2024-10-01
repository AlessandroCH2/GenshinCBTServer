require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')
local Quest412 = class("Quest412", questActorProxy)
Quest412.defaultAlias = "Quest412"

local this = nil
local super = nil
local uActor = nil
local questID = 0


function Quest412:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest412:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q412Cfg = require('Actor/Quest/Q412/Q412Config')
local subIDs = q412Cfg.SubIDs
local gaiaData = q412Cfg.GaiaData

-- local config end

function Quest412:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

function Quest412:GaiaToHide()
    print("GaiaToHidePos")
	local gaia = actorMgr:GetActor(gaiaData.Gaia)
	gaia:ClearFollowTask()
	gaia:ClearPriorityInter(InterTimingType.BTN)
	actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.hidePos, gaiaData.hideDir, true, false)
    -- gaia:SetPos(gaiaData.hidePos)
end

function Quest412:GaiaToObserve()
    print("GaiaToObservePos")
	local gaia = actorMgr:GetActor(gaiaData.Gaia)
	gaia:ClearFollowTask()
	gaia:ClearPriorityInter(InterTimingType.BTN)
	actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.observePos, gaiaData.observeDir, true, false)
    -- gaia:SetPos(gaiaData.hidePos)
end

function Quest412:GaiaToAnswer()
    print("GaiaToAnswerPos")
	local gaia = actorMgr:GetActor(gaiaData.Gaia)
	gaia:ClearFollowTask()
	gaia:ClearPriorityInter(InterTimingType.BTN)
	actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.answerPos, gaiaData.answerDir, true, false)
    -- gaia:SetPos(gaiaData.hidePos)
end

-- local param begin
-- local param end

-- local method begin
local function RunGaia(actor)
	local gaia = actorMgr:GetActor(gaiaData.Gaia)
	--gaia:RunTo(sceneData:GetDummyPoint(3, "Q412GaiaRun").pos)
	gaia:RunToTask(sceneData:GetDummyPoint(3, "Q412GaiaRun").pos,
	function(self, task)
		self:Standby()
	end
    )
	gaia:AddPriorityInter(InterTimingType.BTN, q412Cfg.GaiaNoReplyInter)	
	this:CallDelay(5,this.GaiaToHide)
end

local function OnStart41200()
    print("41200 start: Gaia Create")
    actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.bornPos, gaiaData.bornDir, true, false)

end

local function OnFinished41201(quest)
	print("OnFinished41201: Gaia to RunPos")
	this:ActionSafeCall(RunGaia)
   
end

local function OnStart41203()
	print("OnStart41203: Create questarea")
	local questArea = gadgetFactory.CreateQuestArea("QuestCenter1", 0, sceneData:GetDummyPoint(3, "Q412QuestCenter1").pos, 50, 10, 
		function(area)
			print("ImIn")
		end,
		function(area)
			print("ImOut")
			actorUtils.ShowMessage("正在离开任务区域，请尽快返回")
		end,
		function(area)
			print("ImDelayOut")
			actorUtils.ShowMessage("已离开任务区域，任务失败")
			local quest = actorMgr:GetActor(q412Cfg.ActorAlias)
			if quest ~= nil then
				quest:UnFinishQuest(true, nil)
			end
		end)
end

local function OnFinished41203()
	print("OnStart41203: Destroy questarea")
	local questArea = actorMgr:GetActor("QuestCenter1")
	questArea:DestroySelf()
end

local function OnFinished41204()
	print("OnFinished41204: Gaia to Run2Pos to ObservePos")
	local gaia = actorMgr:GetActor(gaiaData.Gaia)
	gaia:RunToTask(sceneData:GetDummyPoint(3, "Q412GaiaRun2").pos,
	function(self, task)
		self:Standby()
	end
	)
	gaia:AddPriorityInter(InterTimingType.BTN, q412Cfg.GaiaNoReplyInter)	
	this:CallDelay(5,this.GaiaToObserve)
   
end

--[[ local function OnStart41205()
	print("OnStart41205: Gaia to ObservePos")
    actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.observePos, gaiaData.observeDir, true, false)
	
end ]]

local function OnStart41206()
	print("OnStart41206: Create questarea")
	local questArea = gadgetFactory.CreateQuestArea("QuestCenter2", 0, sceneData:GetDummyPoint(3, "Q412QuestCenter2").pos, 80, 10, 
		function(area)
			print("ImIn")
		end,
		function(area)
			print("ImOut")
			actorUtils.ShowMessage("正在离开任务区域，请尽快返回")
		end,
		function(area)
			print("ImDelayOut")
			actorUtils.ShowMessage("已离开任务区域，任务失败")
			local quest = actorMgr:GetActor(q412Cfg.ActorAlias)
			if quest ~= nil then
				quest:UnFinishQuest(true, nil)
			end
		end)
end

local function OnFinished41206()
	print("OnStart41206: Destroy questarea")
	local questArea = actorMgr:GetActor("QuestCenter2")
	questArea:DestroySelf()
end

local function OnStart41207()
	print("OnStart41207: Gaia to ObservePos")
    actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.observePos, gaiaData.observeDir, true, false)
	
end

local function OnFinished41207()
	print("Onfinished41207: Gaia to AskPos to AnswerPos")
	local gaia = actorMgr:GetActor(gaiaData.Gaia)
	gaia:RunToTask(sceneData:GetDummyPoint(3, "Q412GaiaAsk").pos,
	function(self, task)
		self:Standby()
	end
	)
	gaia:AddPriorityInter(InterTimingType.BTN, q412Cfg.GaiaNoReplyInter)	
	this:CallDelay(5,this.GaiaToAnswer)
   
end	

local function OnFinished41210()
	print("Onfinished41210: Gaia to BornPos")
    actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.bornPos, gaiaData.bornDir, true, false)	
   
end	

--[[ local function OnStart41208()
	print("OnStart41207: Gaia to AnswerPos")
    actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.answerPos, gaiaData.answerDir, true, false)
	
end ]]

local function OnRewind41200()
    print("OnRewind41200: Gaia Create")
    actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.bornPos, gaiaData.bornDir, true, false)
end

local function OnRewind41202()
    print("OnRewind41202: Gaia Create")
    actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.hidePos, gaiaData.hideDir, true, false)
end

local function OnRewind41205()
    print("OnRewind41205: Gaia Create")
    actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.observePos, gaiaData.observeDir, true, false)
end

local function OnRewind41208()
    print("OnRewind41208: Gaia Create")
    actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.answerPos, gaiaData.answerDir, true, false)
end

--local function OnStart41202()
    -- print("41202 start: Gaia Create")
    -- actorMgr:CreateActorWithPos(gaiaData.Gaia, gaiaData.GaiaScript, gaiaData.GaiaID, 0, gaiaData.hidePos, gaiaData.hideDir, true, false)

--end


--[[local function Gaia41205:Vanish()
	print("Gaia41204:Vanish()")
	self:RunToTask(gaiaData.vanishPos, 
		function(self, task)
			self:Destroy(false)
		end
	)
end
--]]

-- local method end

function Quest412:OnMainStart(quest)

end

function Quest412:OnSubStart(quest)
	local questID = quest.QuestId
	if questID == subIDs.q41200 then
		OnStart41200()		
	elseif questID == subIDs.q41203 then
		OnStart41203()
	elseif questID == subIDs.q41206 then
		OnStart41206()
	elseif questID == subIDs.q41207 then
		OnStart41207()
--[[ 	elseif questID == subIDs.q41209 then
		OnStart41209() ]]
	end
end

function Quest412:OnSubFinished(quest)
    local questID = quest.QuestId		
	if questID == subIDs.q41201 then
		OnFinished41201(quest)
	elseif questID == subIDs.q41203 then 
		OnFinished41203()
	elseif questID == subIDs.q41204 then 
		OnFinished41204()
	elseif questID == subIDs.q41206 then 
		OnFinished41206()
	elseif questID == subIDs.q41207 then 
		OnFinished41207()
	elseif questID == subIDs.q41210 then 
		OnFinished41210()
	end
end

function Quest412:OnRewind(quest)
    local questID = quest.QuestId
	if questID == subIDs.q41200 then
        OnRewind41200()
    elseif questID == subIDs.q41202 then
        OnRewind41202()
    elseif questID == subIDs.q41205 then
        OnRewind41205()
    elseif questID == subIDs.q41208 then
		OnRewind41208()
	end
end


function Quest412:OnMainFinished(quest)
end

function Quest412:Start()
end

function Quest412:OnDestroy()
end

return Quest412