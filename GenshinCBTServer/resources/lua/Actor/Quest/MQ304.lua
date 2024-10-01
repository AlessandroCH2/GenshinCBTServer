require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest304 = class("Quest304", questActorProxy)

Quest304.defaultAlias = "Quest304"

local this = nil
local super = nil
local uActor = nil
local questID = 0

function Quest304:OnPreInit()
	this = self
	super = self.__super
	questID = this.mainQuestID
	super:OnPreInit()
end
function Quest304:OnPostInit()
	uActor = self.uActor
	super:OnPostInit()
end

-- local config begin
local q304Cfg = require('Actor/Quest/Q304/Q304Config')
local subIDs = q304Cfg.SubIDs
local amborData = q304Cfg.AmborData
local windData = q304Cfg.WindData
local featherData = q304Cfg.FeatherData
local dragonData = q304Cfg.DragonData
-- local config end

function Quest304:CreateUActor(alias)
	local uActor = actorUtils.CreateActor(self, ActorType.QUEST_ACTOR, alias)
	uActor = actorUtils.CreateQuestActor(questID, uActor)
	return uActor
end

-- local param begin
-- local param end

-- local method begin
local function FlyByCutscene()
	this:PlayFreeCutscene(q304Cfg.DragonCircleCutScene,nil, nil)
end

local function MengdeWindPrepare()
    print("MengdeFeahterPrepare")
    local RiseDir = {x=0,y=0,z=0}
    this:SpawnGadget(windData.WindGadgetID, windData.wind1Pos, M.Dir2Euler(RiseDir), "Wind1")
    this:SpawnGadget(windData.WindGadgetID, windData.wind2Pos, M.Dir2Euler(RiseDir), "Wind2")
    this:SpawnGadget(windData.WindGadgetID, windData.wind3Pos, M.Dir2Euler(RiseDir), "Wind3")
    this:SpawnGadget(windData.WindGadgetID, windData.wind4Pos, M.Dir2Euler(RiseDir), "Wind4")
    this:SpawnGadget(windData.WindGadgetID, windData.wind5Pos, M.Dir2Euler(RiseDir), "Wind5")
    this:SpawnGadget(windData.WindGadgetID, windData.wind6Pos, M.Dir2Euler(RiseDir), "Wind6")
    this:SpawnGadget(windData.WindGadgetID, windData.wind7Pos, M.Dir2Euler(RiseDir), "Wind7")
    this:SpawnGadget(windData.WindGadgetID, windData.wind8Pos, M.Dir2Euler(RiseDir), "Wind8")
    this:SpawnGadget(windData.WindGadgetID, windData.wind9Pos, M.Dir2Euler(RiseDir), "Wind9")
    this:SpawnGadget(windData.WindGadgetID, windData.wind10Pos, M.Dir2Euler(RiseDir), "Wind10")
    this:SpawnGadget(windData.WindGadgetID, windData.wind11Pos, M.Dir2Euler(RiseDir), "Wind11")
    this:SpawnGadget(windData.WindGadgetID, windData.wind12Pos, M.Dir2Euler(RiseDir), "Wind12")
    this:SpawnGadget(windData.WindGadgetID, windData.wind13Pos, M.Dir2Euler(RiseDir), "Wind13")

    -- this:SpawnGadget(windData.WallGadgetID, windData.WallPos, M.Dir2Euler(RiseDir), "Wall")
    this:SpawnLocalGadget("Wall", windData.WallGadgetID, windData.WallPos, M.Dir2Euler(RiseDir))

    this:SpawnLocalGadget("Skybox", windData.SkyboxGadgetID, windData.SkyboxPos, M.Dir2Euler(RiseDir))

    --local Dragon = actorMgr:CreateActorWithPos(dragonData.Dragon, dragonData.DragonScript, dragonData.DragonID, 0, dragonData.DragonPos[1], dragonData.DragonDir[1], true, false)
    --Dragon:FlyCircle()
    --Dragon:FlyByCutscene()
    FlyByCutscene()

    globalActor:ChangeWeather ("Blustery")
end

local function MengdeWindDestroy()
    print("MengdeFeahterDestroy")
    globalActor:UnSpawn("Wind1")
    globalActor:UnSpawn("Wind2")
    globalActor:UnSpawn("Wind3")
    globalActor:UnSpawn("Wind4")
    globalActor:UnSpawn("Wind5")
    globalActor:UnSpawn("Wind6")
    globalActor:UnSpawn("Wind7")
    globalActor:UnSpawn("Wind8")
    globalActor:UnSpawn("Wind9")
    globalActor:UnSpawn("Wind10")
    globalActor:UnSpawn("Wind11")
    globalActor:UnSpawn("Wind12")
    globalActor:UnSpawn("Wind13")

    globalActor:UnSpawn("Wall")
    globalActor:UnSpawn("Skybox")

    this:StopFreeCutscene(q304Cfg.DragonCircleCutScene, false)

    -- local Dragon = actorMgr:GetActor(dragonData.Dragon)
    -- if Dragon ~= nil then
    --     Dragon:Destroy(false)
    -- end

    globalActor:ChangeWeather ("ClearSky")

