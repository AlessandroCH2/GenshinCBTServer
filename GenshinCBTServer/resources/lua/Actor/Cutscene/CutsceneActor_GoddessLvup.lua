require('Actor/ActorCommon')
local cutsceneActorProxy = require('Actor/Cutscene/CutsceneActorProxy')

local CutsceneActor_GoddessLvup = class("CutsceneActor_GoddessLvup", cutsceneActorProxy)

local alias = "mywind"
local airFlowActor

local function PlayEffect()
	local effctPos = airFlowActor:GetPos()
	airFlowActor:PlayEffect("FlyRace_Marker_Active_AS", effctPos)
end

function CutsceneActor_GoddessLvup:Start()
	print("****************CutsceneActor_GoddessLvup:Start*******************")
	airFlowActor = actorMgr:GetActor(alias)
	if airFlowActor == nil or airFlowActor == actorMgr.dummyActor then
		airFlowActor = nil
		print("can not find " .. alias)
	else
		airFlowActor:SetActive(false)
		self:CallDelay(1, PlayEffect)
	end
end

function CutsceneActor_GoddessLvup:OnDestroy()
	print("#################CutsceneActor_GoddessLvup:OnDestroy()##################")
	if airFlowActor ~= nil then
		airFlowActor:SetActive(true)
		airFlowActor = nil
	end
end

return CutsceneActor_GoddessLvup