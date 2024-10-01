require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest353 = class("Quest353", questActorProxy)

Quest353.defaultAlias = "Quest353"

local q353Cfg = require('Quest/Client/Q353ClientConfig')

-- Generated
function Quest353:OnSubStartHandlerBuild()
    self.subStartHandlers = {}
    --self.subStartHandlers["35300"] = self.OnSubStart35300
	self.subStartHandlers["35301"] = self.OnSubStart35301
    self.subStartHandlers["35302"] = self.OnSubStart35302
    self.subStartHandlers["35303"] = self.OnSubStart35303
    self.subStartHandlers["35304"] = self.OnSubStart35304
    --self.subStartHandlers["35305"] = self.OnSubStart35305
    --self.subStartHandlers["35306"] = self.OnSubStart35306
    --self.subStartHandlers["35307"] = self.OnSubStart35307
    --self.subStartHandlers["35308"] = self.OnSubStart35308
	self.subStartHandlers["35309"] = self.OnSubStart35309
	self.subStartHandlers["35310"] = self.OnSubStart35310
	self.subStartHandlers["35311"] = self.OnSubStart35311
	self.subStartHandlers["35312"] = self.OnSubStart35312
end

function Quest353:OnSubFinishHandlerBuild()
    self.subFinishHandlers = {}
    --self.subFinishHandlers["35300"] = self.OnSubFinish35300
	self.subFinishHandlers["35301"] = self.OnSubFinish35301
    self.subFinishHandlers["35302"] = self.OnSubFinish35302
    self.subFinishHandlers["35303"] = self.OnSubFinish35303
    self.subFinishHandlers["35304"] = self.OnSubFinish35304
    --self.subFinishHandlers["35305"] = self.OnSubFinish35305
    --self.subFinishHandlers["35306"] = self.OnSubFinish35306
    --self.subFinishHandlers["35307"] = self.OnSubFinish35307
    --self.subFinishHandlers["35308"] = self.OnSubFinish35308
    self.subFinishHandlers["35309"] = self.OnSubFinish35309
    self.subFinishHandlers["35310"] = self.OnSubFinish35310
	self.subFinishHandlers["35311"] = self.OnSubFinish35311
	self.subFinishHandlers["35312"] = self.OnSubFinish35312
end

---sub start & finish 内调用的函数
function Quest353:ShowTutorial(actor)
--[[     self:ShowTutorialDialog(102)
	self:NarratorOnlyTask(self.clientData.NarratorData.Story1) ]]
end

local goddessActor;
local goddessInitPos;
function Quest353:ShowGoddess()
	if goddessActor ~= nil then
		goddessActor:SetPos(goddessInitPos)
		goddessActor = nil
	end
end

function Quest353:HideGoddess()
	goddessActor = actorMgr:GetActor("Goddess_3003")
	if goddessActor == nil or goddessActor == actorMgr.dummyActor then
		goddessActor = nil
		print("can not find Goddess_3003")
	else
		goddessInitPos = goddessActor:GetPos()
		goddessActor:SetPos(M.Pos(goddessInitPos.x, goddessInitPos.y + 100, goddessInitPos.z))
	end
end

function Quest353:On35309CutsceneFinish()
    local PaimonData = self.clientData.PaimonData
	actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, PaimonData.Pos4, PaimonData.Dir4, true, false)
    self:RequestInteraction(PaimonData.Paimon)
    self:ShowGoddess() --还原女神像
	print("Finish quest to unlock Goddess")
	local quest = actorMgr:GetActor(q353Cfg.ActorAlias)
	if quest ~= nil then
		quest:FinishQuest(false, nil)
	end
	--show paimon
	local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	if paimon ~= nil then
		paimon:SetVisible(true)
	end
	--spawn MengdeEff
	self:SpawnGadget(70300051, sceneData:GetDummyPoint(3,"Q357Gaia1").pos, sceneData:GetDummyPoint(3,"Q357Gaia1").rot, "MengdeEff", 3)
end

function Quest353:On35309CutsceneDestroy()
	print("On35309CutsceneDestroy")
	self:ShowGoddess() --还原女神像
end

function Quest353:On35309CutsceneStart()
	self:HideGoddess() --隐藏女神像，用导演自己的
	--hide paimon
	local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	if paimon ~= nil then
		paimon:SetVisible(false)
	end
end

function Quest353:PlayerName()
--[[     local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	if paimon ~= nil then
		paimon:SetVisible(false)
	end ]]
	local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	paimon:VanishKeep()
	self:ShowNameDialog(
        function()
            print("Finish Name Task")
		    local quest = actorMgr:GetActor(q353Cfg.ActorAlias)
		    if quest ~= nil then
			    quest:FinishQuest(false, nil)
		    end
        end
    )
end

function Quest353:PaimonVanish()
    local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	paimon:CallDelay(1, paimon.VanishKeep)
	--self:NarratorOnlyTask(self.clientData.NarratorData.Story4)
	--self:SetOpenState(OpenStateType.OPEN_STATE_PAIMON, true)
