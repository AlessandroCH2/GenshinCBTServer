require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest504 = class("Quest504", questActorProxy)

Quest504.defaultAlias = "Quest504"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest504:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest504:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q504Cfg = require('Actor/Quest/Q504/Q504Config')
local subIDs = q504Cfg.SubIDs
local seal1ID = q504Cfg.Seal1ID
local seal2ID = q504Cfg.Seal2ID
local sealPos = q504Cfg.SealPos
local wendyData = q504Cfg.WendyData
local qinData = q504Cfg.QinData
local dilucData = q504Cfg.DilucData

-- local config end

function Quest504:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

function Quest504:On50402CutsceneFinish()
	this:CallDelay(3,
	    function (this)
		this:NarratorOnlyTask(q504Cfg.Story2)
		end
	)
end

-- local param begin
-- local param end

-- local method begin

local function OnStart50401()
	print("50401 start:......")
	-- actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos2, wendyData.bornDir2, true)
    -- actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos2, dilucData.bornDir2, true)
    -- actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos2, qinData.bornDir2, true)
end

local function OnStart50402()
	print("50402 start:......")
end

local function OnStart50403()
	print("50403 start:......")
-- 	this:SpawnGadget(70900201, wendyData.bornPos, wendyData.bornDir, "Quest50403Target")
-- 	this:ShowBlackScreen(0.5, 1.0, 0.5,
-- 		function (this)
-- 			local qin = actorMgr:GetActor(qinData.Qin)
-- 			local diluc = actorMgr:GetActor(dilucData.Diluc)
-- 			local wendy = actorMgr:GetActor(wendyData.Wendy)
-- 			local paimon = actorMgr:GetActor("Paimon")

-- 			if qin ~= nil then
-- 				qin:Destroy(false)
-- 			end

-- 			if diluc ~= nil then
-- 				diluc:Destroy(false)
-- 			end

-- 			if wendy ~= nil then
-- 				wendy:Destroy(false)
-- 			end

-- 			if paimon ~= nil then
-- 				paimon:Destroy(false)
-- 			end
-- 		end
-- 	)
end

local function OnStart50404()
	print("50404 start:......")
end

-- local function OnStart50405()
-- 	globalActor:UnSpawn("Seal1")
-- 	print("50404 start: Seal1 Create")
-- 	globalActor:SpawnItem(q504Cfg.Seal1ID, q504Cfg.SealPos, 0, "Seal1")
-- end

-- local function OnStart50406()

-- end

local function OnStart50407()
	print("50407 start:......")
end


local function OnFinished50401()
	print("50401 finishi:......")
    this:NarratorOnlyTask(q504Cfg.Story1)
	this:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q504Target1").pos, 0, 3, true) 
end

local function OnFinished50402()
	print("50402 finishi: Play CutScene1")
	this:ActionSafeCall(
	    this:TransmitPlayer(3, sceneData:GetDummyPoint(3,"Q504Target1").pos, sceneData:GetDummyPoint(3,"Q504Target1").rot, nil, 
		    function (this)
		        actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos2, wendyData.bornDir2, true)
                actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos2, dilucData.bornDir2, true)
                actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos2, qinData.bornDir2, true)
		    end
	    )
    )
	-- this:ActionSafeCall(
	-- 	function (this)
	--     this:PlayCutscene(q504Cfg.LairDisplay02TimeCfg,this.On50402CutsceneFinish,nil)
	--     local paimon = actorMgr:GetActor("Paimon")
	--         if paimon ~= nil then
	-- 	    paimon:DestroyWithDisappear(false)
	-- 		end
	-- 	end
	-- )
end

local function OnFinished50403()
	print("50403 finishi: Creat Wendy, Diluc, Qin")
	actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)
    actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true)
end


local function OnFinished50404()
	print("50404 finishi:......")
	this:UnSpawn("Quest50403Target")
	local paimon = actorMgr:GetActor("Paimon")
	if paimon ~= nil then
		paimon:DestroyWithDisappear(false)
	end
end

