require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest357 = class("Quest357", questActorProxy)

Quest357.defaultAlias = "Quest357"
local DailyNpcManager = require('Actor/DailyNPCManager')
local q357Cfg = require('Quest/Client/Q357ClientConfig')

local AmborData = q357Cfg.AmborData
local GaiaData = q357Cfg.GaiaData
local Q357NPC1Data = q357Cfg.Q357NPC1Data
local Q357NPC2Data = q357Cfg.Q357NPC2Data
local Q357NPC3Data = q357Cfg.Q357NPC3Data
local Q357NPC4Data = q357Cfg.Q357NPC4Data
local Q357NPC5Data = q357Cfg.Q357NPC5Data
local Q357NPC6Data = q357Cfg.Q357NPC6Data

-- Generated
function Quest357:OnSubStartHandlerBuild()
	self.subStartHandlers = {}
	-- self.subStartHandlers["35701"] = self.OnSubStart35701
    -- self.subStartHandlers["35702"] = self.OnSubStart35702
    -- self.subStartHandlers["35703"] = self.OnSubStart35703
    -- self.subStartHandlers["35704"] = self.OnSubStart35704
    -- self.subStartHandlers["35705"] = self.OnSubStart35705
    -- self.subStartHandlers["35706"] = self.OnSubStart35706
    -- self.subStartHandlers["35707"] = self.OnSubStart35707
    -- self.subStartHandlers["35708"] = self.OnSubStart35708
    -- self.subStartHandlers["35709"] = self.OnSubStart35709
    -- self.subStartHandlers["35710"] = self.OnSubStart35710
    self.subStartHandlers["35711"] = self.OnSubStart35711
    self.subStartHandlers["35721"] = self.OnSubStart35721
    self.subStartHandlers["35722"] = self.OnSubStart35722
    self.subStartHandlers["35723"] = self.OnSubStart35723
    self.subStartHandlers["35724"] = self.OnSubStart35724
    self.subStartHandlers["35725"] = self.OnSubStart35725
end

function Quest357:OnSubFinishHandlerBuild()
	self.subFinishHandlers = {}
	-- self.subFinishHandlers["35701"] = self.OnSubFinish35701
    -- self.subFinishHandlers["35702"] = self.OnSubFinish35702
    -- self.subFinishHandlers["35703"] = self.OnSubFinish35703
    -- self.subFinishHandlers["35704"] = self.OnSubFinish35704
    -- self.subFinishHandlers["35705"] = self.OnSubFinish35705
    -- self.subFinishHandlers["35706"] = self.OnSubFinish35706
    -- self.subFinishHandlers["35707"] = self.OnSubFinish35707
    -- self.subFinishHandlers["35708"] = self.OnSubFinish35708
    -- self.subFinishHandlers["35709"] = self.OnSubFinish35709
    -- self.subFinishHandlers["35710"] = self.OnSubFinish35710
    self.subFinishHandlers["35711"] = self.OnSubFinish35711
    self.subFinishHandlers["35721"] = self.OnSubFinish35721
    self.subFinishHandlers["35722"] = self.OnSubFinish35722
    self.subFinishHandlers["35723"] = self.OnSubFinish35723
    self.subFinishHandlers["35724"] = self.OnSubFinish35724
    self.subFinishHandlers["35725"] = self.OnSubFinish35725
end

---sub start & finish 内调用的函数
--@region sub start & finish
function Quest357:GaiaVanish()
    local gaia = actorMgr:GetActor(GaiaData.Gaia)
    if gaia ~= nil then
        gaia:SetVisible(false)
    end
    local ambor = actorMgr:GetActor(AmborData.Ambor)
    if ambor ~= nil then
        ambor:SetVisible(false)
    end
end

function Quest357:AmborVanish()
    self:ShowBlackScreen(0.5, 1.0, 0.5, 
        function(self)
            local ambor = actorMgr:GetActor(AmborData.Ambor)
            if ambor ~= nil then
                ambor:Destroy(false)
            end
        end
    )
end

function Quest357:TotorialContent()
    local ambor = actorMgr:GetActor("Ambor")
    ambor:NarratorOnlyTask(q357Cfg.NarratorData.FlyTutorial)
end

function Quest357:NarratorFly()
    local AmborData = self.clientData.AmborData
    actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos3, AmborData.Dir3, true, false)
    self:ShowTutorialDialog(150)
    --self:ShowTutorialDialog(150, self.TotorialContent)
    --self:NarratorOnlyTask(self.clientData.NarratorData.FlyTutorial)