end

function Quest353:Cutscene35309()
	self:PlayCutscene(self.clientData.InterData.Cutscene1, self.On35309CutsceneFinish, self.On35309CutsceneStart, self.On35309CutsceneDestroy)
end

--@region sub start & finish handlers
---按流程触发顺序
function Quest353:OnSubStart35301(quest)
    print("35301 start: Paimon Create")
	local PaimonData = self.clientData.PaimonData
	actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, PaimonData.Pos1, PaimonData.Dir1, true, false)
	globalActor:PlayerBackButtonOn(2, 3, "Q353Center", 30, 9)
end

function Quest353:OnSubFinish35301(quest)
	print("35301 Finish: Tutorial")
	self:ActionSafeCall(self.ShowTutorial)
	self:ActionSafeCall(self.PaimonVanish)
end

function Quest353:OnSubStart35302(quest)
	print("35302 start: Create questarea")
	local TargetData = self.clientData.TargetData
    globalActor:UnSpawn(TargetData.Target1)
	globalActor:SpawnGadget(TargetData.TargetID, TargetData.Pos1, TargetData.Dir1, TargetData.Target1)
	self:CallDelay(5, self.TargetDes1)
	--self:ActionSafeCall(self.SkillTurorial)
	self:CallDelay(1,self.Skill)
   --[[  local PaimonData = self.clientData.PaimonData
    local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	paimon:RunToTask(self.clientData.PaimonData.Pos2,
	function(actor, task)
        actor:DoFreeStyle(1291)
		actor:TurnTo(M.Euler2DirXZ(self.clientData.PaimonData.Dir2))
	end
	) ]]
	--self:ActionSafeCall(self.ShowTutorial)
	--self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q353Monster1").pos, 1, 2, true)
	globalActor:PlayerBackButtonOff(2)
--[[ 	local questArea = gadgetFactory.CreateQuestArea("QuestCenter1", 0, sceneData:GetDummyPoint(3, "Q353Center").pos, 50, 10,
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
			local quest = actorMgr:GetActor(q353Cfg.ActorAlias)
			if quest ~= nil then
				quest:UnFinishQuest(true, nil)
			end
		end) ]]
end
function Quest353:TargetDes1(quest)
	local TargetData = self.clientData.TargetData
    globalActor:UnSpawn(TargetData.Target1)
end
function Quest353:Skill(quest)
	print("Skill")
	self:ActionSafeCall(self.SkillTurorial)
end
function Quest353:SkillTurorial(quest)
	print("SkillTurorial")
	self:TransmitPlayer(3, sceneData:GetDummyPoint(3, "Q353SetAvatar").pos, sceneData:GetDummyPoint(3, "Q353SetAvatar").rot)
	globalActor:StartGuide("GuideElementSkill")
end

function Quest353:OnSubStart35303(quest)
	print("35303 start: Paimon to Act2")
	--self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q353Monster2").pos, 1, 2, true)
--[[     local PaimonData = self.clientData.PaimonData
    local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	paimon:RunToTask(self.clientData.PaimonData.Pos3,
	function(actor, task)
        actor:DoFreeStyle(1291)
		actor:TurnTo(M.Euler2DirXZ(self.clientData.PaimonData.Dir3))
	end
	) ]]
	--self:NarratorOnlyTask(self.clientData.NarratorData.Story2)
	local TargetData = self.clientData.TargetData
    globalActor:UnSpawn(TargetData.Target2)
	globalActor:SpawnGadget(TargetData.TargetID, TargetData.Pos2, TargetData.Dir2, TargetData.Target2)
	self:CallDelay(5, self.TargetDes2)
	self:CallDelay(1,
	function()
		globalActor:EndGuide("GuideElementSkill")
		globalActor:EndGuide("GuideElementSkillPC")
		globalActor:StartGuide("GuideElementSkillHold")
	end
)
end
function Quest353:TargetDes2(quest)
	local TargetData = self.clientData.TargetData
    globalActor:UnSpawn(TargetData.Target2)
end

function Quest353:OnSubStart35304(quest)
	print("35304 start: Paimon to Act3")
--[[     local PaimonData = self.clientData.PaimonData
    local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	paimon:RunToTask(self.clientData.PaimonData.Pos5,
	function(actor, task)
        actor:DoFreeStyle(1291)
		actor:TurnTo(M.Euler2DirXZ(self.clientData.PaimonData.Dir5))
	end
	) ]]
	--self:EnterSceneLookCamera(sceneData:GetDummyPoint(3,"Q353Monster3").pos, 1, 2, true)
    --self:NarratorOnlyTask(self.clientData.NarratorData.Story3)
    local BallData = self.clientData.BallData
    globalActor:SpawnItem(BallData.BallID, BallData.BallPos,nil,"Ball")
    globalActor:SpawnItem(BallData.BallID, BallData.BallPos,nil,"Ball")
	globalActor:SpawnItem(BallData.BallID, BallData.BallPos,nil,"Ball")
	local TargetData = self.clientData.TargetData
    globalActor:UnSpawn(TargetData.Target3)
	globalActor:SpawnGadget(TargetData.TargetID, TargetData.Pos3, TargetData.Dir3, TargetData.Target3)
	self:CallDelay(5, self.TargetDes3)
	self:CallDelay(1,
	function()
		globalActor:EndGuide("GuideElementSkillHold")
		globalActor:EndGuide("GuideElementSkillHoldPC")
		globalActor:StartGuide("GuideElementSkillBurst")
	end
)
end
function Quest353:TargetDes3(quest)
	local TargetData = self.clientData.TargetData
    globalActor:UnSpawn(TargetData.Target3)
