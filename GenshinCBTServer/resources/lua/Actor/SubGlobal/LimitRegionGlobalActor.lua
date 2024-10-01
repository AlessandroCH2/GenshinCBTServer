require('Actor/ActorCommon')
local subGlobalActorProxy = require('Actor/SubGlobal/SubGlobalActorProxy')
local LimitRegionGlobalActor = class("LimitRegionGlobalActor", subGlobalActorProxy)

LimitRegionGlobalActor.defaultAlias = "LimitRegionGlobal"


LimitRegionGlobalActor.TeachingDialogList =
{
	{dialogID = 3500101, audioEvtName = "", duration = 3},
}
LimitRegionGlobalActor.TeachingDuration = 0
LimitRegionGlobalActor.TeachingDurationCnt = 0
LimitRegionGlobalActor.Teaching = false

LimitRegionGlobalActor.WarningDialogList =
{
--[[ 	{dialogID = 3520501, audioEvtName = "", duration = 3},
	{dialogID = 3520601, audioEvtName = "", duration = 3},
	{dialogID = 3520701, audioEvtName = "", duration = 3}, ]]
}

LimitRegionGlobalActor.WarningDialogIndex = 1
LimitRegionGlobalActor.WarningDuration = 0
LimitRegionGlobalActor.WarningDurationCnt = 0

LimitRegionGlobalActor.testLength = 25
LimitRegionGlobalActor.transOffset = 7
LimitRegionGlobalActor.checkTask = nil
LimitRegionGlobalActor.pauseTask = false
LimitRegionGlobalActor.Warnning = false

--@region Method
function LimitRegionGlobalActor:PerformWarningNarrator()
	if self.WarningDialogList == nil then
		return -1.0
	end
	local dialogNum = #(self.WarningDialogList)
	if self.WarningDialogIndex > dialogNum then
		return -1.0
	end

	local currDialog = self.WarningDialogList[self.WarningDialogIndex]
	if currDialog == nil then
		self.WarningDialogIndex = 1
		currDialog = self.WarningDialogList[self.WarningDialogIndex]
		if currDialog == nil then
			return -1.0
		end
	end

	self.WarningDuration = currDialog.duration
	self.WarningDurationCnt = 0

	local dialogID = currDialog.dialogID
	self:SayWarningNarrator(dialogID)

	return self.WarningDuration
end

function LimitRegionGlobalActor:StopPerformAllNarrator()
	self:StopWarningNarrator()
end

function LimitRegionGlobalActor:PerformTeachingNarrator()
	local currDialog = self.TeachingDialogList[1]
	if currDialog == nil then
		return false
	end

	local dialogID = currDialog.dialogID
	self.TeachingDuration = currDialog.duration
	self.TeachingDurationCnt = 0
	local audioEvtName = currDialog.audioEvtName

	self:SayWarningNarrator(dialogID)
	return true
end
--@endregion

function LimitRegionGlobalActor:CheckLimit(task, deltaTime)
	if self.Teaching then
		self.TeachingDurationCnt = self.TeachingDurationCnt + deltaTime
		if self.TeachingDurationCnt >= self.TeachingDuration then
			self:StopWarningNarrator()
			self.uActor:AvatarPaimonDisappear()
			self.Teaching = false
		end
	end

	self.WarningDurationCnt = self.WarningDurationCnt + deltaTime

	local avatarPos = self.uActor:GetAvatarPos()
	local radius = self:GetLimitRegionDis(avatarPos, self.testLength)
	local curAlpha = 1
	if radius < self.testLength then
		curAlpha = radius / self.testLength 
		if self.WarningDurationCnt >= self.WarningDuration then
			self.WarningDialogIndex = self.WarningDialogIndex + 1
			if self:PerformWarningNarrator() ~= true then
				self.WarningDialogIndex = 0
			end
			self.Warnning = true
		end
	else
		if self.Warnning == true then
			self:StopWarningNarrator()
			self.Warnning = false
		end
	end

	self.uActor:BlackScreen(curAlpha)
	if radius ~= 0 then
		return
	end

	local avatarPos = self.uActor:GetAvatarPos()

	-- 人经常会莫名的拉到0,0,0点，会播放语音并进行控制，只能加个保护
	local len = avatarPos.x * avatarPos.x + avatarPos.y * avatarPos.y + avatarPos.z * avatarPos.z;
	if len == 0 then
		return
	end
	local newPos = self:CheckNeedTrans(avatarPos, self.transOffset)
	local disX = newPos.x - avatarPos.x
	local disZ = newPos.z - avatarPos.z
	local disSquare = disX * disX + disZ * disZ;
	if disSquare < 10 then
		return
	end

	if self.pauseTask then 
		return 
	end
	self.pauseTask = true

	self.uActor:AvatarPaimonAppear(function ()		
		self.pauseTask = false
		-- self.uActor:AvatarPaimonPlayer("Domangic")
	end)
	self:PerformTeachingNarrator();

	self.uActor:AvatarGotoPoint(newPos, function ()
	end)
end

function LimitRegionGlobalActor:PerformTeachingNarrator()
	local currDialog = self.TeachingDialogList[1]
	if currDialog == nil then
		return false
	end

	local dialogID = currDialog.dialogID
	self.TeachingDuration = currDialog.duration
	self.TeachingDurationCnt = 0
	local audioEvtName = currDialog.audioEvtName

	self:SayWarningNarrator(dialogID)
	if audioEvtName ~= nil and audioEvtName ~= "" then
		self.uActor:PlayAudio(audioEvtName)
	end

	self.Teaching = true
end

function LimitRegionGlobalActor:Register()
	print("CreateLimitRegion")
	self:CreateLimitRegion("CB1OpenArea")
	if self.checkTask == nil then
		self.checkTask = self:CreateTask(self.MOVE_TASK_ID, LuaTaskType.LIMIT_REGION, "Lock")
		self.checkTask:InitWithData(self, self)
		--self.checkTask:TickEvent('+', self.CheckLimit)
	end
end



function LimitRegionGlobalActor:UseFreshmeatRegion()
	print("FreshmeatRegion")
	self:DestroyLimitRegion("CB1OpenArea")
	self:CreateLimitRegion("FreshmeatRegion")
end

function LimitRegionGlobalActor:OnFinishedRegion()
	print("DestroyLimitRegion")
	globalActor:EnablePlayerInput(true)
	globalActor:BackPage()
	self:DestroyLimitRegion("FreshmeatRegion")
	self:CreateLimitRegion("CB1OpenArea")
	-- actorMgr:DestroyActor("LimitRegionGlobal")
end

function LimitRegionGlobalActor:FinishLimitRegion()
	self.uActor:BlackScreen(1)
	globalActor:ShowPage("InLevelMapPageContext")
	globalActor:InvokePageFunction("ShowDisableLimitRegion")
	globalActor:EnablePlayerInput(false)
	self:CallDelay(3, self.OnFinishedRegion)
end

function LimitRegionGlobalActor:Unregister()

	if self.checkTask ~= nill then
		self.checkTask:FinishTask()
		self.checkTask = nil
	end
end


function LimitRegionGlobalActor:Start()
end

return LimitRegionGlobalActor