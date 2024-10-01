require('Actor/ActorCommon')
local interactionActorProxy = require('Actor/Interaction/InteractionActorProxy')

local TestInteractionActor = class("TestInteractionActor", interactionActorProxy)

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function print_r ( t )  
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            CS.UnityEngine.Debug.Log(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        CS.UnityEngine.Debug.Log(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        CS.UnityEngine.Debug.Log(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        CS.UnityEngine.Debug.Log(indent.."["..pos..'] => "'..val..'"')
                    else
                        CS.UnityEngine.Debug.Log(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                CS.UnityEngine.Debug.Log(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        CS.UnityEngine.Debug.Log(tostring(t).." {")
        sub_print_r(t,"  ")
        CS.UnityEngine.Debug.Log("}")
    else
        sub_print_r(t,"  ")
    end
end

function TestInteractionActor:OnInterStart(interCnt)
    local Wendy = actorMgr:GetActor("1001")
    local Paimon = actorMgr:GetActor("1005")
    local q414Cfg = require('Actor/Quest/Q414/Q414Config')
    local PaimonData = q414Cfg.PaimonData

	if interCnt == 2 then
        print_r(actorMgr.ActorDic)
        --Paimon:CreateActorWithPos(paimonData.Paimon, paimonData.PaimonScript, paimonData.PaimonID, 0, paimonData.bornPos, paimonData.bornDir, true, false)
        --Paimon:SetPos(sceneData:GetDummyPoint(3,"Q414Paimon1").pos)
        --Paimon:TurnTo(M.Euler2DirXZ(sceneData:GetDummyPoint(3,"Q414Paimon1").rot))
        Paimon:DoFreeStyle(10)
	elseif interCnt == 4 then
        -- CS.UnityEngine.Debug.Log('hello world111')
        Paimon:DoFreeStyle(1)
    elseif interCnt == 23 then
        -- CS.UnityEngine.Debug.Log('hello world111')
        Paimon:DoFreeStyle(3)
--[[     elseif interCnt == 5 then
        -- CS.UnityEngine.Debug.Log('hello world111')
        print_r(actorMgr.ActorDic)
        Wendy:DoFreeStyle(0)
        Wendy:CallDelay(2,Wendy.Standby)
        Qin:SetPos(sceneData:GetDummyPoint(3,"Q411QinBorn").pos)
    -- elseif interCnt == 8 then
    --     -- CS.UnityEngine.Debug.Log('hello world111')
    --     print_r(actorMgr.ActorDic)
    --     Wendy:RunTo(sceneData:GetDummyPoint(3,"Q306KnightVanish").pos)
    --     -- Wendy:Destroy(false)
    --     Paimon:RunTo(sceneData:GetDummyPoint(3,"Q306KnightVanish").pos)
    elseif interCnt == 25 then
        -- CS.UnityEngine.Debug.Log('hello world111')
        print_r(actorMgr.ActorDic)
        Wendy:SetPos(sceneData:GetDummyPoint(3,"Q301Hidden").pos)
        -- Wendy:Destroy(false)
        Paimon:SetPos(sceneData:GetDummyPoint(3,"Q301Hidden").pos) ]]
    end	
end

return TestInteractionActor