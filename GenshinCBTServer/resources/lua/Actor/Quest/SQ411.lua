require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')
local Quest411 = class("Quest411", questActorProxy)
Quest411.defaultAlias = "Quest411"

local this = nil
local super = nil
local uActor = nil
local questID = 0


function Quest411:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end

function Quest411:OnPostInit()
	uActor = self.uActor
    super:OnPostInit()   
end



-- local config begin
local q411Cfg = require('Actor/Quest/Q411/Q411Config')
local subIDs = q411Cfg.SubIDs
local qinData = q411Cfg.QinData
local lisaData = q411Cfg.LisaData
local merchantData = q411Cfg.MerchantData
local paimonData = q411Cfg.PaimonData

-- local config end

function Quest411:CreateUActor(alias)    
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

function Quest411:EndSpeedField()
    for i=1, #q411Cfg.SpeedFieldPos do
        globalActor:UnSpawn("MuskSpeedField" .. tostring(i))
    end
end

function Quest411:StartSpeedField()
	print("StartSpeedField")
    for i=1, #q411Cfg.SpeedFieldPos do
        globalActor:SpawnGadget(70690001, q411Cfg.SpeedFieldPos[i], M.Dir2Euler(q411Cfg.SpeedFieldDir), "MuskSpeedField" .. tostring(i))
	end
	this:CallDelay(300,this.EndSpeedField)
end

-- local param begin
-- local param end

-- local method begin
local function OnStart41101()
    actorMgr:CreateActorWithPos(lisaData.Lisa, lisaData.LisaScript, lisaData.LisaID, 0, lisaData.bornPos, lisaData.bornDir, true, false)
end

local function OnStart41102()
    globalActor:UnSpawn("File")
    globalActor:SpawnItem(q411Cfg.ItemFileID, sceneData:GetDummyPoint(3,"Q411QinFilesPos").pos,nil,"File")
end

local function OnStart41104()
    globalActor:UnSpawn("JourneyNotes")
    globalActor:SpawnItem(q411Cfg.ItemJourneyNotesID, sceneData:GetDummyPoint(3,"Q411JourneyNotes").pos,nil,"JourneyNotes")
end

local function OnFinished41106()
    local paimonPos = actorUtils.GetAvatarPos()
    paimonPos.z = paimonPos.z+1
    local paimonRot = {x=0,y=0,z=-1}
    local paimon = actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, paimonPos, M.Dir2Euler(paimonRot), true, false)
    paimon:NarratorTask(q411Cfg.NarratorFlow1, -1, 30, paimon.Vanish)
    globalActor:StopLocalAvatar()
	this:PlayCutscene(q411Cfg.LookTimeCfg)
end

local function OnStart41107()
    local qin = actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, sceneData:GetDummyPoint(3,"Q411QingSing").pos, sceneData:GetDummyPoint(3,"Q411QingSing").rot, true, false)

end

local function OnFinished41107()    
    globalActor:StopLocalAvatar()
	this:PlayCutscene(q411Cfg.QinSingTimeCfg)
end

local function OnFinished41108()    
end

local function OnStart41109()
    globalActor:UnSpawn("Music1stHalf")
    globalActor:SpawnItem(q411Cfg.ItemMusic1stHalfID, sceneData:GetDummyPoint(3,"Q411QingSing").pos,nil,"Music1stHalf")
    local qin = actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, sceneData:GetDummyPoint(3,"Q411QinBorn").pos, sceneData:GetDummyPoint(3,"Q411QinBorn").rot, true, false)
    local paimonPos = actorUtils.GetAvatarPos()
    paimonPos.z = paimonPos.z+1
    local paimonRot = {x=0,y=0,z=-1}
    local paimon = actorMgr:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, paimonPos, M.Dir2Euler(paimonRot), true, false)
    paimon:NarratorTask(q411Cfg.NarratorFlow2, -1, 30, paimon.Vanish)
end