end

local function AmborHide(actor)
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.hiddenPos, amborData.hiddenDir, 
        true, false, nil, false)
end

local function AmborFeather1(actor)
    local Ambor = actorMgr:GetActor(amborData.Ambor)
    -- local Ambor = actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.arguePos, amborData.argueDir, true, false)
    -- actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.feather1Pos, amborData.feather1Dir, true, false)
	Ambor:AddPriorityInter(InterTimingType.BTN, q304Cfg.AmborNoReplyInter)	
	Ambor:RunToTask(amborData.feather1Pos, 
	function(self, task)
		self:ClearFollowTask()
		self:ClearPriorityInter(InterTimingType.BTN)
        -- actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.feather1Pos, amborData.feather1Dir, true, false)
	end
	)
end

local function OnStart30400()
    MengdeWindPrepare()
end

local function OnFinished30400(quest)
    this:ActionSafeCall(AmborFeather1)
end

local function OnStart30401(quest)
end

local function OnStart30402(quest)
    this:ActionSafeCall(AmborHide)
    this:SpawnGadget(featherData.FeatherGadgetID, featherData.feather1Pos, featherData.feather1Dir, "Feather1")
end

local function OnStart30403()
    this:NarratorOnlyTask(q304Cfg.AmborNarratorFlow1)
    local quest = actorMgr:GetActor(q304Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(false, nil)
    end
end

local function OnStart30404(quest)
    this:SpawnGadget(featherData.FeatherGadgetID, featherData.feather2Pos, featherData.feather2Dir, "Feather2")
end

local function OnStart30405()
    this:NarratorOnlyTask(q304Cfg.AmborNarratorFlow2)
    local quest = actorMgr:GetActor(q304Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(false, nil)
    end
end

local function OnStart30406(quest)
    this:SpawnGadget(featherData.FeatherGadgetID, featherData.feather3Pos, featherData.feather3Dir, "Feather3")
end

local function OnStart30407()
    this:NarratorOnlyTask(q304Cfg.AmborNarratorFlow3)
    local quest = actorMgr:GetActor(q304Cfg.ActorAlias)
    if quest ~= nil then
        quest:FinishQuest(false, nil)
    end
end

local function OnStart30408(quest)
    this:SpawnGadget(featherData.FeatherGadgetID, featherData.feather4Pos, featherData.feather4Dir, "Feather4")
end

local function OnStart30409()
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.feather4Pos, amborData.feather4Dir, true, false)
    MengdeWindDestroy()
end

local function OnRewind30401()
    actorMgr:CreateActorWithPos(amborData.Ambor, amborData.AmborScript, amborData.AmborID, 0, amborData.feather1Pos, amborData.feather1Dir, true, false)
    MengdeWindPrepare()
end

local function OnRewind30403()
    MengdeWindPrepare()
end

local function OnRewind30405()
    MengdeWindPrepare()
end

local function OnRewind30407()
    MengdeWindPrepare()
end

-- local method end


function Quest304:OnMainStart(quest)

end

function Quest304:OnSubStart(quest)
	local questID = quest.QuestId
	if questID == subIDs.q30401 then
		OnStart30401(quest)
	elseif questID == subIDs.q30402 then
		OnStart30402(quest)
	elseif questID == subIDs.q30403 then
		OnStart30403()
	elseif questID == subIDs.q30404 then
        OnStart30404(quest)
    elseif questID == subIDs.q30405 then
        OnStart30405()
    elseif questID == subIDs.q30406 then
        OnStart30406(quest)
    elseif questID == subIDs.q30407 then
        OnStart30407()
    elseif questID == subIDs.q30408 then
        OnStart30408(quest)
    elseif questID == subIDs.q30409 then
        OnStart30409()
    elseif questID == subIDs.q30400 then
        OnStart30400()
	end
end

function Quest304:OnSubFinished(quest)
    local questID = quest.QuestId
	if questID == subIDs.q30400 then
		OnFinished30400(quest)
	end
end

function Quest304:OnRewind30403(quest)
	local questID = quest.QuestId
	if questID == subIDs.q30403 then
		OnRewind30403()
	elseif questID == subIDs.q30405 then
        OnRewind30405()
    elseif questID == subIDs.q30407 then
        OnRewind30407()
    elseif questID == subIDs.q30401 then
		OnRewind30401()
	end
end

function Quest304:OnMainFinished(quest)
end

function Quest304:Start()
end

function Quest304:OnDestroy()
end

return Quest304