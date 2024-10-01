require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest309 = class("Quest309", questActorProxy)

Quest309.defaultAlias = "Quest309"

local q309Cfg = require('Quest/Client/Q309ClientConfig')
local q359Cfg = require('Quest/Client/Q359ClientConfig')

-- Generated
function Quest309:OnSubStartHandlerBuild()
	self.subStartHandlers = {}
	self.subStartHandlers["30901"] = self.OnSubStart30901
	-- self.subStartHandlers["30902"] = self.OnSubStart30902
	self.subStartHandlers["30903"] = self.OnSubStart30903
	self.subStartHandlers["30904"] = self.OnSubStart30904
end

function Quest309:OnSubFinishHandlerBuild()
	self.subFinishHandlers = {}
	self.subFinishHandlers["30901"] = self.OnSubFinish30901
	-- self.subFinishHandlers["30902"] = self.OnSubFinish30902
	self.subFinishHandlers["30903"] = self.OnSubFinish30903
	self.subFinishHandlers["30904"] = self.OnSubFinish30904
end

---sub start & finish 内调用的函数
function Quest309:PaimonVanish()
	--local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	--paimon:AirModeOff()
	--paimon:VanishKeep()
	local paimon = actorMgr:GetActor("Paimon")
	if paimon ~= nil then
		paimon:DestroyWithDisappear(false)
	end
end

--@region sub start & finish handlers
---按流程触发顺序
function Quest309:OnSubStart30902(quest)
	print("30902 Start : Creat Paimon")
	local PaimonData = self.clientData.PaimonData
    local paimonPos = actorUtils.GetAvatarPos()
    paimonPos.z = paimonPos.z+1.2
    local paimonRot = {x=0,y=0,z=-1}
	actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, paimonPos, M.Dir2Euler(paimonRot), true, false)
end

function Quest309:OnSubStart30904(quest)
	self:ActionSafeCall(
		function (self)
			self:PlayCutscene(q309Cfg.CutsceneData,
				function (self)
					local quest = actorMgr:GetActor(q309Cfg.ActorAlias)
					if quest ~= nil then
						quest:FinishQuest(false, nil)
					end
				end
			)

			local quest = actorMgr:GetActor(q359Cfg.ActorAlias)
			if quest ~= nil then
				quest:FinishQuestID(false, 35901)
			end
		end
	)
end


function Quest309:OnSubFinish30902(quest)
	print("30902 Finish : Paimon Vanish")
end

--@endregion

function Quest309:Start()
end

function Quest309:OnDestroy()
end

return Quest309
