require('Actor/ActorCommon')
local cutsceneActorProxy = require('Actor/Cutscene/CutsceneActorProxy')

local CutsceneActor_GoddessLvup = class("CutsceneActor_GoddessLvup", cutsceneActorProxy)

local airFlowActor
local alias = {"WindField_Vertical_01", "WindField_Horizontal_01", "WindField_Horizontal_02", "WindField_Horizontal_03"}

function CutsceneActor_GoddessLvup:CreateWindLocal()
	if airFlowActor ~= nil then
		local pos = airFlowActor:GetPos()
		actorMgr:CreateActorWithPos("localWind", "Actor/Gadget/AirflowFieldActor", 70610101, 0, pos, {x=0,y=0,z=0}, true, false)
	end
end

function CutsceneActor_GoddessLvup:DestroyWindLocal()
    local localWind = actorMgr:GetActor("localWind")
    if localWind == nil or localWind == actorMgr.dummyActor then
    	print("can not find localWind")
    else
        localWind:DestroySelf()
    end
end

function CutsceneActor_GoddessLvup:ShowEffect()
	if airFlowActor ~= nil then
		local effctPos = airFlowActor:GetPos()
		self:PlayEffect("WindSource01_PowerUp", effctPos)
		--self:CallDelay(2, self.CreateWindLocal)
	end
end

function CutsceneActor_GoddessLvup:Start()
	print("****************CutsceneActor_GoddessLvup:Start*******************")
	for i,v in ipairs(alias) do
		local actor = actorMgr:GetActor(v)
		if actor == nil or actor == actorMgr.dummyActor then
			print("can not find " .. v)
		else
			--print(i)
			if i == 1 then
				airFlowActor = actor
			end
			actor:SetActive(false)
		end
	end

	if airFlowActor ~= nil then
		self:CallDelay(9, self.ShowEffect)
	end
end

function CutsceneActor_GoddessLvup:OnDestroy()
	print("#################CutsceneActor_GoddessLvup:OnDestroy()##################")
	self:DestroyWindLocal()

	for _,v in ipairs(alias) do
		local actor = actorMgr:GetActor(v)
		if actor ~= nil and actor ~= actorMgr.dummyActor then
			actor:SetActive(true)
		end
	end
	airFlowActor = nil
end

return CutsceneActor_GoddessLvup