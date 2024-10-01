require('Actor/ActorCommon')
local questActorProxy = require('Actor/Quest/QuestActorProxy')

local Quest358 = class("Quest358", questActorProxy)

Quest358.defaultAlias = "Quest358"

local q358Cfg = require('Quest/Client/Q358ClientConfig')

-- Generated
function Quest358:OnSubStartHandlerBuild()
	self.subStartHandlers = {}
	self.subStartHandlers["35801"] = self.OnSubStart35801
	self.subStartHandlers["35802"] = self.OnSubStart35802
end

function Quest358:OnSubFinishHandlerBuild()
	self.subFinishHandlers = {}
	self.subFinishHandlers["35801"] = self.OnSubFinish35801
	self.subFinishHandlers["35802"] = self.OnSubFinish35802
end

---sub start & finish 内调用的函数
function Quest358:PaimonVanish()
	--self:ShowTutorialDialog(114)
	local paimon = actorMgr:GetActor(self.clientData.PaimonData.Paimon)
	--paimon:VanishKeep()
	if paimon ~= nil then
		paimon:DestroyWithDisappear(false)
	end
end

function Quest358:On35801CutsceneFinish()
	--[[ local QinData = self.clientData.QinData
	actorMgr:CreateActorWithPos(QinData.Qin, QinData.QinScript, QinData.QinID, 0, QinData.Pos1, QinData.Dir1, true, false, 1004,true,100402)
	local AmborData = self.clientData.AmborData
	actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos1, AmborData.Dir1, true, false, 1004,true,100402)
	local GaiaData = self.clientData.GaiaData
    actorMgr:CreateActorWithPos(GaiaData.Gaia, GaiaData.GaiaScript, GaiaData.GaiaID, 0, GaiaData.Pos1, GaiaData.Dir1, true, false, 1004,true,100402)
    local LisaData = self.clientData.LisaData
    actorMgr:CreateActorWithPos(LisaData.Lisa, LisaData.LisaScript, LisaData.LisaID, 0, LisaData.Pos1, LisaData.Dir1, true, false, 1004,true,100402)
	local PaimonData = self.clientData.PaimonData
	actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, PaimonData.Pos1, PaimonData.Dir1, true, false, 1004,true,100402) ]]
	local GaiaData = self.clientData.GaiaData
	self:RequestInteraction(GaiaData.Gaia)
end

--@region sub start & finish handlers
---按流程触发顺序
function Quest358:OnSubFinish35801(quest)
	print("35801 Finish : Creat NPC")
	--self:PlayCutscene(self.clientData.InterData.Cutscene1)
	local QinData = self.clientData.QinData
	actorMgr:CreateActorWithPos(QinData.Qin, QinData.QinScript, QinData.QinID, 0, QinData.Pos1, QinData.Dir1, true, false, 1004,true,100402)
	local AmborData = self.clientData.AmborData
	actorMgr:CreateActorWithPos(AmborData.Ambor, AmborData.AmborScript, AmborData.AmborID, 0, AmborData.Pos1, AmborData.Dir1, true, false, 1004,true,100402)
	local GaiaData = self.clientData.GaiaData
    actorMgr:CreateActorWithPos(GaiaData.Gaia, GaiaData.GaiaScript, GaiaData.GaiaID, 0, GaiaData.Pos1, GaiaData.Dir1, true, false, 1004,true,100402)
    local LisaData = self.clientData.LisaData
    actorMgr:CreateActorWithPos(LisaData.Lisa, LisaData.LisaScript, LisaData.LisaID, 0, LisaData.Pos1, LisaData.Dir1, true, false, 1004,true,100402)
	local PaimonData = self.clientData.PaimonData
	actorMgr:CreateActorWithPos(PaimonData.Paimon, PaimonData.PaimonScript, PaimonData.PaimonID, 0, PaimonData.Pos1, PaimonData.Dir1, true, false, 1004,true,100402)
	self:PlayCutscene(self.clientData.InterData.Cutscene1, self.On35801CutsceneFinish)
end

function Quest358:OnSubFinish35802(quest)
	print("35802 Finish : Paimon Vanish")
	self:ActionSafeCall(self.PaimonVanish)
end   

--@endregion

function Quest358:Start()
end

function Quest358:OnDestroy()
end

return Quest358