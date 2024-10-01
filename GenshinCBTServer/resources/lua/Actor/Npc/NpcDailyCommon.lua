local DailyNpcCommon={}
local NpcEventType = require('Actor/Npc/NPCEventType')
local NpcModeType = require('Actor/Npc/NpcMode/NpcModeType')

local NpcEventType = NpcEventType.DailyNpcEventType

DailyNpcCommon.Register= function(actor)
	actor:RegisterMode(NpcModeType.MODE_HIDE)
	actor:RegisterMode(NpcModeType.MODE_BANDAILY)
end

DailyNpcCommon.InvokeOnResetFreeStyle= function(actor,freeStyleType)	
	if freeStyleType == 361 or freeStyleType == 141 then
		actor:RecoverFromFreeStyle()
	end
end


DailyNpcCommon.OnEvent= function(evt,actor)	
    if evt.evtType == NpcEventType.STARTDAILY then
        actor:StartDaily()
	elseif evt.evtType == NpcEventType.HIDESELF then		
		actor:SwitchMode(NpcModeType.MODE_HIDE)
	elseif evt.evtType == NpcEventType.BANDAILY then
		actor:SwitchMode(NpcModeType.MODE_BANDAILY)
	end
end

DailyNpcCommon.OnCollisionEnter= function(targetInfo,actor)
	if actor.OnAction==1 then
		return
	end
	if targetInfo.isSprint or targetInfo.isRun then
		if targetInfo.isFromBack then
			--actor:AddPriorityInter(InterTimingType.BTN, NoReplyInter)
			actor.OnAction=1
			local avatarPos = actorUtils.GetAvatarPos()
    		local selfPos = actor:GetPos()			
			local TurnDir = { x = selfPos.x-avatarPos.x, y = selfPos.y,-avatarPos.y, z = selfPos.z-avatarPos.z}
			actor:Standby()
			actor:TurnTo(TurnDir)
			actor:DoFreeStyleTask(9010, true, actor.RecoverFromCollisionEnter)
			--[[actor:CallDelay(0, 
			function(actor)
				actor:DoFreeStyleTask(9010, true, actor.RecoverFromCollisionEnter)
			end)]]--
		else
			actor.OnAction=1
			local avatarPos = actorUtils.GetAvatarPos()
    		local selfPos = actor:GetPos()
			local TurnDir = { x = avatarPos.x-selfPos.x, y = avatarPos.y-selfPos.y, z = avatarPos.z-selfPos.z}
			actor:Standby()
			actor:TurnTo(TurnDir)
			--[[actor:CallDelay(0, 
			afunction(actor)
				actor:DoFreeStyleTask(9020, true, actor.RecoverFromCollisionEnter)
			end)]]--
			actor:DoFreeStyleTask(9020, true,actor.RecoverFromCollisionEnter)
		end
	end
end


return DailyNpcCommon