-- local function OnFinished50405()
-- 	print("50404 finish: Seal1 Destroy")
-- 	globalActor:UnSpawn("Seal1")
-- end

-- local function OnFinished50406()
-- 	this:ActionSafeCall(
--         function(self)
--             local diluc = actorMgr:GetActor(dilucData.Diluc)
--             if diluc ~= nil then
--   				diluc:Destroy(false)
--             end
--         end
--     )
--     this:ActionSafeCall(
--         function(self)
--             local wendy = actorMgr:GetActor(wendyData.Wendy)
--             if wendy ~= nil then
-- 				wendy:Destroy(false)
-- 		 	end
--         end
-- 	)
-- 	this:ActionSafeCall(
--         function(self)
--             local qin = actorMgr:GetActor(qinData.Qin)
--             if qin ~= nil then
-- 				qin:Destroy(false)
-- 		 	end
--         end
--     )
-- end

local function OnFinished50407()
	this:SpawnGadget(70900201, wendyData.bornPos, wendyData.bornDir, "Quest50403Target")
	this:ShowBlackScreen(0.5, 1.0, 0.5,
		function (this)
			local qin = actorMgr:GetActor(qinData.Qin)
			local diluc = actorMgr:GetActor(dilucData.Diluc)
			local wendy = actorMgr:GetActor(wendyData.Wendy)
			local paimon = actorMgr:GetActor("Paimon")

			if qin ~= nil then
				qin:Destroy(false)
			end

			if diluc ~= nil then
				diluc:Destroy(false)
			end

			if wendy ~= nil then
				wendy:Destroy(false)
			end

			if paimon ~= nil then
				paimon:Destroy(false)
			end
		end
	)
end


local function OnRewind50404()
	print("50404 Rewind: Creat Wendy, Diluc, Qin")
	actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)
    actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)
    actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true)
end

-- local function OnRewind50405()
-- 	actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)
--     actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)
--     actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true)
-- end

-- local function OnRewind50406()
-- 	actorMgr:CreateActorWithPos(wendyData.Wendy, wendyData.WendyScript, wendyData.WendyID, 0, wendyData.bornPos, wendyData.bornDir, true)
--     actorMgr:CreateActorWithPos(dilucData.Diluc, dilucData.DilucScript, dilucData.DilucID, 0, dilucData.bornPos, dilucData.bornDir, true)
--     actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, qinData.bornPos, qinData.bornDir, true)
-- end

-- local method end

function Quest504:OnMainStart(quest)
end

function Quest504:OnSubStart(quest)
    local questID = quest.QuestId
	if questID == subIDs.q50401 then
		OnStart50401()
	elseif questID == subIDs.q50402 then
		OnStart50402()
	elseif questID == subIDs.q50403 then
		OnStart50403()
	elseif questID == subIDs.q50404 then
		OnStart50404()
	-- elseif questID == subIDs.q50405 then
	-- 	OnStart50405()
	-- elseif questID == subIDs.q50406 then
	-- 	OnStart50406()
    elseif questID == subIDs.q50407 then
    	OnStart50407()
    end
end

function Quest504:OnSubFinished(quest)
    local questID = quest.QuestId
	if questID == subIDs.q50401 then
		OnFinished50401()
	elseif questID == subIDs.q50402 then
		OnFinished50402()
	elseif questID == subIDs.q50403 then
		OnFinished50403()
	elseif questID == subIDs.q50404 then
		OnFinished50404()
	-- elseif questID == subIDs.q50405 then
	-- 	OnFinished50405()
	-- elseif questID == subIDs.q50406 then
	-- 	OnFinished50406()
    elseif questID == subIDs.q50407 then
	    OnFinished50407()
    end
end

function Quest504:OnRewind(quest)
	local questID = quest.QuestId
	if questID == subIDs.q50404 then
		OnRewind50404()
	-- elseif questID == subIDs.q50405 then
	-- 	OnRewind50405()
	-- elseif questID == subIDs.q50406 then
	-- 	OnRewind50406()
	end
end

function Quest504:OnMainFinished(quest)
end

function Quest504:Start()
end

function Quest504:OnDestroy()
end

return Quest504