end

function Quest353:OnSubFinish35304(quest)
	print("35304 Finish: Endguide")
	globalActor:EndGuide("GuideElementSkillBurst")
	globalActor:EndGuide("GuideElementSkillBurstPC")
end
-- function Quest353:OnSubStart35308(quest)
-- 	print("35308 start: Show Paimon")
-- --[[ 	local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
-- 	if paimon ~= nil then
-- 		paimon:SetVisible(true)
-- 	end ]]
-- 	local PaimonData = self.clientData.PaimonData
-- 	actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, PaimonData.Pos5, PaimonData.Dir5, true, false)
--     self:RequestInteraction(PaimonData.Paimon)
-- end

--[[ function Quest353:OnSubStart35309(quest)
	print("35309 Start : Cs_MdGoddess_Lite01_CamMove")
	self:ActionSafeCall(self.Cutscene35309)
	--self:PlayCutscene(self.clientData.InterData.Cutscene1, self.On35309CutsceneFinish, self.On35309CutsceneStart)
end ]]

--[[ function Quest353:OnSubFinish35308(quest)
	print("35308 Finish : Paimon Vanish")
	self:ActionSafeCall(self.PaimonVanish)
end ]]

function Quest353:OnSubStart35312(quest)
	print("35312 start: Questarea")
	actorMgr:CreateActorWithPos("Q353Trigger1", "Actor/Gadget/Q353Trigger1", 70900002, 0, sceneData:GetDummyPoint(3,"Q353Center").pos, sceneData:GetDummyPoint(3,"Q353Center").rot, true, false)
	actorMgr:CreateActorWithPos("Q353Trigger2", "Actor/Gadget/Q353Trigger2", 70900002, 0, sceneData:GetDummyPoint(3,"Q353Center").pos, sceneData:GetDummyPoint(3,"Q353Center").rot, true, false)
	--[[  local PaimonData = self.clientData.PaimonData
    local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	paimon:RunToTask(self.clientData.PaimonData.Pos2,
	function(actor, task)
        actor:DoFreeStyle(1291)
		actor:TurnTo(M.Euler2DirXZ(self.clientData.PaimonData.Dir2))
	end
	) ]]
	--self:ActionSafeCall(self.ShowTutorial)
--[[ 	local questArea = gadgetFactory.CreateQuestArea("QuestCenter1", 0, sceneData:GetDummyPoint(3, "Q353Center").pos, 50, 10,
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
			local quest = actorMgr:GetActor(q353Cfg.ActorAlias)
			if quest ~= nil then
				quest:FinishQuestID(true, 35312)
			end
		end) ]]
	local TargetData = self.clientData.TargetData
	globalActor:UnSpawn(TargetData.Target1)
	globalActor:UnSpawn(TargetData.Target2)
	globalActor:UnSpawn(TargetData.Target3)
end

function Quest353:OnSubFinish35312(quest)
	print("35312 Finish: Questarea Des")
	globalActor:UnSpawn("Q353Trigger1")
	globalActor:UnSpawn("Q353Trigger2")
	local Q353Trigger1Actor = actorMgr:GetActor("Q353Trigger1")
	Q353Trigger1Actor:DestroySelf()
	local Q353Trigger2Actor = actorMgr:GetActor("Q353Trigger2")
	Q353Trigger2Actor:DestroySelf()
end

function Quest353:OnSubFinish35311(quest)
	print("35311 Finish: Story5")
	self:NarratorOnlyTask(self.clientData.NarratorData.Story5, self.OnNarratorFinish)
	globalActor:EndGuide("GuideElementSkillBurst")
	globalActor:EndGuide("GuideElementSkillBurstPC")
end

function Quest353:OnNarratorFinish()
  globalActor:StartGuide("GuideViewHotkey")
end

function Quest353:InvokeOnInteraction(param)
    if param == 1 then
        print("Now Spawn Tears")
--[[         local MonsterData = self.clientData.MonsterData
		self:SpawnMonster(MonsterData.MonsterID, 1, MonsterData.Pos1) ]]
	elseif param == 2 then
		print("Show Name Dialog")
		self:PlayerName()
		--self:ActionSafeCall(self.PlayerName)
	end
end
--@endregion

function Quest353:Start()
end

function Quest353:OnDestroy()
end

return Quest353