--[[     local TargetData = self.clientData.TargetData
    globalActor:UnSpawn(TargetData.Target4)
    globalActor:SpawnGadget(TargetData.TargetID, TargetData.Pos4, TargetData.Dir4, TargetData.Target4) ]]
end

function Quest357:FlyTutorial()
    self:ShowBlackScreen(1.0, 1.0, 2.0, self.NarratorFly, nil)
    local paimon = actorMgr:GetActor("Paimon")
	if paimon ~= nil then
		paimon:DestroyWithDisappear(false)
	end
--[[     local AmborData = self.clientData.AmborData
	actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos3, AmborData.Dir3, true, false)
    self:NarratorOnlyTask(self.clientData.NarratorData.FlyTutorial)
    local TargetData = self.clientData.TargetData
    --globalActor:UnSpawn(TargetData.Target4)
    globalActor:SpawnGadget(TargetData.TargetID, TargetData.Pos4, TargetData.Dir4, TargetData.Target4) ]]
end

function Quest357:BeforeShoot()
    self:ShowBlackScreen(1.0, 1.0, 2.0, self.ShootTutorial, nil)
end

function Quest357:ShootTutorial()
    local TargetData = self.clientData.TargetData
    globalActor:UnSpawn(TargetData.Target1)
    globalActor:UnSpawn(TargetData.Target2)
    globalActor:SpawnGadget(TargetData.TargetID, TargetData.Pos1, TargetData.Dir1, TargetData.Target1)
    globalActor:SpawnGadget(TargetData.TargetID, TargetData.Pos2, TargetData.Dir2, TargetData.Target2)
    --Temp Hide Paimon
    local PaimonData = self.clientData.PaimonData
	actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, PaimonData.hiddenPos, PaimonData.hiddenDir, true, false)
    local AmborData = self.clientData.AmborData
	actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.hiddenPos, AmborData.hiddenDir, true, false)
    self:NarratorOnlyTask(self.clientData.NarratorData.ShootTutorial)
end

function Quest357:Story1()
    self:NarratorOnlyTask(self.clientData.NarratorData.Story1, nil, "Story")
end

function Quest357:Story2()
    self:NarratorOnlyTask(self.clientData.NarratorData.Story2, nil, "Story")
end

function Quest357:On35701CutsceneFinish()
	local AmborData = self.clientData.AmborData
	self:RequestInteraction(AmborData.Ambor)
	local Stone3Data = self.clientData.Stone3Data
    globalActor:UnSpawn(Stone3Data.Stone3)
    globalActor:SpawnGadget(Stone3Data.StoneID, Stone3Data.Pos3, Stone3Data.Dir3, Stone3Data.Stone3)
    local TargetData = self.clientData.TargetData
    globalActor:UnSpawn(TargetData.Target3)
    globalActor:SpawnGadget(TargetData.TargetID, TargetData.Pos3, TargetData.Dir3, TargetData.Target3)
    --dragon fly
    self:PlayFreeCutscene(self.clientData.InterData.DragonCutScene,nil, nil)
end

function Quest357:On35722CutsceneFinish()
	local AmborData = self.clientData.AmborData

    self:TransmitPlayer(3, sceneData:GetDummyPoint(3,"Q35707Player").pos, sceneData:GetDummyPoint(3,"Q35707Player").rot, nil,
    function (self)
        actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos4, AmborData.Dir4, true, false) 
        self:PlayCutscene(self.clientData.InterData.Cutscene3,
            function (self)
                self:RequestInteraction(AmborData.Ambor)
            end
        )
    end
    )
end

function Quest357:DesStone4()
    local StoneData = self.clientData.SpecialStoneData
    globalActor:UnSpawn(StoneData.Stone4)
end
--@endregion

--老的一阶段脚本
--@region old quest sub start & finish handlers

---按流程触发顺序
--[[ function Quest357:OnSubStart35701(quest)
	print("35701 Start : Creat Ambor")
	local AmborData = self.clientData.AmborData
	actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos1, AmborData.Dir1, true, false)
	local StoneData = self.clientData.StoneData
	globalActor:UnSpawn("Stone")
	globalActor:SpawnGadget(StoneData.StoneID, StoneData.Pos1,StoneData.Dir1,"Stone")
end ]]

function Quest357:OnSubStart35701(quest)
    print("35701 Start : Creat Ambor & Environment")
