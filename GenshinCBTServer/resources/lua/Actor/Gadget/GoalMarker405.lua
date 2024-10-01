require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local GoalMarker405 = class("GoalMarker405", gadgetActorProxy)

GoalMarker405.defaultAlias = "GoalMarker405"

local inCnt = 0
local outCnt = 0
local q405Cfg = require('Actor/Quest/Q405/Q405Config')

function GoalMarker405:OnPostDataPrepare()
	inCnt = 0
	outCnt = 0
end

function GoalMarker405:OnPostComponentPrepare()
	self:AddComponentTrigger(4, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function GoalMarker405:TriggerIn()
	print("Enter Goal")
	local goalMarkerAS = actorMgr:CreateActorWithPos("GoalMarkerAs405", "Actor/Gadget/GoalMarkerAS", 70300005, 0, q405Cfg.KeyPos, q405Cfg.KeyDir, true, false)
	goalMarkerAS:CallDelay(5, goalMarkerAS.DestroySelf)
	local effctPos = self:GetPos()
	self:PlayEffect("FlyRace_Goal_Marker_AS", effctPos)
	q405Cfg.gotKey = true
    local quest = actorMgr:GetActor(q405Cfg.ActorAlias)
    if quest ~= nil then
        print("Finished Fly")
        quest:FinishQuest(false, nil)
    end
	self:DestroySelf()
end

function GoalMarker405:TriggerOut()
	outCnt = outCnt + 1
	--print("Exit " .. tostring(outCnt))
	--self:DestroySelf()
end

return GoalMarker405