local function OnStart41113()
    local qin = actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, sceneData:GetDummyPoint(3,"Q411QinWaitOnCape").pos, sceneData:GetDummyPoint(3,"Q411QinWaitOnCape").rot, true, false)
    local merchant = actorMgr:CreateActorWithPos(merchantData.Merchant, merchantData.MerchantScript, merchantData.MerchantID, 0, sceneData:GetDummyPoint(3,"Q411Merchant").pos, sceneData:GetDummyPoint(3,"Q411Merchant").rot, true, false)
end

local function OnStart41114()
    local qin = actorMgr:GetActor(qinData.Qin)
    qin:RunToMerchant()
end

local function OnStart41115()
    local qin = actorMgr:GetActor(qinData.Qin)
    qin:RunToWatchSunRise()
end

local function OnFinished41115()
    globalActor:StopLocalAvatar()
	this:PlayCutscene(q411Cfg.SunRiseTimeCfg)
end

local function OnFinished41116()
    local qin = actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, sceneData:GetDummyPoint(3,"Q411QinBorn").pos, sceneData:GetDummyPoint(3,"Q411QinBorn").rot, true, false)
end

local function OnRewind41108()
    local qin = actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, sceneData:GetDummyPoint(3,"Q411QingSing").pos, sceneData:GetDummyPoint(3,"Q411QingSing").rot, true, false)
end

local function OnRewind41114()
    local qin = actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, sceneData:GetDummyPoint(3,"Q411QinWaitOnCape").pos, sceneData:GetDummyPoint(3,"Q411QinWaitOnCape").rot, true, false)
    local merchant = actorMgr:CreateActorWithPos(merchantData.Merchant, merchantData.MerchantScript, merchantData.MerchantID, 0, sceneData:GetDummyPoint(3,"Q411Merchant").pos, sceneData:GetDummyPoint(3,"Q411Merchant").rot, true, false)
end

local function OnRewind41115()
    local qin = actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, sceneData:GetDummyPoint(3,"Q411QinBuyMusic").pos, sceneData:GetDummyPoint(3,"Q411QinBuyMusic").rot, true, false)
end

local function OnRewind41116()
    local qin = actorMgr:CreateActorWithPos(qinData.Qin, qinData.QinScript, qinData.QinID, 0, sceneData:GetDummyPoint(3,"Q411QinWatchSunRise").pos, sceneData:GetDummyPoint(3,"Q411QinWatchSunRise").rot, true, false)
end

-- local method end

function Quest411:OnMainStart(quest)  
end

function Quest411:OnSubStart(quest)
    local questID = quest.QuestId
	if questID == subIDs.q41102 then
		OnStart41102()
	elseif questID == subIDs.q41104 then
		OnStart41104()
	elseif questID == subIDs.q41107 then
		OnStart41107()
	elseif questID == subIDs.q41109 then
        OnStart41109()
	elseif questID == subIDs.q41113 then
        OnStart41113()
	elseif questID == subIDs.q41114 then
        OnStart41114()
	elseif questID == subIDs.q41115 then
        OnStart41115()
    elseif questID == subIDs.q41101 then
		OnStart41101()
	end
end

function Quest411:OnSubFinished(quest)
    local questID = quest.QuestId
	if questID == subIDs.q41106 then
        OnFinished41106()
    elseif questID == subIDs.q41107 then
		OnFinished41107()
    elseif questID == subIDs.q41108 then
        OnFinished41108()
    elseif questID == subIDs.q41115 then
		OnFinished41115()
    end
end

function Quest411:OnRewind(quest)
    local questID = quest.QuestId
	if questID == subIDs.q41108 then
        OnRewind41108()
    elseif questID == subIDs.q41114 then
        OnRewind41114()
    elseif questID == subIDs.q41115 then
        OnRewind41115()
    elseif questID == subIDs.q41116 then
		OnRewind41116()
    end
end

function Quest411:OnMainFinished(quest)
    OnFinished41116()
end

function Quest411:Start()
end

function Quest411:OnDestroy()
end

return Quest411