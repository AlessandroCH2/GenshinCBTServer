require('Actor/ActorCommon')
local gadgetActorProxy = require('Actor/Gadget/GadgetActorProxy')

local GoalMarker404 = class("GoalMarker404", gadgetActorProxy)

GoalMarker404.defaultAlias = "GoalMarker404"

local inCnt = 0
local outCnt = 0
local q404Cfg = require('Actor/Quest/Q404/Q404Config')

function GoalMarker404:OnPostDataPrepare()
	inCnt = 0
	outCnt = 0
end

function GoalMarker404:OnPostComponentPrepare()
	self:AddComponentTrigger(4, DistType.EULER, M.Pos(0, 0.8, 0), self.TriggerIn, self.TriggerOut)
end

function GoalMarker404:TriggerIn()
	print("Enter Goal")
	local goalMarkerAS = actorMgr:CreateActorWithPos("GoalMarkerAs404", "Actor/Gadget/GoalMarkerAS", 70300005, 0, q404Cfg.KeyPos, q404Cfg.KeyDir, false, false)
	goalMarkerAS:CallDelay(5, goalMarkerAS.DestroySelf)
	local goalMarkerAS2 = actorMgr:CreateActorWithPos("GoalMarkerAs4042", "Actor/Gadget/GoalMarkerAS", 70300005, 0, q404Cfg.KeyPos2, q404Cfg.KeyDir2, false, false)
	goalMarkerAS2:CallDelay(5, goalMarkerAS2.DestroySelf)
	local effctPos = self:GetPos()
	self:PlayEffect("FlyRace_Goal_Marker_AS", effctPos)
	q404Cfg.gotKey = true
    local quest = actorMgr:GetActor(q404Cfg.ActorAlias)
    if quest ~= nil then
        print("Finished Fly")
        quest:FinishQuest(false, nil)
    end
	self:DestroySelf()
end

function GoalMarker404:TriggerOut()
	outCnt = outCnt + 1
	--print("Exit " .. tostring(outCnt))
	--self:DestroySelf()
end

return GoalMarker404