--[[     -- creat stone
    local StoneData = self.clientData.StoneData
    globalActor:UnSpawn(StoneData.Stone3)
    globalActor:SpawnGadget(StoneData.StoneID, StoneData.Pos3, StoneData.Dir3, StoneData.Stone3) ]]
    local AmborData = self.clientData.AmborData
	actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos1, AmborData.Dir1, true, false)
    --play cutscene
    self:PlayCutscene(self.clientData.InterData.Cutscene2, self.On35701CutsceneFinish)
    --ambor run to first wind
    --creat wind
    local WindData = self.clientData.WindData
    local RiseDir = {x=0,y=0,z=0}
    globalActor:SpawnGadget(WindData.WindID, WindData.Pos1,M.Dir2Euler(RiseDir),WindData.Wind1)
    globalActor:SpawnGadget(WindData.WindID, WindData.Pos2,M.Dir2Euler(RiseDir),WindData.Wind2)
	globalActor:SpawnGadget(WindData.WindID, WindData.Pos3,M.Dir2Euler(RiseDir),WindData.Wind3)
	globalActor:SpawnGadget(WindData.WindID, WindData.Pos4,M.Dir2Euler(RiseDir),WindData.Wind4)
    globalActor:SpawnGadget(WindData.WindID, WindData.Pos5,M.Dir2Euler(RiseDir),WindData.Wind5)
    globalActor:SpawnGadget(WindData.WindID, WindData.Pos6,M.Dir2Euler(RiseDir),WindData.Wind6)
    globalActor:SpawnGadget(WindData.WindID, WindData.Pos7,M.Dir2Euler(RiseDir),WindData.Wind7)
    --creat skybox
    --local SkyboxData = self.clientData.SkyboxData
    --globalActor:SpawnLocalGadget("Skybox", SkyboxData.SkyboxID, SkyboxData.SkyboxPos, M.Dir2Euler(RiseDir))
    --change weather
    globalActor:ChangeWeather ("Blustery")
    --creat wall
    local WallData = self.clientData.WallData
    --globalActor:SpawnLocalGadget("Wall", WallData.WallID, WallData.WallPos, WallData.WallDir)
    globalActor:SpawnGadget(WallData.WallID, WallData.WallPos, WallData.WallDir,"Wall")
    --change music
    globalActor:PlayAudioState("StateGroup_musicEmotion", "State_musicAgitated")
    --dragon fly
    --self:PlayFreeCutscene(self.clientData.InterData.DragonCutScene,nil, nil)
    --creat Q357NPC
    actorMgr:CreateActorWithPos(Q357NPC1Data.Q357NPC1, Q357NPC1Data.Q357NPC1Script, Q357NPC1Data.Q357NPC1ID, 0, Q357NPC1Data.Pos1, Q357NPC1Data.Dir1, true, false)
    --local Q357NPC1 = actorMgr:GetActor("Q357NPC1")
    --Q357NPC1:DoFreeStyle(362)
    actorMgr:CreateActorWithPos(Q357NPC2Data.Q357NPC2, Q357NPC2Data.Q357NPC2Script, Q357NPC2Data.Q357NPC2ID, 0, Q357NPC2Data.Pos1, Q357NPC2Data.Dir1, true, false)
    --local Q357NPC2 = actorMgr:GetActor("Q357NPC2")
    --Q357NPC2:DoFreeStyle(362)
    actorMgr:CreateActorWithPos(Q357NPC3Data.Q357NPC3, Q357NPC3Data.Q357NPC3Script, Q357NPC3Data.Q357NPC3ID, 0, Q357NPC3Data.Pos1, Q357NPC3Data.Dir1, true, false)
    --local Q357NPC3 = actorMgr:GetActor("Q357NPC3")
    --Q357NPC3:DoFreeStyle(362)
    actorMgr:CreateActorWithPos(Q357NPC4Data.Q357NPC4, Q357NPC4Data.Q357NPC4Script, Q357NPC4Data.Q357NPC4ID, 0, Q357NPC4Data.Pos1, Q357NPC4Data.Dir1, true, false)
    --local Q357NPC4 = actorMgr:GetActor("Q357NPC4")
    --Q357NPC4:DoFreeStyle(362)
    actorMgr:CreateActorWithPos(Q357NPC5Data.Q357NPC5, Q357NPC5Data.Q357NPC5Script, Q357NPC5Data.Q357NPC5ID, 0, Q357NPC5Data.Pos1, Q357NPC5Data.Dir1, true, false)
    --local Q357NPC5 = actorMgr:GetActor("Q357NPC5")
    --Q357NPC5:DoFreeStyle(362)
    actorMgr:CreateActorWithPos(Q357NPC6Data.Q357NPC6, Q357NPC6Data.Q357NPC6Script, Q357NPC6Data.Q357NPC6ID, 0, Q357NPC6Data.Pos1, Q357NPC6Data.Dir1, true, false)
    --local Q357NPC6 = actorMgr:GetActor("Q357NPC6")
    --Q357NPC6:DoFreeStyle(362)
	print("-----------Notify NPC to Panic-----------")
    local MengdeNpcList=DailyNpcManager.GetMengdeNpcListSpecial()
    for i=1, #MengdeNpcList do
        self:NotifyTo(MengdeNpcList[i], DailyNpcManager.NpcEventType.HIDESELF, true)
    end
