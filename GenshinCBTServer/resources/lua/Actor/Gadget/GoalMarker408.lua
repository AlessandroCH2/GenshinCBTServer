require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local GoalMarker408 = class("GoalMarker408", gadgetActorProxy)

GoalMarker408.defaultAlias = "GoalMarker408"

local inCnt = 0
local outCnt = 0
local q408Cfg = require('Actor/Quest/Q408/Q408Config')

function GoalMarker408:OnPostDataPrepare()
	inCnt = 0
	outCnt = 0
end

function GoalMarker408:OnPostComponentPrepare()
	self:AddComponentTrigger(4, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function GoalMarker408:TriggerIn()
	print("Enter Goal")
	local goalMarkerAS = actorMgr:CreateActorWithPos("GoalMarkerAs408", "Actor/Gadget/GoalMarkerAS", 70300005, 0, q408Cfg.KeyPos, q408Cfg.KeyDir, true, false)
	goalMarkerAS:CallDelay(5, goalMarkerAS.DestroySelf)
	local effctPos = self:GetPos()
	self:PlayEffect("FlyRace_Goal_Marker_AS", effctPos)
	q408Cfg.gotKey = true
    local quest = actorMgr:GetActor(q408Cfg.ActorAlias)
    if quest ~= nil then
        print("Finished RiverRun")
        quest:FinishQuest(false, nil)
    end
	self:DestroySelf()
end

function GoalMarker408:TriggerOut()
	outCnt = outCnt + 1
end

return GoalMarker408