end

function Quest357:OnSubFinish35701(quest)
    print("35701 Finish : Hide Paimon")
    self:ActionSafeCall(
        function(self)
            local paimon = actorMgr:GetActor("Paimon")
            if paimon ~= nil then
                paimon:DestroyWithDisappear(false)
            end
        end
    )
end

function Quest357:OnSubFinish35702(quest)
    print("35702 Finish : Ambor Run")
    --dragon fly
    self:PlayFreeCutscene(self.clientData.InterData.DragonCutScene,nil, nil)
    --ambor run to first wind
    local ambor = actorMgr:GetActor(self.clientData.AmborData.Ambor)
    ambor:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
	ambor:RunToTask(self.clientData.AmborData.Pos2,
	function(actor, task)
		actor:ClearFollowTask()
        actor:ClearPriorityInter(InterTimingType.BTN)
        actor:Standby()
		actor:TurnTo(M.Euler2DirXZ(self.clientData.AmborData.Dir2))
	end
    )
    local TargetData = self.clientData.TargetData
    globalActor:UnSpawn(TargetData.Target3)
end

function Quest357:OnSubFinish35703(quest)
	print("35703 Finish : Creat Ambor & FlyTutorial")
	--local AmborData = self.clientData.AmborData
	--actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos3, AmborData.Dir3, true, false)
    --self:NarratorOnlyTask(self.clientData.NarratorData.FlyTutorial)
    self:ActionSafeCall(self.FlyTutorial)
end

function Quest357:OnSubFinish35704(quest)
	print("35704 Finish : Creat Stone")
--[[ 	local StoneData = self.clientData.StoneData
    globalActor:UnSpawn(StoneData.Stone1)
    globalActor:UnSpawn(StoneData.Stone2)
    globalActor:SpawnGadget(StoneData.StoneID, StoneData.Pos1, StoneData.Dir1, StoneData.Stone1)
    globalActor:SpawnGadget(StoneData.StoneID, StoneData.Pos2, StoneData.Dir2, StoneData.Stone2) ]]
--[[     local TargetData = self.clientData.TargetData
    globalActor:UnSpawn(TargetData.Target4) ]]
end

function Quest357:OnSubFinish35705(quest)
    print("35705 Finish : ShootTutorial")
    --local AmborData = self.clientData.AmborData
	--actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.hiddenPos, AmborData.hiddenDir, true, false)
    --self:NarratorOnlyTask(self.clientData.NarratorData.ShootTutorial)
    self:ActionSafeCall(self.BeforeShoot)
    --self:ActionSafeCall(self.ShootTutorial)
--[[     local TargetData = self.clientData.TargetData
    --globalActor:UnSpawn(TargetData.Target1)
    globalActor:SpawnGadget(TargetData.TargetID, TargetData.Pos1, TargetData.Dir1, TargetData.Target1)
    --Temp Hide Paimon
    local PaimonData = self.clientData.PaimonData
	actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, PaimonData.hiddenPos, PaimonData.hiddenDir, true, false)
 ]]
end

function Quest357:OnSubFinish35706(quest)
	print("35706 Finish : Story1")
    --self:NarratorOnlyTask(self.clientData.NarratorData.Story1, nil, "Story")
    self:ActionSafeCall(self.Story1)
    --local StoneData = self.clientData.StoneData
    --globalActor:UnSpawn(StoneData.Stone2)
    --globalActor:SpawnGadget(StoneData.StoneID, StoneData.Pos2, StoneData.Dir2, StoneData.Stone2)
    local TargetData = self.clientData.TargetData
    globalActor:UnSpawn(TargetData.Target1)
    --globalActor:SpawnGadget(TargetData.TargetID, TargetData.Pos2, TargetData.Dir2, TargetData.Target2)
end

function Quest357:OnSubFinish35707(quest)
    print("35707 Finish : Creat Stone 4th")
    local TargetData = self.clientData.TargetData
    globalActor:UnSpawn(TargetData.Target2)
    --globalActor:SpawnGadget(TargetData.TargetID, TargetData.Pos5, TargetData.Dir5, TargetData.Target5)
--[[ 	local StoneData = self.clientData.SpecialStoneData
    globalActor:UnSpawn(StoneData.Stone4)
    globalActor:SpawnGadget(StoneData.StoneID, StoneData.Pos4, StoneData.Dir4, StoneData.Stone4)
    self:NarratorOnlyTask(self.clientData.NarratorData.Story3, nil, "Story3") ]]
end

function Quest357:OnSubStart35709(quest)
    print("35709 Start : ")
    local Q357NPC1 = actorMgr:GetActor("Q357NPC1")
	if Q357NPC1 ~= nil then
		Q357NPC1:DestroyWithDisappear(false)
    end
    --actorMgr:CreateActorWithPos(Q357NPC2Data.Q357NPC2, Q357NPC2Data.Q357NPC2Script, Q357NPC2Data.Q357NPC2ID, 0, Q357NPC2Data.Pos1, Q357NPC2Data.Dir1, true, false)
    local Q357NPC2 = actorMgr:GetActor("Q357NPC2")
	if Q357NPC2 ~= nil then
		Q357NPC2:DestroyWithDisappear(false)
    end
    --actorMgr:CreateActorWithPos(Q357NPC3Data.Q357NPC3, Q357NPC3Data.Q357NPC3Script, Q357NPC3Data.Q357NPC3ID, 0, Q357NPC3Data.Pos1, Q357NPC3Data.Dir1, true, false)
    local Q357NPC3 = actorMgr:GetActor("Q357NPC3")
	if Q357NPC3 ~= nil then
		Q357NPC3:DestroyWithDisappear(false)
    end
    --actorMgr:CreateActorWithPos(Q357NPC4Data.Q357NPC4, Q357NPC4Data.Q357NPC4Script, Q357NPC4Data.Q357NPC4ID, 0, Q357NPC4Data.Pos1, Q357NPC4Data.Dir1, true, false)
    local Q357NPC4 = actorMgr:GetActor("Q357NPC4")
	if Q357NPC4 ~= nil then
		Q357NPC4:DestroyWithDisappear(false)
    end
    --actorMgr:CreateActorWithPos(Q357NPC5Data.Q357NPC5, Q357NPC5Data.Q357NPC5Script, Q357NPC5Data.Q357NPC5ID, 0, Q357NPC5Data.Pos1, Q357NPC5Data.Dir1, true, false)
    local Q357NPC5 = actorMgr:GetActor("Q357NPC5")
	if Q357NPC5 ~= nil then
		Q357NPC5:DestroyWithDisappear(false)
    end
    --actorMgr:CreateActorWithPos(Q357NPC6Data.Q357NPC6, Q357NPC6Data.Q357NPC6Script, Q357NPC6Data.Q357NPC6ID, 0, Q357NPC6Data.Pos1, Q357NPC6Data.Dir1, true, false)
    local Q357NPC6 = actorMgr:GetActor("Q357NPC6")
	if Q357NPC6 ~= nil then
		Q357NPC6:DestroyWithDisappear(false)
	end
    print("-----------Notify NPC to Daily-----------")
    local MengdeNpcList=DailyNpcManager.GetMengdeNpcListSpecial()
    for i=1, #MengdeNpcList do
        self:NotifyTo(MengdeNpcList[i], DailyNpcManager.NpcEventType.STARTDAILY, true)
    end    
end

function Quest357:OnSubStart35711(quest)
    print("35711 Finish : Creat Stone 4th")
    local TargetData = self.clientData.TargetData
    globalActor:SpawnGadget(TargetData.TargetID, TargetData.Pos5, TargetData.Dir5, TargetData.Target5)
	local StoneData = self.clientData.SpecialStoneData
    globalActor:UnSpawn(StoneData.Stone4)
    globalActor:SpawnGadget(StoneData.StoneID, StoneData.Pos4, StoneData.Dir4, StoneData.Stone4)
    local HitSphereData = self.clientData.HitSphereData
    globalActor:UnSpawn("HitSphere")
    globalActor:SpawnGadget(70300047, sceneData:GetDummyPoint(3,"Q357Stone3").pos, sceneData:GetDummyPoint(3,"Q357Stone3").rot, "HitSphere")
    --globalActor:SpawnGadget(HitSphereData.HitSphereID, HitSphereData.Pos, HitSphereData.Dir, HitSphereData.HitSphere)
    self:NarratorOnlyTask(self.clientData.NarratorData.Story3, nil, "Story3")
end

function Quest357:OnSubFinish35711(quest)
    print("35711 Finish : Cutscene")
    --destroy target5
    local TargetData = self.clientData.TargetData
    globalActor:UnSpawn(TargetData.Target5)
    --destroy wind
    globalActor:UnSpawn("Wind1")
    globalActor:UnSpawn("Wind2")
    globalActor:UnSpawn("Wind3")
    globalActor:UnSpawn("Wind4")
    globalActor:UnSpawn("Wind5")
    globalActor:UnSpawn("Wind6")
    globalActor:UnSpawn("Wind7")
    globalActor:UnSpawn("Wall")
    --globalActor:UnSpawn("Skybox")
    --stop dragon
    self:StopFreeCutscene(self.clientData.InterData.DragonCutScene, false)
    --change weather
    --globalActor:ChangeWeather ("ClearSky") 
    globalActor:LeaveWeather()
    --change music
    --globalActor:PlayAudioState("StateGroup_musicEmotion", "State_musicNormal")
    --creat ambor temp
    local AmborData = self.clientData.AmborData
	actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos4, AmborData.Dir4, true, false) 
    --creat gaia temp
    local GaiaData = self.clientData.GaiaData
    actorMgr:CreateActorWithPos(GaiaData.Gaia, GaiaData.GaiaScript, GaiaData.GaiaID, 0, GaiaData.Pos2, GaiaData.Dir2, true, false)
--[[ 	actorMgr:CreateActorWithPos(GaiaData.Gaia, GaiaData.GaiaScript, GaiaData.GaiaID, 0, GaiaData.Pos1, GaiaData.Dir1, true, false)
    local gaia = actorMgr:GetActor(self.clientData.GaiaData.Gaia)
    gaia:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
	gaia:RunToTask(self.clientData.GaiaData.Pos2,
	function(actor, task)
		actor:ClearFollowTask()
        actor:ClearPriorityInter(InterTimingType.BTN)
        actor:Standby()
		actor:TurnTo(M.Euler2DirXZ(self.clientData.GaiaData.Dir2))
	end
	) ]]
    --play cutscene
    self:PlayCutscene(self.clientData.InterData.Cutscene1, self.On35722CutsceneFinish)
    --destroy stone4
    self:CallDelay(2, self.DesStone4)
	--local StoneData = self.clientData.SpecialStoneData
    --globalActor:UnSpawn(StoneData.Stone4)
    --Destroy NPC
    --actorMgr:CreateActorWithPos(Q357NPC1Data.Q357NPC1, Q357NPC1Data.Q357NPC1Script, Q357NPC1Data.Q357NPC1ID, 0, Q357NPC1Data.Pos1, Q357NPC1Data.Dir1, true, false)
    local Q357NPC1 = actorMgr:GetActor("Q357NPC1")
	if Q357NPC1 ~= nil then
		Q357NPC1:DestroyWithDisappear(false)
    end
    --actorMgr:CreateActorWithPos(Q357NPC2Data.Q357NPC2, Q357NPC2Data.Q357NPC2Script, Q357NPC2Data.Q357NPC2ID, 0, Q357NPC2Data.Pos1, Q357NPC2Data.Dir1, true, false)
    local Q357NPC2 = actorMgr:GetActor("Q357NPC2")
	if Q357NPC2 ~= nil then
		Q357NPC2:DestroyWithDisappear(false)
    end
    --actorMgr:CreateActorWithPos(Q357NPC3Data.Q357NPC3, Q357NPC3Data.Q357NPC3Script, Q357NPC3Data.Q357NPC3ID, 0, Q357NPC3Data.Pos1, Q357NPC3Data.Dir1, true, false)
    local Q357NPC3 = actorMgr:GetActor("Q357NPC3")
	if Q357NPC3 ~= nil then
		Q357NPC3:DestroyWithDisappear(false)
    end
    --actorMgr:CreateActorWithPos(Q357NPC4Data.Q357NPC4, Q357NPC4Data.Q357NPC4Script, Q357NPC4Data.Q357NPC4ID, 0, Q357NPC4Data.Pos1, Q357NPC4Data.Dir1, true, false)
    local Q357NPC4 = actorMgr:GetActor("Q357NPC4")
	if Q357NPC4 ~= nil then
		Q357NPC4:DestroyWithDisappear(false)
    end
    --actorMgr:CreateActorWithPos(Q357NPC5Data.Q357NPC5, Q357NPC5Data.Q357NPC5Script, Q357NPC5Data.Q357NPC5ID, 0, Q357NPC5Data.Pos1, Q357NPC5Data.Dir1, true, false)
    local Q357NPC5 = actorMgr:GetActor("Q357NPC5")
	if Q357NPC5 ~= nil then
		Q357NPC5:DestroyWithDisappear(false)
    end
    --actorMgr:CreateActorWithPos(Q357NPC6Data.Q357NPC6, Q357NPC6Data.Q357NPC6Script, Q357NPC6Data.Q357NPC6ID, 0, Q357NPC6Data.Pos1, Q357NPC6Data.Dir1, true, false)
    local Q357NPC6 = actorMgr:GetActor("Q357NPC6")
	if Q357NPC6 ~= nil then
		Q357NPC6:DestroyWithDisappear(false)
	end
    --Notify NPC
    --[[print("-----------Notify NPC to Daily-----------")
    for i=1, #CfgMengdeDayPatrol.DummyPointData.NpcID do
        self:NotifyTo("MengdeDayPatrol" .. '_' .. tostring(i), 35702, false)
    end
    for i=1, #CfgMengdeInsomniaPatrol.DummyPointData.NpcID do
        self:NotifyTo("MengdeInsomniaPatrol" .. '_' .. tostring(i), 35702, false)
    end
    for i=1, #CfgMengdeDayStand.DummyPointData.NpcID do
        self:NotifyTo("MengdeDayStand" .. '_' .. tostring(i), 35702, false)
    end
    for i=1, #CfgMengdeNightStand.DummyPointData.NpcID do
        self:NotifyTo("MengdeNightStand" .. '_' .. tostring(i), 35702, false)
    end
    for i=1, #CfgMengdeNightSit.DummyPointData.NpcID do
        self:NotifyTo("MengdeNightSit" .. '_' .. tostring(i), 35702, false)
    end
    for i=1, #CfgMengdeInsomniaStand.DummyPointData.NpcID do
        self:NotifyTo("MengdeInsomniaStand" .. '_' .. tostring(i), 35702, false)
    end
    for i=1, #CfgMengdeDaySit.DummyPointData.NpcID do
        self:NotifyTo("MengdeDaySit" .. '_' .. tostring(i), 35702, true)
    end--]]
end

function Quest357:OnSubFinish35708(quest)
	print("35708 Finish : NPC Hide")
--[[     local AmborData = self.clientData.AmborData
    local ambor = actorMgr:GetActor(self.clientData.AmborData.Ambor)
    ambor:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
	ambor:RunToTask(self.clientData.AmborData.Pos5,
	function(actor, task)
		actor:ClearFollowTask()
        actor:ClearPriorityInter(InterTimingType.BTN)
        actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.hiddenPos, AmborData.hiddenDir, true, false)
	end
    )
    local GaiaData = self.clientData.GaiaData
    local gaia = actorMgr:GetActor(self.clientData.GaiaData.Gaia)
    gaia:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
	gaia:RunToTask(self.clientData.GaiaData.Pos3,
	function(actor, task)
		actor:ClearFollowTask()
        actor:ClearPriorityInter(InterTimingType.BTN)
        actorMgr:CreateActorWithPos(GaiaData.Gaia, GaiaData.GaiaScript, GaiaData.GaiaID, 0, GaiaData.hiddenPos, GaiaData.hiddenDir, true, false)	
	end
    ) ]]
    local AmborData = self.clientData.AmborData
    actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.hiddenPos, AmborData.hiddenDir, true, false)        
    local GaiaData = self.clientData.GaiaData
    actorMgr:CreateActorWithPos(GaiaData.Gaia, GaiaData.GaiaScript, GaiaData.GaiaID, 0, GaiaData.hiddenPos, GaiaData.hiddenDir, true, false)	    
    self:ActionSafeCall(
        function(self)
            local paimon = actorMgr:GetActor("Paimon")
            if paimon ~= nil then
                paimon:DestroyWithDisappear(false)
            end
        end
    )
end

function Quest357:OnSubFinish35709(quest)
	print("35709 Finish : Creat Paimon")
	local PaimonData = self.clientData.PaimonData
	actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, PaimonData.Pos1, PaimonData.Dir1, true, false)
    local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
    paimon:AddPriorityInter(InterTimingType.BTN, self.clientData.InterData.NoReplyInter)	
	paimon:RunToTask(self.clientData.PaimonData.Pos2,
	function(actor, task)
		actor:ClearFollowTask()
        actor:ClearPriorityInter(InterTimingType.BTN)
        --actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, PaimonData.hiddenPos, PaimonData.hiddenDir, true, false)
	end
	)
    --self:NarratorOnlyTask(self.clientData.NarratorData.Story2)
    self:ActionSafeCall(self.Story2)
end

--@endregion

function Quest357:OnSubStart35721(quest)
    print("35721 Start : Cutscene")
    -- self:PlayFreeCutscene(self.clientData.InterData.DragonCutScene)
    self:ActionSafeCall(
        function (self)
            local MengdeNpcList=DailyNpcManager.GetMengdeNpcListSpecial()
            for i=1, #MengdeNpcList do
                self:NotifyTo(MengdeNpcList[i], DailyNpcManager.NpcEventType.HIDESELF, true)
            end
            
            self:PlayCutscene(self.clientData.InterData.Cutscene2,
            function (self)
                globalActor:PlayerEnterDungeon(67, 2004)
            end
            )
        end
    )
end

function Quest357:OnSubStart35722(quest)
    print("35722 Start : ...")
end

function Quest357:OnSubStart35723(quest)
    print("35723 Start : ...")
    local AmborData = self.clientData.AmborData

    actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos4, AmborData.Dir4, true, false) 
    self:PlayCutscene(self.clientData.InterData.Cutscene3,
        function (self)
            self:RequestInteraction(AmborData.Ambor)
        end
    )
end

function Quest357:OnSubStart35724(quest)
    print("35724 Start : ...")
end

function Quest357:OnSubStart35725(quest)
    print("35724 Start : ...")
    self:PlayCutscene(q357Cfg.InterData.Cutscene1,
    function (self)
        self:TransmitPlayer(3, sceneData:GetDummyPoint(3,"Q35707Player").pos, sceneData:GetDummyPoint(3,"Q35707Player").rot)
    end
    )
end

function Quest357:OnSubFinish35721(quest)
	print("35721 Finish : ...")
end

function Quest357:OnSubFinish35722(quest)
    print("35722 Finish : ...")
end

function Quest357:OnSubFinish35723(quest)
    print("35723 Finish : ...")
    self:ActionSafeCall(
        function(self)
        self:ShowBlackScreen(0.5, 1.0, 0.5, 
            function(self)
                local ambor = actorMgr:GetActor(AmborData.Ambor)
                if ambor ~= nil then
                    ambor:Destroy(false)
                end
                
                local gaia = actorMgr:GetActor(GaiaData.Gaia)
                if gaia ~= nil then
                    gaia:Destroy(false)
                end

                local paimon = actorMgr:GetActor("Paimon")
                if paimon ~= nil then
                    paimon:Destroy(false)
                end
            end
        )
        end
    )
end

function Quest357:OnSubFinish35724(quest)
	print("35724 Finish : Creat Paimon")
end

function Quest357:OnSubFinish35725(quest)
end


function Quest357:InvokeOnInteraction(param)
    if param == 1 then
        print("Ambor & Kaeya Hide")
        local GaiaData = self.clientData.GaiaData
        local AmborData = self.clientData.AmborData

        local gaia = actorMgr:GetActor(self.clientData.GaiaData.Gaia)
        if gaia ~= nil then
            gaia:ClearFollowTask()
            gaia:WalkToTask(GaiaData.Pos4)
        end  

        local ambor = actorMgr:GetActor(self.clientData.AmborData.Ambor)
        if ambor ~= nil then
            ambor:ClearFollowTask()
            ambor:WalkToTask(AmborData.Pos6)
        end

        self:CallDelay(3,self.GaiaVanish)
    -- elseif param == 2 then
    --     print("Creat Stone")
    --     local StoneData = self.clientData.StoneData
    --     globalActor:UnSpawn(StoneData.Stone1)
    --     globalActor:SpawnGadget(StoneData.StoneID, StoneData.Pos1, StoneData.Dir1, StoneData.Stone1)
    --     local Stone2Data = self.clientData.Stone2Data
    --     globalActor:UnSpawn(Stone2Data.Stone2)
    --     globalActor:SpawnGadget(Stone2Data.StoneID, Stone2Data.Pos2, Stone2Data.Dir2, Stone2Data.Stone2)
    -- elseif param == 3 then
    --     print("Ambor Hide")
    --     local AmborData = self.clientData.AmborData
    --     local ambor = actorMgr:GetActor(self.clientData.AmborData.Ambor)
    --     if ambor ~= nil then
    --         ambor:ClearFollowTask()
    --         ambor:WalkToTask(AmborData.Pos7, Quest357.AmborVanish)
    --     end
    end
end

function Quest357:Start()
end

function Quest357:OnDestroy()
end

return Quest357