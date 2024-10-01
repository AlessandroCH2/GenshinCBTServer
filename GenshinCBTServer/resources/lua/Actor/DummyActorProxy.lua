----------------------
-- 这是Lua端DummyActorProxy类，用于不用nil判断

-- @classmod DummyActorProxy

local DummyActorProxy = {}



-- Cache Method Start


function DummyActorProxy:DoFreeStyle(freeStyleType, freeStyleForceInterrupt)

	actorUtils.DoFreeStyle(self.alias, freeStyleType, freeStyleForceInterrupt)

end

-- Cache Method End



-- Dummy Method Start
function DummyActorProxy:GetByNpcRewindData()
	return 0
end
function DummyActorProxy:GetByGadgetRewindData()
	return 0
end

DummyActorProxy.ActorDic = 0
DummyActorProxy.Alias2EntityIDDic = 0
DummyActorProxy.dummyActor = 0
DummyActorProxy.tempDefaultAlias = 0
DummyActorProxy.OnTest1 = 0
DummyActorProxy.OnTest2 = 0
DummyActorProxy.OnTest3 = 0
DummyActorProxy.InitGlobal = 0
DummyActorProxy.InitSubGlobal = 0
DummyActorProxy.RegisteSubGlobal = 0
DummyActorProxy.UnregisteSubGlobal = 0
DummyActorProxy.CreateActor = 0
DummyActorProxy.CreateActorWithPos = 0
DummyActorProxy.CreateActorWithData = 0
DummyActorProxy.CreateQuestActor = 0
DummyActorProxy.GetActor = 0
DummyActorProxy.DestroyEntityActor = 0
DummyActorProxy.GetActorInternal = 0
DummyActorProxy.ClearActor = 0
DummyActorProxy.DestroyActor = 0
DummyActorProxy.DestroyActorMeta = 0
DummyActorProxy.Destroy = 0
DummyActorProxy.DestroySoft = 0
DummyActorProxy.StartActor = 0
DummyActorProxy.SetEntityHandler = 0
DummyActorProxy.GetEntityHandler = 0
DummyActorProxy.DestroyEntityHandler = 0

function DummyActorProxy:SwitchMode()
	return 0
end

function DummyActorProxy:OnPreInit()
	return 0
end
function DummyActorProxy:OnPostInit()
	return 0
end
function DummyActorProxy:OnPostDataPrepare()
	return 0
end
function DummyActorProxy:OnInit()
	return 0
end
function DummyActorProxy:Register()
	return 0
end
function DummyActorProxy:Start()
	return 0
end
function DummyActorProxy:OnDestroy()
	return 0
end
function DummyActorProxy:Destroy()
	return 0
end
function DummyActorProxy:ClearInfo()
	return 0
end
function DummyActorProxy:ClearCoroutine()
	return 0
end
function DummyActorProxy:IsValid()
	return 0
end
function DummyActorProxy:RegisterActorEvent()
	return 0
end
function DummyActorProxy:UnregisterActorEvent()
	return 0
end
function DummyActorProxy:NotifyTo()
	return 0
end
function DummyActorProxy:CreateTask()
	return 0
end
function DummyActorProxy:ClearTask()
	return 0
end
function DummyActorProxy:ClearTaskQueue()
	return 0
end
function DummyActorProxy:ClearRunningTask()
	return 0
end
function DummyActorProxy:ClearAllTask()
	return 0
end
function DummyActorProxy:ClearFollowTask()
	return 0
end
function DummyActorProxy:RegisterTaskTagCB()
	return 0
end
function DummyActorProxy:UnregisterTaskTagCB()
	return 0
end
function DummyActorProxy:PauseByTag()
	return 0
end
function DummyActorProxy:ResumeByTag()
	return 0
end
function DummyActorProxy:DelayResumeByTag()
	return 0
end
function DummyActorProxy:HasTaskResumed()
	return 0
end
function DummyActorProxy:HasTagTask()
	return 0
end
function DummyActorProxy:ClearActor()
	return 0
end
function DummyActorProxy:DelayInTask()
	return 0
end
function DummyActorProxy:CallDelay()
	return 0
end
function DummyActorProxy:UnCallFunc()
	return 0
end
function DummyActorProxy:Stop()
	return 0
end
function DummyActorProxy:SpawnMonster()
	return 0
end
function DummyActorProxy:SpawnLocalMonster()
	return 0
end
function DummyActorProxy:SpawnItem()
	return 0
end
function DummyActorProxy:SpawnLocalItem()
	return 0
end
function DummyActorProxy:SpawnGadget()
	return 0
end
function DummyActorProxy:SpawnLocalGadget()
	return 0
end
function DummyActorProxy:SpawnChest()
	return 0
end
function DummyActorProxy:UnSpawn()
	return 0
end
function DummyActorProxy:PlayCutscene()
	return 0
end
function DummyActorProxy:RegisterSelfDayTime()
	return 0
end
function DummyActorProxy:UnregisterSelfDayTime()
	return 0
end
function DummyActorProxy:RegisterSelfNightTime()
	return 0
end
function DummyActorProxy:UnregisterSelfNightTime()
	return 0
end
function DummyActorProxy:RegisterSelfWeatherChange()
	return 0
end
function DummyActorProxy:UnregisterSelfWeatherChange()
	return 0
end
function DummyActorProxy:RegisterSelfHour()
	return 0
end
function DummyActorProxy:UnregisterSelfHour()
	return 0
end
function DummyActorProxy:GetLevelTime()
	return 0
end
function DummyActorProxy:CountDownUIStart()
	return 0
end
function DummyActorProxy:CountDownUITerminate()
	return 0
end
function DummyActorProxy:CountNumUIStart()
	return 0
end
function DummyActorProxy:CountNumUIUpdate()
	return 0
end
function DummyActorProxy:CountNumUITerminate()
	return 0
end
function DummyActorProxy:ShowQuestQuitUI()
	return 0
end
function DummyActorProxy:HideQuestQuitUI()
	return 0
end
function DummyActorProxy:ShowTeamPage()
	return 0
end
function DummyActorProxy:ShowBlackScreen()
	return 0
end
function DummyActorProxy:ShowTutorialDialog()
	return 0
end
function DummyActorProxy:TryShowMoveToggle()
	return 0
end
function DummyActorProxy:PlayAudio()
	return 0
end
function DummyActorProxy:PlayAudioState()
	return 0
end
function DummyActorProxy:PlayFreeCutscene()
	return 0
end
function DummyActorProxy:StopFreeCutscene()
	return 0
end
function DummyActorProxy:TryPlayVideo()
	return 0
end
function DummyActorProxy:PlayEffect()
	return 0
end
function DummyActorProxy:EnterSceneLookCamera()
	return 0
end
function DummyActorProxy:EnterSceneLookCameraByAlias()
	return 0
end
function DummyActorProxy:ExitSceneLookCamera()
	return 0
end
function DummyActorProxy:RequestInteraction()
	return 0
end
function DummyActorProxy:ActionPreSafeCall()
	return 0
end
function DummyActorProxy:ActionSafeCall()
	return 0
end
function DummyActorProxy:GetSubQuestState()
	return 0
end
function DummyActorProxy:TransmitPlayer()
	return 0
end
function DummyActorProxy:ShowNameDialog()
	return 0
end
function DummyActorProxy:SayNarrator()
	return 0
end
function DummyActorProxy:StopNarrator()
	return 0
end
function DummyActorProxy:SayReminder()
	return 0
end
function DummyActorProxy:GetShowReminder()
	return 0
end
function DummyActorProxy:GetReminderDelay()
	return 0
end
function DummyActorProxy:StopReminder()
	return 0
end
function DummyActorProxy:SayWarningNarrator()
	return 0
end
function DummyActorProxy:StopWarningNarrator()
	return 0
end
function DummyActorProxy:TriggerLevelAbility()
	return 0
end
function DummyActorProxy:PerformNarrator()
	return 0
end
function DummyActorProxy:StopPerformNarrator()
	return 0
end
function DummyActorProxy:StartNarrator()
	return 0
end
function DummyActorProxy:ResumeNarrator()
	return 0
end
function DummyActorProxy:PauseNarrator()
	return 0
end
function DummyActorProxy:FinishNarrator()
	return 0
end
function DummyActorProxy:CheckNarratorOnly()
	return 0
end
function DummyActorProxy:ShowMessage()
	return 0
end
function DummyActorProxy:CheckNarrator()
	return 0
end
function DummyActorProxy:StartWarningNarrator()
	return 0
end
function DummyActorProxy:PerformWarningNarrator()
	return 0
end
function DummyActorProxy:IsSayingWarningNarrator()
	return 0
end
function DummyActorProxy:CheckStopWarningNarrator()
	return 0
end
function DummyActorProxy:CheckWarningNarrator()
	return 0
end
function DummyActorProxy:ResumeWarningNarrator()
	return 0
end
function DummyActorProxy:PauseWarningNarrator()
	return 0
end
function DummyActorProxy:DestroyWarningNarrator()
	return 0
end
function DummyActorProxy:ClearNarratorTask()
	return 0
end
function DummyActorProxy:NarratorTask()
	return 0
end
function DummyActorProxy:NarratorTaskByData()
	return 0
end
function DummyActorProxy:NarratorOnlyTask()
	return 0
end
function DummyActorProxy:NarratorOnlyTaskByData()
	return 0
end
function DummyActorProxy:WarningNarratorTask()
	return 0
end
function DummyActorProxy:SetAvatarPos()
	return 0
end
function DummyActorProxy:SetOpenState()
	return 0
end
function DummyActorProxy:EnablePlayerInput()
	return 0
end
function DummyActorProxy:ShowPage()
	return 0
end
function DummyActorProxy:InvokePageFunction()
	return 0
end
function DummyActorProxy:BackPage()
	return 0
end
function DummyActorProxy:InvokeOnInteraction()
	return 0
end
function DummyActorProxy:EnterSneakMode()
	return 0
end
function DummyActorProxy:ExitSneakMode()
	return 0
end
function DummyActorProxy:EnterBomberMode()
	return 0
end
function DummyActorProxy:ExitBomberMode()
	return 0
end
function DummyActorProxy:TriggerNpcSpeechBubble()
	return 0
end
function DummyActorProxy:ClearNpcSpeechBubble()
	return 0
end
function DummyActorProxy:CallOnAvatarSit()
	return 0
end
function DummyActorProxy:CallOnAvatarStand()
	return 0
end
function DummyActorProxy:StopRealReminder()
	return 0
end
function DummyActorProxy:StopPlayerCombat()
	return 0
end
function DummyActorProxy:StopOpenPage()
	return 0
end
function DummyActorProxy:PlayerCombatOnPause()
	return 0
end
function DummyActorProxy:PlayerCombatOnResume()
	return 0
end
function DummyActorProxy:OpenPageOnResume()
	return 0
end
function DummyActorProxy:EmptyCB()
	return 0
end
function DummyActorProxy:RegisterTaskCB()
	return 0
end
function DummyActorProxy:UnregisterTaskCB()
	return 0
end
DummyActorProxy.alias = 0
DummyActorProxy.metaPath = 0
DummyActorProxy.uActor = 0
DummyActorProxy.defaultAlias = 0
DummyActorProxy.bornSceneID = 0
DummyActorProxy.coroutineDic = 0
DummyActorProxy.dataIndex = 0
DummyActorProxy.isAutoStart = 0
DummyActorProxy.actorData = 0
DummyActorProxy.actorType = 0
DummyActorProxy.dontDestroyOnClear = 0
DummyActorProxy.CurrDialogList = 0
DummyActorProxy.CurrDialogIndex = 0
DummyActorProxy.CurrDuration = 0
DummyActorProxy.CurrDurationCnt = 0
DummyActorProxy.NarratorPauseLen = 0
DummyActorProxy.NarratorResumeLen = 0
DummyActorProxy.NarratorState = 0
DummyActorProxy.NarratorOnFinish = 0
DummyActorProxy.ReminderID = 0
DummyActorProxy.WarningNarratorTable = 0
DummyActorProxy.TaskOnResumeDelay = 0
DummyActorProxy.TaskOnPauseReminder = 0
DummyActorProxy.TaskOnResumeReminder = 0



function DummyActorProxy:CreateWindLocal()
	return 0
end
function DummyActorProxy:DestroyWindLocal()
	return 0
end
function DummyActorProxy:ShowEffect()
	return 0
end

function DummyActorProxy:CreateUActor()
	return 0
end



function DummyActorProxy:PreGetAlias()
	return 0
end
function DummyActorProxy:GetPropValue()
	return 0
end
function DummyActorProxy:WalkTo()
	return 0
end
function DummyActorProxy:WalkToRoute()
	return 0
end
function DummyActorProxy:WalkToRouteByData()
	return 0
end
function DummyActorProxy:RunTo()
	return 0
end
function DummyActorProxy:RunToRoute()
	return 0
end
function DummyActorProxy:RunToRouteByData()
	return 0
end
function DummyActorProxy:Standby()
	return 0
end
function DummyActorProxy:StandbyNoResume()
	return 0
end
function DummyActorProxy:ResumeMove()
	return 0
end
function DummyActorProxy:SyncPos()
	return 0
end
function DummyActorProxy:DoingFreeStyle()
	return 0
end
function DummyActorProxy:DoFreeStateTrigger()
	return 0
end
function DummyActorProxy:InvokeOnResetFreeStyle()
	return 0
end
function DummyActorProxy:TurnTo()
	return 0
end
function DummyActorProxy:GetPos()
	return CS.UnityEngine.Vector3.zero
end
function DummyActorProxy:GetEuler()
	return CS.UnityEngine.Vector3.zero
end
function DummyActorProxy:GetForward()
	return CS.UnityEngine.Vector3.zero
end
function DummyActorProxy:IsInIdle()
	return false
end
function DummyActorProxy:SetPosAndTurnTo()
	return 0
end
function DummyActorProxy:SetPos()
	return 0
end
function DummyActorProxy:Hide()
	return 0
end
function DummyActorProxy:HideSelf()
	return 0
end
function DummyActorProxy:ShowSelf()
	return 0
end
function DummyActorProxy:CheckShow()
	return 0
end
function DummyActorProxy:SitOnChair()
	return 0
end
function DummyActorProxy:StandFromChair()
	return 0
end
function DummyActorProxy:EnableAI()
	return 0
end
function DummyActorProxy:EnableInteraction()
	return 0
end
function DummyActorProxy:StartWalkTo()
	return 0
end
function DummyActorProxy:StartWalkToRoute()
	return 0
end
function DummyActorProxy:StartWalkToRouteByData()
	return 0
end
function DummyActorProxy:StartRunTo()
	return 0
end
function DummyActorProxy:StartRunToRoute()
	return 0
end
function DummyActorProxy:StartRunToRouteByData()
	return 0
end
function DummyActorProxy:StartFollowRunTo()
	return 0
end
function DummyActorProxy:StartFollowRunToRoute()
	return 0
end
function DummyActorProxy:StartFollowRunToRouteByData()
	return 0
end
function DummyActorProxy:CheckArrived()
	return 0
end
function DummyActorProxy:FinishFollow()
	return 0
end
function DummyActorProxy:CheckBeFollow()
	return 0
end
function DummyActorProxy:DisappearFollow()
	return 0
end
function DummyActorProxy:CheckBeFollowRoute()
	return 0
end
function DummyActorProxy:DisappearFollowRoute()
	return 0
end
function DummyActorProxy:CheckBeLock()
	return 0
end
function DummyActorProxy:WalkToTask()
	return 0
end
function DummyActorProxy:WalkToRouteTask()
	return 0
end
function DummyActorProxy:WalkToRouteByDataTask()
	return 0
end
function DummyActorProxy:RunToTask()
	return 0
end
function DummyActorProxy:RunToRouteTask()
	return 0
end
function DummyActorProxy:RunToRouteByDataTask()
	return 0
end
function DummyActorProxy:BeFollowTask()
	return 0
end
function DummyActorProxy:BeFollowTaskByData()
	return 0
end
function DummyActorProxy:BeFollowTaskByRoutePoints()
	return 0
end
function DummyActorProxy:BeFollowTaskByRouteConfig()
	return 0
end
function DummyActorProxy:ClearBeLockTask()
	return 0
end
function DummyActorProxy:BeLockTask()
	return 0
end
function DummyActorProxy:BeLockTaskByData()
	return 0
end
function DummyActorProxy:StartFreeStyle()
	return 0
end
function DummyActorProxy:ResumeFreeStyle()
	return 0
end
function DummyActorProxy:DoFreeStyleTask()
	return 0
end
function DummyActorProxy:SwitchAirMode()
	return 0
end
function DummyActorProxy:PerformDither()
	return 0
end
function DummyActorProxy:SetVisible()
	return 0
end
function DummyActorProxy:DestroyWithDither()
	return 0
end
function DummyActorProxy:Disappear()
	return 0
end
function DummyActorProxy:DestroyWithDisappear()
	return 0
end
function DummyActorProxy:SetActive()
	return 0
end
function DummyActorProxy:ClearThreatTask()
	return 0
end
function DummyActorProxy:OnThreatInfo()
	return 0
end
function DummyActorProxy:ThreatTask()
	return 0
end
function DummyActorProxy:SteerToTask()
	return 0
end
DummyActorProxy.configID = 0
DummyActorProxy.bornPos = 0
DummyActorProxy.bornDir = 0
DummyActorProxy.isNetwork = 0
DummyActorProxy.targetPos = 0
DummyActorProxy.routePoints = 0
DummyActorProxy.routeConfig = 0
DummyActorProxy.BeFollowLen = 0
DummyActorProxy.BeFollowFailedLen = 0
DummyActorProxy.BeFollowState = 0
DummyActorProxy.BeFollowFailed = 0
DummyActorProxy.OnTransFinishCallback = 0
DummyActorProxy.OnTransPreCallback = 0
DummyActorProxy.TransOffset = 0
DummyActorProxy.IsBeLocked = 0
DummyActorProxy.BeLockTransLen = 0
DummyActorProxy.OnFinishCB = 0
DummyActorProxy.OnMovePauseCB = 0
DummyActorProxy.OnMoveResumeCB = 0
DummyActorProxy.OnMoveFailedCB = 0
DummyActorProxy.freeStyleType = 0
DummyActorProxy.freeStyleForceInterrupt = 0

function DummyActorProxy:OnPostComponentPrepare()
	return 0
end

function DummyActorProxy:TriggerIn()
	return 0
end
function DummyActorProxy:TriggerOut()
	return 0
end


function DummyActorProxy:CreateGadgetUActor()
	return 0
end
function DummyActorProxy:OnUActorPostInit()
	return 0
end
function DummyActorProxy:DefaultTriggerIn()
	return 0
end
function DummyActorProxy:DefaultTriggerOut()
	return 0
end
function DummyActorProxy:DefaultTriggerDelayOut()
	return 0
end
function DummyActorProxy:CheckDelayTimeOut()
	return 0
end
function DummyActorProxy:AddComponentTrigger()
	return 0
end
function DummyActorProxy:AddTimeDelayOutTrigger()
	return 0
end
function DummyActorProxy:AddCommonTrigger()
	return 0
end
function DummyActorProxy:DestroySelf()
	return 0
end
DummyActorProxy.isTriggerIn = 0
DummyActorProxy.checkTimeGap = 0
DummyActorProxy.timeCnt = 0
DummyActorProxy.targetTime = 0
DummyActorProxy.triggerInHandler = 0
DummyActorProxy.triggerOutHandler = 0
DummyActorProxy.triggerTickHandler = 0
DummyActorProxy.triggerDelayOutHandler = 0

DummyActorProxy.PATH_QUEST_AREA = 0
DummyActorProxy.PostProcessCreateActor = 0
DummyActorProxy.CreateQuestArea = 0




function DummyActorProxy:TriggerTick()
	return 0
end
DummyActorProxy.shapeData = 0





















function DummyActorProxy:questTriggerInHandler()
	return 0
end
function DummyActorProxy:questTriggerOutHandler()
	return 0
end
function DummyActorProxy:questTriggerDelayOutHandler()
	return 0
end
DummyActorProxy.areaRadius = 0
DummyActorProxy.areaDistType = 0
DummyActorProxy.avatarOffset = 0
DummyActorProxy.questAreaInHandler = 0
DummyActorProxy.questAreaOutHandler = 0
DummyActorProxy.questAreaDelayOutHandler = 0











function DummyActorProxy:RegisterDayCallback()
	return 0
end
function DummyActorProxy:UnregisterDayCallback()
	return 0
end
function DummyActorProxy:RegisterNightCallback()
	return 0
end
function DummyActorProxy:UnregisterNightCallback()
	return 0
end
function DummyActorProxy:RegisterHourCallback()
	return 0
end
function DummyActorProxy:UnregisterHourCallback()
	return 0
end
function DummyActorProxy:RegisterWeatherCallback()
	return 0
end
function DummyActorProxy:UnregisterWeatherCallback()
	return 0
end
function DummyActorProxy:ChangeDefaultWeather()
	return 0
end
function DummyActorProxy:ChangeWeather()
	return 0
end
function DummyActorProxy:LeaveWeather()
	return 0
end
function DummyActorProxy:GetIsNight()
	return 0
end
function DummyActorProxy:ChangeDay24Time()
	return 0
end
function DummyActorProxy:StartGuide()
	return 0
end
function DummyActorProxy:EndGuide()
	return 0
end
function DummyActorProxy:StopLocalAvatar()
	return 0
end
function DummyActorProxy:LoadSectorByPos()
	return 0
end
function DummyActorProxy:SetAvatarEuler()
	return 0
end
function DummyActorProxy:ChangeToHero()
	return 0
end
function DummyActorProxy:IsHeroMale()
	return 0
end
function DummyActorProxy:FinishAllNarrator()
	return 0
end
function DummyActorProxy:PlayerBackButtonOn()
	return 0
end
function DummyActorProxy:PlayerBackButtonOff()
	return 0
end
function DummyActorProxy:PlayerEnterDungeon()
	return 0
end
DummyActorProxy.isDay = 0
DummyActorProxy.isNight = 0
DummyActorProxy.currWeather = 0
DummyActorProxy.BtnTransmitData = 0

function DummyActorProxy:OnInterStart()
	return 0
end
function DummyActorProxy:OnInterFinish()
	return 0
end
function DummyActorProxy:Unregister()
	return 0
end









function DummyActorProxy:CallStartDay()
	return 0
end
function DummyActorProxy:CallStartNight()
	return 0
end
function DummyActorProxy:RegisterDailyHandler()
	return 0
end
function DummyActorProxy:UnregisterDailyHandler()
	return 0
end
function DummyActorProxy:DoAppear()
	return 0
end
function DummyActorProxy:DoDisappear()
	return 0
end
function DummyActorProxy:RegisterMode()
	return 0
end
function DummyActorProxy:StartDaily()
	return 0
end
function DummyActorProxy:ResetDaily()
	return 0
end
DummyActorProxy.OnCollisionEnter = 0
DummyActorProxy.OnEvent = 0
DummyActorProxy.StartDay = 0
DummyActorProxy.StartNight = 0
DummyActorProxy.HourBehave = 0
DummyActorProxy.modeDic = 0

function DummyActorProxy:OnCollisionEnter()
	return 0
end
function DummyActorProxy:StartDay()
	return 0
end
function DummyActorProxy:GoChat()
	return 0
end
function DummyActorProxy:SelfPointUpdate()
	return 0
end
function DummyActorProxy:Chat()
	return 0
end
function DummyActorProxy:HourBehave()
	return 0
end
function DummyActorProxy:StartNight()
	return 0
end
function DummyActorProxy:GoHome()
	return 0
end
function DummyActorProxy:GoHomeRoute()
	return 0
end
function DummyActorProxy:OnEvent()
	return 0
end
DummyActorProxy.pointID = 0




function DummyActorProxy:RandomStand()
	return 0
end
function DummyActorProxy:TargetDect()
	return 0
end
function DummyActorProxy:NextMove()
	return 0
end
function DummyActorProxy:DelayChat()
	return 0
end


function DummyActorProxy:GoPatrol()
	return 0
end
function DummyActorProxy:GoPatrolRoute()
	return 0
end


function DummyActorProxy:ShowBubble()
	return 0
end
function DummyActorProxy:BubbleTime()
	return 0
end
function DummyActorProxy:CloseBubble()
	return 0
end
function DummyActorProxy:BubbleGap()
	return 0
end
function DummyActorProxy:Play()
	return 0
end
function DummyActorProxy:Home()
	return 0
end





function DummyActorProxy:CreateNpcUActor()
	return 0
end
function DummyActorProxy:AddPriorityInter()
	return 0
end
function DummyActorProxy:ClearPriorityInter()
	return 0
end
function DummyActorProxy:CheckNpcTalk()
	return 0
end
function DummyActorProxy:CallOnCollisionEnter()
	return 0
end
function DummyActorProxy:ClearOnCollisionEnter()
	return 0
end
function DummyActorProxy:EnableHeadCtrl()
	return 0
end



function DummyActorProxy:RecoverFromFreeStyle()
	return 0
end
function DummyActorProxy:RecoverFromCollisionEnter()
	return 0
end
function DummyActorProxy:Recover()
	return 0
end
function DummyActorProxy:DataInit()
	return 0
end
function DummyActorProxy:StartBubble()
	return 0
end
function DummyActorProxy:GoPatrol1()
	return 0
end
function DummyActorProxy:GoPatrolRoute1()
	return 0
end
function DummyActorProxy:SelfPointUpdate1()
	return 0
end

function DummyActorProxy:AfterSit()
	return 0
end

function DummyActorProxy:WalkBack()
	return 0
end



function DummyActorProxy:ChooseRandomPos()
	return 0
end





function DummyActorProxy:GetMode()
	return 0
end
DummyActorProxy.ModeScript = 0





function DummyActorProxy:StartPatrol()
	return 0
end
function DummyActorProxy:Behave()
	return 0
end
function DummyActorProxy:ReturnToPatrol()
	return 0
end
function DummyActorProxy:Aware()
	return 0
end
function DummyActorProxy:CheckLure()
	return 0
end
function DummyActorProxy:OnLure()
	return 0
end
function DummyActorProxy:Discover()
	return 0
end
function DummyActorProxy:Stun()
	return 0
end
DummyActorProxy.PatrolPosNum = 0
DummyActorProxy.PatrolPos = 0
DummyActorProxy.PatrolDir = 0
DummyActorProxy.PatrolNext = 0







function DummyActorProxy:GoStore()
	return 0
end
function DummyActorProxy:GoStoreRoute()
	return 0
end






function DummyActorProxy:DoOnCollisionEnter()
	return 0
end
function DummyActorProxy:GoOn()
	return 0
end
function DummyActorProxy:Walk()
	return 0
end

function DummyActorProxy:OnSubStartHandlerBuild()
	return 0
end
function DummyActorProxy:OnSubFinishHandlerBuild()
	return 0
end
function DummyActorProxy:AmborIntoDungeon()
	return 0
end
function DummyActorProxy:ShowTutorial1()
	return 0
end
function DummyActorProxy:ShowTutorial2()
	return 0
end
function DummyActorProxy:ShowTutorial3()
	return 0
end
function DummyActorProxy:OnSubFinish30600()
	return 0
end
function DummyActorProxy:OnSubStart30602()
	return 0
end
function DummyActorProxy:OnSubStart30610()
	return 0
end
function DummyActorProxy:OnSubFinish30604()
	return 0
end
function DummyActorProxy:OnSubFinish30607()
	return 0
end
function DummyActorProxy:OnSubFinish30608()
	return 0
end
function DummyActorProxy:OnSubFinish30609()
	return 0
end
function DummyActorProxy:OnSubFinish30610()
	return 0
end
function DummyActorProxy:OnSubFinish30612()
	return 0
end

function DummyActorProxy:GaiaIntoDungeon()
	return 0
end
function DummyActorProxy:On30713CutsceneFinish()
	return 0
end
function DummyActorProxy:GaiaDestroy()
	return 0
end
function DummyActorProxy:OnSubFinish30700()
	return 0
end
function DummyActorProxy:OnSubStart30702()
	return 0
end
function DummyActorProxy:OnSubStart30704()
	return 0
end
function DummyActorProxy:OnSubStart30710()
	return 0
end
function DummyActorProxy:OnSubStart30713()
	return 0
end
function DummyActorProxy:OnSubStart30715()
	return 0
end
function DummyActorProxy:OnSubFinish30704()
	return 0
end
function DummyActorProxy:OnSubFinish30710()
	return 0
end
function DummyActorProxy:OnSubFinish30707()
	return 0
end
function DummyActorProxy:OnSubFinish30708()
	return 0
end
function DummyActorProxy:OnSubFinish30709()
	return 0
end
function DummyActorProxy:OnSubFinish30712()
	return 0
end
function DummyActorProxy:OnSubFinish30713()
	return 0
end

function DummyActorProxy:LisaIntoDungeon()
	return 0
end
function DummyActorProxy:LisaDestroy()
	return 0
end
function DummyActorProxy:OnSubFinish30800()
	return 0
end
function DummyActorProxy:OnSubStart30802()
	return 0
end
function DummyActorProxy:OnSubStart30810()
	return 0
end
function DummyActorProxy:OnSubStart30814()
	return 0
end
function DummyActorProxy:OnSubFinish30804()
	return 0
end
function DummyActorProxy:OnSubFinish30810()
	return 0
end
function DummyActorProxy:OnSubFinish30807()
	return 0
end
function DummyActorProxy:OnSubFinish30808()
	return 0
end
function DummyActorProxy:OnSubFinish30809()
	return 0
end
function DummyActorProxy:OnSubFinish30812()
	return 0
end
function DummyActorProxy:OnSubFinish30814()
	return 0
end

function DummyActorProxy:PaimonVanish()
	return 0
end
function DummyActorProxy:OnSubStart30902()
	return 0
end
function DummyActorProxy:OnSubStart30904()
	return 0
end
function DummyActorProxy:OnSubFinish30902()
	return 0
end

function DummyActorProxy:OnSubStart31101()
	return 0
end
function DummyActorProxy:OnSubFinish31101()
	return 0
end

function DummyActorProxy:OnSubStart35001()
	return 0
end
function DummyActorProxy:OnSubFinish35001()
	return 0
end

function DummyActorProxy:OnSubStart35104()
	return 0
end
function DummyActorProxy:PlayAwakeCutscene()
	return 0
end
function DummyActorProxy:StartAllTutorial()
	return 0
end
function DummyActorProxy:On35104CutsceneFinish()
	return 0
end
function DummyActorProxy:OnSubFinish35104()
	return 0
end
function DummyActorProxy:OnSubStart35101()
	return 0
end
function DummyActorProxy:OnSubStart35106()
	return 0
end
function DummyActorProxy:OnSubFinish35106()
	return 0
end
function DummyActorProxy:AfterAni()
	return 0
end
function DummyActorProxy:TotorialContent()
	return 0
end
function DummyActorProxy:OnSubFinish35107()
	return 0
end
function DummyActorProxy:OnSubFinish35101()
	return 0
end
function DummyActorProxy:OnSubStart35103()
	return 0
end
function DummyActorProxy:OnSubFinish35103()
	return 0
end
function DummyActorProxy:OnSubStart35102()
	return 0
end
function DummyActorProxy:OnSubFinish35102()
	return 0
end

function DummyActorProxy:PaimonCreat()
	return 0
end
function DummyActorProxy:On35201CutsceneFinish()
	return 0
end
function DummyActorProxy:ShowGoddess()
	return 0
end
function DummyActorProxy:HideGoddess()
	return 0
end
function DummyActorProxy:On35204CutsceneFinish()
	return 0
end
function DummyActorProxy:Actionsafe()
	return 0
end
function DummyActorProxy:InteractPaimon()
	return 0
end
function DummyActorProxy:OnSubFinish35200()
	return 0
end
function DummyActorProxy:OnSubFinish35201()
	return 0
end
function DummyActorProxy:OnSubStart35202()
	return 0
end
function DummyActorProxy:OnSubStart35203()
	return 0
end
function DummyActorProxy:OnSubFinish35203()
	return 0
end
function DummyActorProxy:OnSubStart35204()
	return 0
end
function DummyActorProxy:On35204CutsceneStart()
	return 0
end
function DummyActorProxy:OnSubFinish35204()
	return 0
end

function DummyActorProxy:ShowTutorial()
	return 0
end
function DummyActorProxy:On35309CutsceneFinish()
	return 0
end
function DummyActorProxy:On35309CutsceneStart()
	return 0
end
function DummyActorProxy:PlayerName()
	return 0
end
function DummyActorProxy:Cutscene35309()
	return 0
end
function DummyActorProxy:OnSubStart35301()
	return 0
end
function DummyActorProxy:OnSubFinish35301()
	return 0
end
function DummyActorProxy:OnSubStart35302()
	return 0
end
function DummyActorProxy:TargetDes1()
	return 0
end
function DummyActorProxy:Skill()
	return 0
end
function DummyActorProxy:SkillTurorial()
	return 0
end
function DummyActorProxy:OnSubStart35303()
	return 0
end
function DummyActorProxy:TargetDes2()
	return 0
end
function DummyActorProxy:OnSubStart35304()
	return 0
end
function DummyActorProxy:TargetDes3()
	return 0
end
function DummyActorProxy:OnSubFinish35304()
	return 0
end
function DummyActorProxy:OnSubStart35308()
	return 0
end
function DummyActorProxy:OnSubStart35309()
	return 0
end
function DummyActorProxy:OnSubFinish35308()
	return 0
end
function DummyActorProxy:OnSubStart35312()
	return 0
end
function DummyActorProxy:OnSubFinish35312()
	return 0
end
function DummyActorProxy:OnSubFinish35311()
	return 0
end
function DummyActorProxy:OnNarratorFinish()
	return 0
end

function DummyActorProxy:On35401CutsceneFinish()
	return 0
end
function DummyActorProxy:AmborHide()
	return 0
end
function DummyActorProxy:OnEnableInput()
	return 0
end
function DummyActorProxy:On35403CutsceneFinish()
	return 0
end
function DummyActorProxy:OnSubFinish35401()
	return 0
end
function DummyActorProxy:OnSubStart35402()
	return 0
end
function DummyActorProxy:OnSubFinish35402()
	return 0
end
function DummyActorProxy:OnSubFinish35403()
	return 0
end
function DummyActorProxy:OnSubFinish35404()
	return 0
end
function DummyActorProxy:OnSubFinish35405()
	return 0
end

function DummyActorProxy:On35502CutsceneFinish()
	return 0
end
function DummyActorProxy:Tear()
	return 0
end
function DummyActorProxy:Story1()
	return 0
end
function DummyActorProxy:OnSubFinish35502()
	return 0
end
function DummyActorProxy:OnSubStart35503()
	return 0
end
function DummyActorProxy:OnSubFinish35503()
	return 0
end
function DummyActorProxy:OnSubStart35504()
	return 0
end
function DummyActorProxy:OnSubFinish35504()
	return 0
end
function DummyActorProxy:OnSubStart35505()
	return 0
end
function DummyActorProxy:OnSubFinish35505()
	return 0
end

function DummyActorProxy:AmborRoute()
	return 0
end
function DummyActorProxy:On35602CutsceneFinish()
	return 0
end
function DummyActorProxy:OnBright()
	return 0
end
function DummyActorProxy:On35601CutsceneFinish()
	return 0
end
function DummyActorProxy:OnSubStart35601()
	return 0
end
function DummyActorProxy:OnSubStart35602()
	return 0
end
function DummyActorProxy:OnSubStart35603()
	return 0
end
function DummyActorProxy:OnSubStart35604()
	return 0
end
function DummyActorProxy:OnSubStart35605()
	return 0
end
function DummyActorProxy:OnSubStart35606()
	return 0
end
function DummyActorProxy:OnSubFinish35601()
	return 0
end
function DummyActorProxy:OnSubFinish35602()
	return 0
end
function DummyActorProxy:OnSubFinish35603()
	return 0
end
function DummyActorProxy:OnSubFinish35604()
	return 0
end
function DummyActorProxy:OnSubFinish35605()
	return 0
end
function DummyActorProxy:OnSubFinish35606()
	return 0
end

function DummyActorProxy:GaiaVanish()
	return 0
end
function DummyActorProxy:AmborVanish()
	return 0
end
function DummyActorProxy:NarratorFly()
	return 0
end
function DummyActorProxy:FlyTutorial()
	return 0
end
function DummyActorProxy:BeforeShoot()
	return 0
end
function DummyActorProxy:ShootTutorial()
	return 0
end
function DummyActorProxy:Story2()
	return 0
end
function DummyActorProxy:On35701CutsceneFinish()
	return 0
end
function DummyActorProxy:On35722CutsceneFinish()
	return 0
end
function DummyActorProxy:DesStone4()
	return 0
end
function DummyActorProxy:OnSubStart35701()
	return 0
end
function DummyActorProxy:OnSubFinish35701()
	return 0
end
function DummyActorProxy:OnSubFinish35702()
	return 0
end
function DummyActorProxy:OnSubFinish35703()
	return 0
end
function DummyActorProxy:OnSubFinish35704()
	return 0
end
function DummyActorProxy:OnSubFinish35705()
	return 0
end
function DummyActorProxy:OnSubFinish35706()
	return 0
end
function DummyActorProxy:OnSubFinish35707()
	return 0
end
function DummyActorProxy:OnSubStart35709()
	return 0
end
function DummyActorProxy:OnSubStart35711()
	return 0
end
function DummyActorProxy:OnSubFinish35711()
	return 0
end
function DummyActorProxy:OnSubFinish35708()
	return 0
end
function DummyActorProxy:OnSubFinish35709()
	return 0
end
function DummyActorProxy:OnSubStart35721()
	return 0
end
function DummyActorProxy:OnSubStart35722()
	return 0
end
function DummyActorProxy:OnSubStart35723()
	return 0
end
function DummyActorProxy:OnSubStart35724()
	return 0
end
function DummyActorProxy:OnSubStart35725()
	return 0
end
function DummyActorProxy:OnSubFinish35721()
	return 0
end
function DummyActorProxy:OnSubFinish35722()
	return 0
end
function DummyActorProxy:OnSubFinish35723()
	return 0
end
function DummyActorProxy:OnSubFinish35724()
	return 0
end
function DummyActorProxy:OnSubFinish35725()
	return 0
end

function DummyActorProxy:On35801CutsceneFinish()
	return 0
end
function DummyActorProxy:OnSubFinish35801()
	return 0
end
function DummyActorProxy:OnSubFinish35802()
	return 0
end

function DummyActorProxy:OnSubStart35901()
	return 0
end
function DummyActorProxy:OnSubStart35902()
	return 0
end
function DummyActorProxy:OnSubStart35903()
	return 0
end
function DummyActorProxy:OnSubStart35904()
	return 0
end
function DummyActorProxy:OnSubFinish35901()
	return 0
end
function DummyActorProxy:OnSubFinish35902()
	return 0
end
function DummyActorProxy:OnSubFinish35903()
	return 0
end
function DummyActorProxy:OnSubFinish35904()
	return 0
end

function DummyActorProxy:OnSubStart36001()
	return 0
end
function DummyActorProxy:OnSubFinish36001()
	return 0
end
function DummyActorProxy:OnSubFinish36002()
	return 0
end
function DummyActorProxy:OnSubFinish36003()
	return 0
end
function DummyActorProxy:Interact()
	return 0
end
function DummyActorProxy:OnSubStart36004()
	return 0
end
function DummyActorProxy:OnSubFinish36004()
	return 0
end
function DummyActorProxy:Finish36004Do()
	return 0
end
function DummyActorProxy:OnSubFinish36005()
	return 0
end
function DummyActorProxy:On36005CutsceneFinish()
	return 0
end

function DummyActorProxy:CameraMove()
	return 0
end
function DummyActorProxy:PaimonQ361Narrator()
	return 0
end
function DummyActorProxy:AutoFinishQuest()
	return 0
end
function DummyActorProxy:OnSubStart36100()
	return 0
end
function DummyActorProxy:OnSubFinish36100()
	return 0
end
function DummyActorProxy:OnSubStart36101()
	return 0
end

function DummyActorProxy:ClueaNarrtor()
	return 0
end
function DummyActorProxy:OnMainStart()
	return 0
end
function DummyActorProxy:OnSubStart()
	return 0
end
function DummyActorProxy:OnSubFinished()
	return 0
end
function DummyActorProxy:OnRewind()
	return 0
end
function DummyActorProxy:OnMainFinished()
	return 0
end



function DummyActorProxy:On50402CutsceneFinish()
	return 0
end


function DummyActorProxy:OnSubStart46701()
	return 0
end
function DummyActorProxy:OnSubFinish46701()
	return 0
end

function DummyActorProxy:OnSubStart46801()
	return 0
end
function DummyActorProxy:OnSubFinish46801()
	return 0
end

function DummyActorProxy:OnSubFinish46904()
	return 0
end
function DummyActorProxy:OnSubStart46901()
	return 0
end
function DummyActorProxy:OnSubFinish46901()
	return 0
end
function DummyActorProxy:OnSubFinish46902()
	return 0
end
function DummyActorProxy:OnSubFinish46903()
	return 0
end
function DummyActorProxy:Finish46903Do()
	return 0
end

function DummyActorProxy:PaimonAppearTalk()
	return 0
end
function DummyActorProxy:PaimonAppearTalkAfterBuy()
	return 0
end
function DummyActorProxy:OnSubStart47002()
	return 0
end
function DummyActorProxy:OnSubFinish47002()
	return 0
end
function DummyActorProxy:OnSubStart47004()
	return 0
end
function DummyActorProxy:OnSubFinish47004()
	return 0
end

function DummyActorProxy:PaimonDis()
	return 0
end
function DummyActorProxy:PaimonDelay()
	return 0
end
function DummyActorProxy:OnSubStart45101()
	return 0
end
function DummyActorProxy:OnSubStart45102()
	return 0
end
function DummyActorProxy:OnSubStart45103()
	return 0
end
function DummyActorProxy:OnSubStart45104()
	return 0
end
function DummyActorProxy:OnSubFinish45101()
	return 0
end
function DummyActorProxy:OnSubFinish45102()
	return 0
end
function DummyActorProxy:OnSubFinish45103()
	return 0
end
function DummyActorProxy:OnSubFinish45104()
	return 0
end

function DummyActorProxy:AmborToFight()
	return 0
end
function DummyActorProxy:OnSubStart45201()
	return 0
end
function DummyActorProxy:OnSubStart45202()
	return 0
end
function DummyActorProxy:OnSubStart45203()
	return 0
end
function DummyActorProxy:OnSubStart45204()
	return 0
end
function DummyActorProxy:OnSubStart45205()
	return 0
end
function DummyActorProxy:OnSubFinish45201()
	return 0
end
function DummyActorProxy:OnSubFinish45202()
	return 0
end
function DummyActorProxy:OnSubFinish45203()
	return 0
end
function DummyActorProxy:OnSubFinish45204()
	return 0
end
function DummyActorProxy:OnSubFinish45205()
	return 0
end

function DummyActorProxy:FarmersPrepare()
	return 0
end
function DummyActorProxy:OnSubStart45301()
	return 0
end
function DummyActorProxy:OnSubStart45302()
	return 0
end
function DummyActorProxy:OnSubStart45303()
	return 0
end
function DummyActorProxy:OnSubStart45304()
	return 0
end
function DummyActorProxy:OnSubStart45305()
	return 0
end
function DummyActorProxy:OnSubStart45306()
	return 0
end
function DummyActorProxy:OnSubFinish45301()
	return 0
end
function DummyActorProxy:OnSubFinish45302()
	return 0
end
function DummyActorProxy:OnSubFinish45303()
	return 0
end
function DummyActorProxy:OnSubFinish45304()
	return 0
end
function DummyActorProxy:OnSubFinish45305()
	return 0
end
function DummyActorProxy:OnSubFinish45306()
	return 0
end

function DummyActorProxy:OnSubStart45401()
	return 0
end
function DummyActorProxy:OnSubStart45402()
	return 0
end
function DummyActorProxy:OnSubStart45403()
	return 0
end
function DummyActorProxy:OnSubStart45404()
	return 0
end
function DummyActorProxy:OnSubStart45405()
	return 0
end
function DummyActorProxy:OnSubStart45406()
	return 0
end
function DummyActorProxy:OnSubFinish45401()
	return 0
end
function DummyActorProxy:OnSubFinish45402()
	return 0
end
function DummyActorProxy:OnSubFinish45403()
	return 0
end
function DummyActorProxy:OnSubFinish45404()
	return 0
end
function DummyActorProxy:OnSubFinish45405()
	return 0
end
function DummyActorProxy:OnSubFinish45406()
	return 0
end

function DummyActorProxy:DestroyNpc()
	return 0
end
function DummyActorProxy:MoveKaeya()
	return 0
end
function DummyActorProxy:DestroyKaeya()
	return 0
end
function DummyActorProxy:KaeyaTask()
	return 0
end
function DummyActorProxy:KaeyaTask2()
	return 0
end
function DummyActorProxy:KaeyaTask3()
	return 0
end
function DummyActorProxy:NPCTask()
	return 0
end
function DummyActorProxy:OnSubStart46101()
	return 0
end
function DummyActorProxy:OnSubFinish46101()
	return 0
end
function DummyActorProxy:OnSubStart46102()
	return 0
end
function DummyActorProxy:OnSubFinish46102()
	return 0
end
function DummyActorProxy:OnSubStart46109()
	return 0
end
function DummyActorProxy:StartTalk()
	return 0
end
function DummyActorProxy:OnSubFinish46109()
	return 0
end
function DummyActorProxy:OnSubStart46103()
	return 0
end
function DummyActorProxy:OnSubStart46104()
	return 0
end
function DummyActorProxy:CountTalk()
	return 0
end
function DummyActorProxy:OnSubFinish46104()
	return 0
end
function DummyActorProxy:OnSubFinish46105()
	return 0
end
function DummyActorProxy:OnSubFinish46106()
	return 0
end
function DummyActorProxy:OnSubFinish46107()
	return 0
end
function DummyActorProxy:OnSubStart46107()
	return 0
end

function DummyActorProxy:OnSubStart46201()
	return 0
end
function DummyActorProxy:OnSubStart46202()
	return 0
end
function DummyActorProxy:SceneLookCamera()
	return 0
end
function DummyActorProxy:PaimonNarrator()
	return 0
end
function DummyActorProxy:PlayerInputOn()
	return 0
end
function DummyActorProxy:OnSubStart46203()
	return 0
end
function DummyActorProxy:OnSubFinish46203()
	return 0
end
function DummyActorProxy:OnSubStart46204()
	return 0
end
function DummyActorProxy:StartTalk46204()
	return 0
end
function DummyActorProxy:OnSubFinish46204()
	return 0
end
function DummyActorProxy:OnSubStart46206()
	return 0
end
function DummyActorProxy:OnSubFinish46206()
	return 0
end
function DummyActorProxy:OnSubFinish46205()
	return 0
end
function DummyActorProxy:OnSubFinish46207()
	return 0
end
function DummyActorProxy:OnSubStart46210()
	return 0
end
function DummyActorProxy:OnSubFinish46210()
	return 0
end

function DummyActorProxy:PaimonEnter()
	return 0
end
function DummyActorProxy:KaeyaLeave()
	return 0
end
function DummyActorProxy:Soldier1Enter()
	return 0
end
function DummyActorProxy:Soldier2Enter()
	return 0
end
function DummyActorProxy:KaeyaEnter()
	return 0
end
function DummyActorProxy:NPCEnter()
	return 0
end
function DummyActorProxy:NPCRun()
	return 0
end
function DummyActorProxy:NPCRun2()
	return 0
end
function DummyActorProxy:NPCTrans()
	return 0
end
function DummyActorProxy:PaiMonTrans()
	return 0
end
function DummyActorProxy:KaeyaTrans()
	return 0
end
function DummyActorProxy:NPCDisappear()
	return 0
end
function DummyActorProxy:OnSubFinish46306()
	return 0
end
function DummyActorProxy:StartTalk46300()
	return 0
end
function DummyActorProxy:StartTalk46301()
	return 0
end
function DummyActorProxy:OnSubStart46300()
	return 0
end
function DummyActorProxy:OnSubFinish46300()
	return 0
end
function DummyActorProxy:OnSubStart46301()
	return 0
end
function DummyActorProxy:OnSubFinish46301()
	return 0
end
function DummyActorProxy:OnSubStart46302()
	return 0
end
function DummyActorProxy:OnSubStart46303()
	return 0
end
function DummyActorProxy:OnSubStart46304()
	return 0
end
function DummyActorProxy:OnSubStart46307()
	return 0
end
function DummyActorProxy:OnSubFinish46307()
	return 0
end
function DummyActorProxy:OnSubStart46305()
	return 0
end
function DummyActorProxy:OnSubFinish46305()
	return 0
end

function DummyActorProxy:OnSubFinish46406()
	return 0
end
function DummyActorProxy:OnSubFinish46407()
	return 0
end
function DummyActorProxy:Finish46407Do()
	return 0
end

function DummyActorProxy:OnSubFinish46502()
	return 0
end
function DummyActorProxy:OnSubFinish46503()
	return 0
end
function DummyActorProxy:OnSubFinish46505()
	return 0
end
function DummyActorProxy:Finish46505Do()
	return 0
end
function DummyActorProxy:OnSubFinish46507()
	return 0
end
function DummyActorProxy:OnSubFinish46508()
	return 0
end
function DummyActorProxy:OnSubFinish46509()
	return 0
end
function DummyActorProxy:SANMinusi()
	return 0
end
function DummyActorProxy:SANMinusj()
	return 0
end
function DummyActorProxy:SANMinusk()
	return 0
end
function DummyActorProxy:ESC()
	return 0
end
function DummyActorProxy:SUC()
	return 0
end
function DummyActorProxy:OnSubStart46510()
	return 0
end
function DummyActorProxy:OnSubStart46514()
	return 0
end
function DummyActorProxy:OnSubFinish46518()
	return 0
end
function DummyActorProxy:OnSubFinish46514()
	return 0
end
function DummyActorProxy:Finish46514Do()
	return 0
end
function DummyActorProxy:OnSubFinish46512()
	return 0
end
function DummyActorProxy:OnSubFinish46513()
	return 0
end
function DummyActorProxy:Finish46513Do()
	return 0
end

function DummyActorProxy:OnSubStart46601()
	return 0
end
function DummyActorProxy:OnSubFinish46601()
	return 0
end
function DummyActorProxy:OnSubFinish46602()
	return 0
end
function DummyActorProxy:Finish46602Do()
	return 0
end
function DummyActorProxy:OnSubFinish46603()
	return 0
end
function DummyActorProxy:Finish46603Do()
	return 0
end
function DummyActorProxy:OnSubFinish46604()
	return 0
end
function DummyActorProxy:OnSubFinish46605()
	return 0
end
function DummyActorProxy:Finish46605Do()
	return 0
end
function DummyActorProxy:OnSubFinish46608()
	return 0
end
function DummyActorProxy:OnSubFinish46610()
	return 0
end
function DummyActorProxy:OnSubStart46611()
	return 0
end
function DummyActorProxy:StartCount()
	return 0
end
function DummyActorProxy:CountDown()
	return 0
end
function DummyActorProxy:OnSubStart46619()
	return 0
end
function DummyActorProxy:AdvanceQuest()
	return 0
end
function DummyActorProxy:OnSubFinish46620()
	return 0
end
function DummyActorProxy:OnSubFinish46611()
	return 0
end
function DummyActorProxy:OnSubFinish46612()
	return 0
end
function DummyActorProxy:OnSubFinish46613()
	return 0
end
function DummyActorProxy:OnSubFinish46614()
	return 0
end
function DummyActorProxy:OnSubFinish46615()
	return 0
end
function DummyActorProxy:OnSubFinish46616()
	return 0
end
function DummyActorProxy:Finish46616Do()
	return 0
end
function DummyActorProxy:OnSubFinish46617()
	return 0
end
function DummyActorProxy:OnSubFinish46618()
	return 0
end
function DummyActorProxy:Finish46618Do()
	return 0
end



function DummyActorProxy:OnRewind30403()
	return 0
end



function DummyActorProxy:OnSubStart37001()
	return 0
end
function DummyActorProxy:OnSubStart37002()
	return 0
end
function DummyActorProxy:OnSubStart37003()
	return 0
end
function DummyActorProxy:OnSubFinish37001()
	return 0
end
function DummyActorProxy:OnSubFinish37002()
	return 0
end
function DummyActorProxy:OnSubFinish37003()
	return 0
end

function DummyActorProxy:OnSubStart37101()
	return 0
end
function DummyActorProxy:OnSubStart37102()
	return 0
end
function DummyActorProxy:OnSubStart37103()
	return 0
end
function DummyActorProxy:OnSubStart37104()
	return 0
end
function DummyActorProxy:OnSubStart37105()
	return 0
end
function DummyActorProxy:OnSubStart37106()
	return 0
end
function DummyActorProxy:OnSubStart37107()
	return 0
end
function DummyActorProxy:OnSubStart37108()
	return 0
end
function DummyActorProxy:OnSubStart37109()
	return 0
end
function DummyActorProxy:OnSubStart37110()
	return 0
end
function DummyActorProxy:OnSubStart37111()
	return 0
end
function DummyActorProxy:OnSubStart37112()
	return 0
end
function DummyActorProxy:OnSubStart37113()
	return 0
end
function DummyActorProxy:OnSubStart37114()
	return 0
end
function DummyActorProxy:OnSubStart37115()
	return 0
end
function DummyActorProxy:RequestPaimon()
	return 0
end
function DummyActorProxy:OnSubFinish37101()
	return 0
end
function DummyActorProxy:OnSubFinish37102()
	return 0
end
function DummyActorProxy:WendyRun()
	return 0
end
function DummyActorProxy:OnSubFinish37103()
	return 0
end
function DummyActorProxy:OnSubFinish37104()
	return 0
end
function DummyActorProxy:OnSubFinish37105()
	return 0
end
function DummyActorProxy:OnSubFinish37106()
	return 0
end
function DummyActorProxy:OnSubFinish37107()
	return 0
end
function DummyActorProxy:OnSubFinish37108()
	return 0
end
function DummyActorProxy:OnSubFinish37109()
	return 0
end
function DummyActorProxy:OnSubFinish37110()
	return 0
end
function DummyActorProxy:OnSubFinish37111()
	return 0
end
function DummyActorProxy:OnSubFinish37112()
	return 0
end
function DummyActorProxy:OnSubFinish37113()
	return 0
end
function DummyActorProxy:OnSubFinish37114()
	return 0
end
function DummyActorProxy:OnSubFinish37115()
	return 0
end

function DummyActorProxy:OnSubStart37201()
	return 0
end
function DummyActorProxy:OnSubStart37202()
	return 0
end
function DummyActorProxy:OnSubStart37203()
	return 0
end
function DummyActorProxy:OnSubStart37204()
	return 0
end
function DummyActorProxy:Play372Cutscene()
	return 0
end
function DummyActorProxy:RequestWendy()
	return 0
end
function DummyActorProxy:OnSubFinish37201()
	return 0
end
function DummyActorProxy:OnSubFinish37202()
	return 0
end
function DummyActorProxy:OnSubFinish37203()
	return 0
end
function DummyActorProxy:OnSubFinish37204()
	return 0
end
function DummyActorProxy:BlackDoSth()
	return 0
end
function DummyActorProxy:DestroyNPC()
	return 0
end
function DummyActorProxy:wendyVanish()
	return 0
end

function DummyActorProxy:OnSubStart37301()
	return 0
end
function DummyActorProxy:OnSubStart37302()
	return 0
end
function DummyActorProxy:OnSubStart37303()
	return 0
end
function DummyActorProxy:OnSubFinish37301()
	return 0
end
function DummyActorProxy:OnSubFinish37302()
	return 0
end
function DummyActorProxy:OnSubFinish37303()
	return 0
end

function DummyActorProxy:OnSubStart37401()
	return 0
end
function DummyActorProxy:OnSubStart37402()
	return 0
end
function DummyActorProxy:OnSubStart37403()
	return 0
end
function DummyActorProxy:OnSubStart37404()
	return 0
end
function DummyActorProxy:OnSubStart37405()
	return 0
end
function DummyActorProxy:OnSubStart37406()
	return 0
end
function DummyActorProxy:OnSubFinish37401()
	return 0
end
function DummyActorProxy:OnSubFinish37402()
	return 0
end
function DummyActorProxy:OnSubFinish37403()
	return 0
end
function DummyActorProxy:OnSubFinish37404()
	return 0
end
function DummyActorProxy:OnSubFinish37405()
	return 0
end
function DummyActorProxy:OnSubFinish37406()
	return 0
end

function DummyActorProxy:FailMovePlayer()
	return 0
end
function DummyActorProxy:SuccessMovePlayer()
	return 0
end
function DummyActorProxy:PlayFirstCutscene()
	return 0
end
function DummyActorProxy:SuccTrans()
	return 0
end
function DummyActorProxy:FinishSneak()
	return 0
end
function DummyActorProxy:PlaySecondCutscene()
	return 0
end
function DummyActorProxy:SneakAIPrepare()
	return 0
end
function DummyActorProxy:SneakAIDestroy()
	return 0
end
function DummyActorProxy:OnSubStart37501()
	return 0
end
function DummyActorProxy:OnSubStart37502()
	return 0
end
function DummyActorProxy:OnSubStart37503()
	return 0
end
function DummyActorProxy:OnSubStart37504()
	return 0
end
function DummyActorProxy:OnSubStart37505()
	return 0
end
function DummyActorProxy:OnSubStart37506()
	return 0
end
function DummyActorProxy:SneakStart()
	return 0
end
function DummyActorProxy:OnSubStart37507()
	return 0
end
function DummyActorProxy:Trans()
	return 0
end
function DummyActorProxy:OnSubFinish37501()
	return 0
end
function DummyActorProxy:OnSubFinish37502()
	return 0
end
function DummyActorProxy:OnSubFinish37503()
	return 0
end
function DummyActorProxy:OnSubFinish37504()
	return 0
end
function DummyActorProxy:OnSubFinish37505()
	return 0
end
function DummyActorProxy:OnSubFinish37506()
	return 0
end

function DummyActorProxy:WendyDis()
	return 0
end
function DummyActorProxy:WendyDelay()
	return 0
end
function DummyActorProxy:EscapePrepare()
	return 0
end
function DummyActorProxy:EscapeDestroy()
	return 0
end
function DummyActorProxy:OnSubStart37601()
	return 0
end
function DummyActorProxy:OnSubStart37602()
	return 0
end
function DummyActorProxy:OnSubStart37603()
	return 0
end
function DummyActorProxy:OnSubStart37604()
	return 0
end
function DummyActorProxy:OnSubStart37605()
	return 0
end
function DummyActorProxy:OnSubStart37606()
	return 0
end
function DummyActorProxy:OnSubStart37607()
	return 0
end
function DummyActorProxy:OnSubStart37608()
	return 0
end
function DummyActorProxy:OnSubFinish37601()
	return 0
end
function DummyActorProxy:OnSubFinish37602()
	return 0
end
function DummyActorProxy:OnSubFinish37603()
	return 0
end
function DummyActorProxy:OnSubFinish37604()
	return 0
end
function DummyActorProxy:OnSubFinish37605()
	return 0
end
function DummyActorProxy:OnSubFinish37606()
	return 0
end
function DummyActorProxy:OnSubFinish37607()
	return 0
end
function DummyActorProxy:OnSubFinish37608()
	return 0
end

function DummyActorProxy:OnSubStart37701()
	return 0
end
function DummyActorProxy:OnSubStart37702()
	return 0
end
function DummyActorProxy:OnSubStart37703()
	return 0
end
function DummyActorProxy:OnSubStart37704()
	return 0
end
function DummyActorProxy:OnSubStart37705()
	return 0
end
function DummyActorProxy:OnSubFinish37701()
	return 0
end
function DummyActorProxy:OnSubFinish37702()
	return 0
end
function DummyActorProxy:OnSubFinish37703()
	return 0
end
function DummyActorProxy:OnSubFinish37704()
	return 0
end
function DummyActorProxy:OnSubFinish37705()
	return 0
end
function DummyActorProxy:Interaction()
	return 0
end
function DummyActorProxy:QinVanish()
	return 0
end

function DummyActorProxy:OnSubStart37801()
	return 0
end
function DummyActorProxy:OnSubStart37802()
	return 0
end
function DummyActorProxy:OnSubStart37803()
	return 0
end
function DummyActorProxy:OnSubStart37804()
	return 0
end
function DummyActorProxy:OnSubStart37805()
	return 0
end
function DummyActorProxy:OnSubFinish37801()
	return 0
end
function DummyActorProxy:OnSubFinish37802()
	return 0
end
function DummyActorProxy:OnSubFinish37803()
	return 0
end
function DummyActorProxy:OnSubFinish37804()
	return 0
end
function DummyActorProxy:OnSubFinish37805()
	return 0
end
function DummyActorProxy:CreateQin()
	return 0
end

function DummyActorProxy:OnSubStart37901()
	return 0
end
function DummyActorProxy:OnSubStart37902()
	return 0
end
function DummyActorProxy:OnSubStart37903()
	return 0
end
function DummyActorProxy:OnSubStart37904()
	return 0
end
function DummyActorProxy:OnSubFinish37901()
	return 0
end
function DummyActorProxy:OnSubFinish37902()
	return 0
end
function DummyActorProxy:OnSubFinish37903()
	return 0
end
function DummyActorProxy:OnSubFinish37904()
	return 0
end
function DummyActorProxy:TellStory()
	return 0
end
function DummyActorProxy:StartStory()
	return 0
end

function DummyActorProxy:OnSubStart38001()
	return 0
end
function DummyActorProxy:OnSubStart38002()
	return 0
end
function DummyActorProxy:OnSubStart38003()
	return 0
end
function DummyActorProxy:OnSubStart38004()
	return 0
end
function DummyActorProxy:CreateNPC()
	return 0
end
function DummyActorProxy:StartDialog()
	return 0
end
function DummyActorProxy:EnterDialog()
	return 0
end
function DummyActorProxy:OnSubFinish38001()
	return 0
end
function DummyActorProxy:OnSubFinish38002()
	return 0
end
function DummyActorProxy:OnSubFinish38003()
	return 0
end
function DummyActorProxy:OnSubFinish38004()
	return 0
end
function DummyActorProxy:ExitDialog()
	return 0
end

function DummyActorProxy:OnSubStart38101()
	return 0
end
function DummyActorProxy:OnSubStart38102()
	return 0
end
function DummyActorProxy:OnSubStart38103()
	return 0
end
function DummyActorProxy:OnSubStart38104()
	return 0
end
function DummyActorProxy:OnSubStart38105()
	return 0
end
function DummyActorProxy:OnSubFinish38101()
	return 0
end
function DummyActorProxy:OnSubFinish38102()
	return 0
end
function DummyActorProxy:OnSubFinish38103()
	return 0
end
function DummyActorProxy:OnSubFinish38104()
	return 0
end
function DummyActorProxy:OnSubFinish38105()
	return 0
end

function DummyActorProxy:OnSubStart38201()
	return 0
end
function DummyActorProxy:OnSubStart38202()
	return 0
end
function DummyActorProxy:OnSubStart38203()
	return 0
end
function DummyActorProxy:OnSubFinish38201()
	return 0
end
function DummyActorProxy:OnSubFinish38202()
	return 0
end
function DummyActorProxy:DestroyMark()
	return 0
end
function DummyActorProxy:OnSubFinish38203()
	return 0
end

function DummyActorProxy:OnSubStart38301()
	return 0
end
function DummyActorProxy:OnSubStart38302()
	return 0
end
function DummyActorProxy:OnSubStart38303()
	return 0
end
function DummyActorProxy:OnSubStart38304()
	return 0
end
function DummyActorProxy:OnSubFinish38301()
	return 0
end
function DummyActorProxy:OnSubFinish38302()
	return 0
end
function DummyActorProxy:OnSubFinish38303()
	return 0
end
function DummyActorProxy:OnSubFinish38304()
	return 0
end

function DummyActorProxy:OnSubStart38401()
	return 0
end
function DummyActorProxy:OnSubStart38402()
	return 0
end
function DummyActorProxy:OnSubStart38403()
	return 0
end
function DummyActorProxy:OnSubStart38404()
	return 0
end
function DummyActorProxy:Play384Cutscene()
	return 0
end
function DummyActorProxy:OnSubStart38405()
	return 0
end
function DummyActorProxy:OnSubStart38406()
	return 0
end
function DummyActorProxy:OnSubStart38407()
	return 0
end
function DummyActorProxy:OnSubStart38408()
	return 0
end
function DummyActorProxy:OnSubStart38409()
	return 0
end
function DummyActorProxy:OnSubStart38410()
	return 0
end
function DummyActorProxy:OnSubFinish38401()
	return 0
end
function DummyActorProxy:OnSubFinish38402()
	return 0
end
function DummyActorProxy:OnSubFinish38403()
	return 0
end
function DummyActorProxy:OnSubFinish38404()
	return 0
end
function DummyActorProxy:OnSubFinish38405()
	return 0
end
function DummyActorProxy:OnSubFinish38406()
	return 0
end
function DummyActorProxy:OnSubFinish38407()
	return 0
end
function DummyActorProxy:OnSubFinish38408()
	return 0
end
function DummyActorProxy:OnSubFinish38409()
	return 0
end
function DummyActorProxy:OnSubFinish38410()
	return 0
end
function DummyActorProxy:InteractionWendy()
	return 0
end
function DummyActorProxy:FinishCS()
	return 0
end
function DummyActorProxy:DeleteNPC()
	return 0
end
function DummyActorProxy:BeginNarrator()
	return 0
end
function DummyActorProxy:PlayBSEffect()
	return 0
end
function DummyActorProxy:PlayASEffect()
	return 0
end
function DummyActorProxy:AbyssHide()
	return 0
end

function DummyActorProxy:OnSubStart38501()
	return 0
end
function DummyActorProxy:OnSubFinish38501()
	return 0
end

function DummyActorProxy:Narrator38802()
	return 0
end
function DummyActorProxy:NPCdis38802()
	return 0
end
function DummyActorProxy:OnSubStart38801()
	return 0
end
function DummyActorProxy:OnSubStart38802()
	return 0
end
function DummyActorProxy:OnSubStart38803()
	return 0
end
function DummyActorProxy:OnSubStart38804()
	return 0
end
function DummyActorProxy:OnSubStart38805()
	return 0
end
function DummyActorProxy:OnSubStart38806()
	return 0
end
function DummyActorProxy:OnSubFinish38801()
	return 0
end
function DummyActorProxy:OnSubFinish38802()
	return 0
end
function DummyActorProxy:OnSubFinish38803()
	return 0
end
function DummyActorProxy:OnSubFinish38804()
	return 0
end
function DummyActorProxy:OnSubFinish38805()
	return 0
end
function DummyActorProxy:OnSubFinish38806()
	return 0
end

function DummyActorProxy:OnSubStart38901()
	return 0
end
function DummyActorProxy:OnSubStart38902()
	return 0
end
function DummyActorProxy:OnSubStart38903()
	return 0
end
function DummyActorProxy:OnSubStart38904()
	return 0
end
function DummyActorProxy:OnSubStart38905()
	return 0
end
function DummyActorProxy:OnSubStart38906()
	return 0
end
function DummyActorProxy:OnSubFinish38901()
	return 0
end
function DummyActorProxy:OnSubFinish38902()
	return 0
end
function DummyActorProxy:OnSubFinish38903()
	return 0
end
function DummyActorProxy:OnSubFinish38904()
	return 0
end
function DummyActorProxy:OnSubFinish38905()
	return 0
end
function DummyActorProxy:OnSubFinish38906()
	return 0
end

function DummyActorProxy:FindOrganNarrator()
	return 0
end
function DummyActorProxy:FindOrganTalk()
	return 0
end
function DummyActorProxy:FindClueNarrator()
	return 0
end
function DummyActorProxy:SealOpenCutscene()
	return 0
end
function DummyActorProxy:OnSubStart39001()
	return 0
end
function DummyActorProxy:OnSubStart39002()
	return 0
end
function DummyActorProxy:OnSubStart39003()
	return 0
end
function DummyActorProxy:OnSubStart39004()
	return 0
end
function DummyActorProxy:OnSubStart39005()
	return 0
end
function DummyActorProxy:OnSubStart39006()
	return 0
end
function DummyActorProxy:OnSubStart39007()
	return 0
end
function DummyActorProxy:OnSubStart39008()
	return 0
end
function DummyActorProxy:OnSubStart39009()
	return 0
end
function DummyActorProxy:OnSubStart39010()
	return 0
end
function DummyActorProxy:OnSubFinish39001()
	return 0
end
function DummyActorProxy:OnSubFinish39002()
	return 0
end
function DummyActorProxy:OnSubFinish39003()
	return 0
end
function DummyActorProxy:OnSubFinish39004()
	return 0
end
function DummyActorProxy:OnSubFinish39005()
	return 0
end
function DummyActorProxy:OnSubFinish39006()
	return 0
end
function DummyActorProxy:OnSubFinish39007()
	return 0
end
function DummyActorProxy:OnSubFinish39008()
	return 0
end
function DummyActorProxy:OnSubFinish39009()
	return 0
end
function DummyActorProxy:OnSubFinish39010()
	return 0
end

function DummyActorProxy:OnSubStart39101()
	return 0
end
function DummyActorProxy:OnSubStart39102()
	return 0
end
function DummyActorProxy:OnSubStart39103()
	return 0
end
function DummyActorProxy:OnSubStart39104()
	return 0
end
function DummyActorProxy:OnSubStart39105()
	return 0
end
function DummyActorProxy:OnSubStart39106()
	return 0
end
function DummyActorProxy:OnSubStart39107()
	return 0
end
function DummyActorProxy:OnSubStart39108()
	return 0
end
function DummyActorProxy:OnSubStart39109()
	return 0
end
function DummyActorProxy:OnSubStart39110()
	return 0
end
function DummyActorProxy:OnSubFinish39101()
	return 0
end
function DummyActorProxy:OnSubFinish39102()
	return 0
end
function DummyActorProxy:OnSubFinish39103()
	return 0
end
function DummyActorProxy:OnSubFinish39104()
	return 0
end
function DummyActorProxy:OnSubFinish39105()
	return 0
end
function DummyActorProxy:OnSubFinish39106()
	return 0
end
function DummyActorProxy:OnSubFinish39107()
	return 0
end
function DummyActorProxy:OnSubFinish39108()
	return 0
end
function DummyActorProxy:OnSubFinish39109()
	return 0
end
function DummyActorProxy:OnSubFinish39110()
	return 0
end

function DummyActorProxy:OnSubStart39201()
	return 0
end
function DummyActorProxy:OnSubStart39202()
	return 0
end
function DummyActorProxy:OnSubStart39203()
	return 0
end
function DummyActorProxy:OnSubStart39204()
	return 0
end
function DummyActorProxy:OnSubStart39205()
	return 0
end
function DummyActorProxy:OnSubStart39206()
	return 0
end
function DummyActorProxy:OnSubStart39207()
	return 0
end
function DummyActorProxy:OnSubStart39208()
	return 0
end
function DummyActorProxy:OnSubStart39209()
	return 0
end
function DummyActorProxy:OnSubStart39210()
	return 0
end
function DummyActorProxy:OnSubFinish39201()
	return 0
end
function DummyActorProxy:OnSubFinish39202()
	return 0
end
function DummyActorProxy:OnSubFinish39203()
	return 0
end
function DummyActorProxy:OnSubFinish39204()
	return 0
end
function DummyActorProxy:OnSubFinish39205()
	return 0
end
function DummyActorProxy:OnSubFinish39206()
	return 0
end
function DummyActorProxy:OnSubFinish39207()
	return 0
end
function DummyActorProxy:OnSubFinish39208()
	return 0
end
function DummyActorProxy:OnSubFinish39209()
	return 0
end
function DummyActorProxy:OnSubFinish39210()
	return 0
end

function DummyActorProxy:OnSubStart39301()
	return 0
end
function DummyActorProxy:OnSubStart39302()
	return 0
end
function DummyActorProxy:OnSubStart39303()
	return 0
end
function DummyActorProxy:OnSubFinish39301()
	return 0
end
function DummyActorProxy:OnSubFinish39302()
	return 0
end
function DummyActorProxy:OnSubFinish39303()
	return 0
end

function DummyActorProxy:On39403CutSceneFinish()
	return 0
end
function DummyActorProxy:OnSubStart39401()
	return 0
end
function DummyActorProxy:OnSubStart39402()
	return 0
end
function DummyActorProxy:OnSubStart39403()
	return 0
end
function DummyActorProxy:OnSubFinish39401()
	return 0
end
function DummyActorProxy:OnSubFinish39402()
	return 0
end
function DummyActorProxy:OnSubFinish39403()
	return 0
end

function DummyActorProxy:OnSubStart39501()
	return 0
end
function DummyActorProxy:OnSubStart39502()
	return 0
end
function DummyActorProxy:OnSubStart39503()
	return 0
end
function DummyActorProxy:OnSubFinish39501()
	return 0
end
function DummyActorProxy:OnSubFinish39502()
	return 0
end
function DummyActorProxy:OnSubFinish39503()
	return 0
end
function DummyActorProxy:CreateBBR()
	return 0
end

function DummyActorProxy:PlayerBackMengde()
	return 0
end
function DummyActorProxy:On39601CutSceneFinish()
	return 0
end
function DummyActorProxy:OnSubStart39601()
	return 0
end
function DummyActorProxy:OnSubStart39602()
	return 0
end
function DummyActorProxy:OnSubStart39603()
	return 0
end
function DummyActorProxy:OnSubStart39604()
	return 0
end
function DummyActorProxy:OnSubStart39605()
	return 0
end
function DummyActorProxy:OnSubStart39606()
	return 0
end
function DummyActorProxy:OnSubFinish39601()
	return 0
end
function DummyActorProxy:OnSubFinish39602()
	return 0
end
function DummyActorProxy:OnSubFinish39603()
	return 0
end
function DummyActorProxy:OnSubFinish39604()
	return 0
end
function DummyActorProxy:OnSubFinish39605()
	return 0
end
function DummyActorProxy:OnSubFinish39606()
	return 0
end
function DummyActorProxy:BBRdisappear()
	return 0
end

function DummyActorProxy:OnSubFinish41901()
	return 0
end

function DummyActorProxy:OnSubFinish42001()
	return 0
end

function DummyActorProxy:OnSubStart42101()
	return 0
end
function DummyActorProxy:OnSubStart42102()
	return 0
end
function DummyActorProxy:OnSubStart42103()
	return 0
end
function DummyActorProxy:OnSubStart42104()
	return 0
end
function DummyActorProxy:Clean()
	return 0
end
function DummyActorProxy:OnSubFinish42101()
	return 0
end
function DummyActorProxy:OnSubFinish42102()
	return 0
end
function DummyActorProxy:OnSubFinish42103()
	return 0
end
function DummyActorProxy:OnSubFinish42104()
	return 0
end

function DummyActorProxy:OnSubFinish42201()
	return 0
end

function DummyActorProxy:StartBeFollow()
	return 0
end

function DummyActorProxy:StartDance()
	return 0
end
function DummyActorProxy:FinishDance()
	return 0
end

function DummyActorProxy:MoveToSeat()
	return 0
end
function DummyActorProxy:ReturnToNormal()
	return 0
end
DummyActorProxy.seatPos = 0
DummyActorProxy.seatDir = 0
DummyActorProxy.returnCallback = 0

function DummyActorProxy:ShowStart()
	return 0
end
function DummyActorProxy:Vanish()
	return 0
end
function DummyActorProxy:VanishDirect()
	return 0
end

function DummyActorProxy:StartBeFollow1()
	return 0
end
function DummyActorProxy:Sleep()
	return 0
end
function DummyActorProxy:OnSleep()
	return 0
end
function DummyActorProxy:StartBeFollow2()
	return 0
end
function DummyActorProxy:StartBeFollow5()
	return 0
end
function DummyActorProxy:StartBeFollow3()
	return 0
end
function DummyActorProxy:StartBeFollow6()
	return 0
end
function DummyActorProxy:StartBeFollow4()
	return 0
end
function DummyActorProxy:Show()
	return 0
end



function DummyActorProxy:Escape()
	return 0
end

function DummyActorProxy:IsRaining()
	return 0
end
function DummyActorProxy:FinishBehave()
	return 0
end
function DummyActorProxy:OnWeather()
	return 0
end
function DummyActorProxy:MoveHome()
	return 0
end

function DummyActorProxy:FlyCircle()
	return 0
end
function DummyActorProxy:FlyCircle2()
	return 0
end

function DummyActorProxy:TransPreCallBack()
	return 0
end
function DummyActorProxy:TransFinishCallBack()
	return 0
end
function DummyActorProxy:FollowWater()
	return 0
end
function DummyActorProxy:Follow3()
	return 0
end
function DummyActorProxy:Follow2()
	return 0
end
function DummyActorProxy:Follow1()
	return 0
end
function DummyActorProxy:FirstStartFollow1()
	return 0
end
function DummyActorProxy:FirstStartFollow2()
	return 0
end
function DummyActorProxy:FirstStartFollow3()
	return 0
end
function DummyActorProxy:FirstStartFollowFinish()
	return 0
end
function DummyActorProxy:VanishKeep()
	return 0
end
function DummyActorProxy:ByQueen()
	return 0
end
function DummyActorProxy:AirModeOn()
	return 0
end
function DummyActorProxy:AirModeOff()
	return 0
end

function DummyActorProxy:BornOnce()
	return 0
end
function DummyActorProxy:GoWork()
	return 0
end
function DummyActorProxy:StartNightNow()
	return 0
end
function DummyActorProxy:StartDayNow()
	return 0
end



function DummyActorProxy:WalkFollow()
	return 0
end

function DummyActorProxy:Rescue()
	return 0
end









function DummyActorProxy:RunToMerchant()
	return 0
end
function DummyActorProxy:RunToWatchSunRise()
	return 0
end
function DummyActorProxy:WalkFollow2()
	return 0
end
function DummyActorProxy:WalkFollow3()
	return 0
end
function DummyActorProxy:WalkFollow4()
	return 0
end

function DummyActorProxy:VanishDungeon()
	return 0
end
function DummyActorProxy:StartLive()
	return 0
end
function DummyActorProxy:FinishLive()
	return 0
end




function DummyActorProxy:OnDataLoad()
	return 0
end
function DummyActorProxy:OnHandlerBuild()
	return 0
end
function DummyActorProxy:OnSubFailed()
	return 0
end
function DummyActorProxy:OnSoftRewind()
	return 0
end
function DummyActorProxy:DoRewind()
	return 0
end
function DummyActorProxy:DoSoftRewind()
	return 0
end
function DummyActorProxy:DoRewindAvatar()
	return 0
end
function DummyActorProxy:DoRewindNpc()
	return 0
end
function DummyActorProxy:DoRewindGadget()
	return 0
end
function DummyActorProxy:DoRewindItem()
	return 0
end
function DummyActorProxy:FinishQuest()
	return 0
end
function DummyActorProxy:FinishQuestID()
	return 0
end
function DummyActorProxy:UnFinishQuest()
	return 0
end
DummyActorProxy.mainQuestID = 0
DummyActorProxy.shareData = 0
DummyActorProxy.clientData = 0
DummyActorProxy.subStartHandlers = 0
DummyActorProxy.subFinishHandlers = 0




function DummyActorProxy:AmborToJudgePos()
	return 0
end
function DummyActorProxy:RunAmbor()
	return 0
end
function DummyActorProxy:AbleQuit1()
	return 0
end
function DummyActorProxy:AbleQuit2()
	return 0
end
function DummyActorProxy:StartCount2()
	return 0
end
function DummyActorProxy:MovePlayer()
	return 0
end
function DummyActorProxy:BlackScreen()
	return 0
end
function DummyActorProxy:FailCount()
	return 0
end
function DummyActorProxy:SuccCount()
	return 0
end
function DummyActorProxy:OnSubStart40400()
	return 0
end
function DummyActorProxy:OnSubStart40401()
	return 0
end
function DummyActorProxy:OnSubStart40402()
	return 0
end
function DummyActorProxy:OnSubStart40403()
	return 0
end
function DummyActorProxy:OnSubStart40404()
	return 0
end
function DummyActorProxy:OnSubStart40405()
	return 0
end
function DummyActorProxy:OnSubStart40407()
	return 0
end
function DummyActorProxy:OnSubStart40408()
	return 0
end
function DummyActorProxy:OnSubStart40410()
	return 0
end
function DummyActorProxy:OnSubFinish40400()
	return 0
end
function DummyActorProxy:OnSubFinish40401()
	return 0
end
function DummyActorProxy:OnSubFinish40402()
	return 0
end
function DummyActorProxy:OnSubFinish40403()
	return 0
end
function DummyActorProxy:OnSubFinish40404()
	return 0
end
function DummyActorProxy:OnSubFinish40405()
	return 0
end
function DummyActorProxy:OnSubFinish40407()
	return 0
end







function DummyActorProxy:EndSpeedField()
	return 0
end
function DummyActorProxy:StartSpeedField()
	return 0
end

function DummyActorProxy:GaiaToHide()
	return 0
end
function DummyActorProxy:GaiaToObserve()
	return 0
end
function DummyActorProxy:GaiaToAnswer()
	return 0
end



function DummyActorProxy:OnSubStart41501()
	return 0
end
function DummyActorProxy:OnSubStart41502()
	return 0
end
function DummyActorProxy:OnSubStart41503()
	return 0
end
function DummyActorProxy:OnSubStart41504()
	return 0
end
function DummyActorProxy:OnSubStart41505()
	return 0
end
function DummyActorProxy:OnSubFinish41501()
	return 0
end
function DummyActorProxy:OnSubFinish41502()
	return 0
end
function DummyActorProxy:OnSubFinish41503()
	return 0
end
function DummyActorProxy:OnSubFinish41504()
	return 0
end
function DummyActorProxy:OnSubFinish41505()
	return 0
end

function DummyActorProxy:OnSubStart41601()
	return 0
end
function DummyActorProxy:OnSubStart41602()
	return 0
end
function DummyActorProxy:OnSubFinish41601()
	return 0
end
function DummyActorProxy:OnSubFinish41602()
	return 0
end

function DummyActorProxy:TreasurePrepare()
	return 0
end
function DummyActorProxy:TreasureDestroy()
	return 0
end
function DummyActorProxy:DoorPrepare()
	return 0
end
function DummyActorProxy:DoorDestroy()
	return 0
end
function DummyActorProxy:ItemPrepare()
	return 0
end
function DummyActorProxy:ItemDestroy()
	return 0
end
function DummyActorProxy:GetScore()
	return 0
end
function DummyActorProxy:GetTreasure()
	return 0
end
function DummyActorProxy:OnSubStart42401()
	return 0
end
function DummyActorProxy:OnSubStart42402()
	return 0
end
function DummyActorProxy:OnSubStart42403()
	return 0
end
function DummyActorProxy:OnSubStart42404()
	return 0
end
function DummyActorProxy:OnSubStart42405()
	return 0
end
function DummyActorProxy:OnSubFinish42401()
	return 0
end
function DummyActorProxy:OnSubFinish42402()
	return 0
end
function DummyActorProxy:OnSubFinish42403()
	return 0
end
function DummyActorProxy:OnSubFinish42404()
	return 0
end
function DummyActorProxy:OnSubFinish42405()
	return 0
end

function DummyActorProxy:OnSubStart42501()
	return 0
end
function DummyActorProxy:OnSubStart42502()
	return 0
end
function DummyActorProxy:OnSubStart42503()
	return 0
end
function DummyActorProxy:OnSubStart42504()
	return 0
end
function DummyActorProxy:OnSubFinish42501()
	return 0
end
function DummyActorProxy:OnSubFinish42502()
	return 0
end
function DummyActorProxy:OnSubFinish42503()
	return 0
end
function DummyActorProxy:OnSubFinish42504()
	return 0
end

function DummyActorProxy:OnPlayerSit()
	return 0
end
function DummyActorProxy:OnPlayerStand()
	return 0
end
function DummyActorProxy:OnSubStart42601()
	return 0
end
function DummyActorProxy:OnSubStart42602()
	return 0
end
function DummyActorProxy:OnSubFinish42601()
	return 0
end
function DummyActorProxy:OnSubFinish42602()
	return 0
end

function DummyActorProxy:OnSubStart42701()
	return 0
end
function DummyActorProxy:OnSubStart42702()
	return 0
end
function DummyActorProxy:OnSubStart42703()
	return 0
end
function DummyActorProxy:OnSubStart42704()
	return 0
end
function DummyActorProxy:OnSubStart42705()
	return 0
end
function DummyActorProxy:OnSubFinish42701()
	return 0
end
function DummyActorProxy:OnSubFinish42702()
	return 0
end
function DummyActorProxy:OnSubFinish42703()
	return 0
end
function DummyActorProxy:OnSubFinish42704()
	return 0
end
function DummyActorProxy:OnSubFinish42705()
	return 0
end

function DummyActorProxy:OnSubStart99401()
	return 0
end
function DummyActorProxy:OnSubFinish99401()
	return 0
end

function DummyActorProxy:OnSubStart99601()
	return 0
end
function DummyActorProxy:OnSubStart99602()
	return 0
end
function DummyActorProxy:OnSubFinish99601()
	return 0
end
function DummyActorProxy:OnSubFinish99602()
	return 0
end

function DummyActorProxy:OnSubStart99701()
	return 0
end
function DummyActorProxy:OnSubFinish99701()
	return 0
end

function DummyActorProxy:OnSubStart99801()
	return 0
end
function DummyActorProxy:OnSubStart99802()
	return 0
end
function DummyActorProxy:OnSubStart99803()
	return 0
end
function DummyActorProxy:OnSubStart99804()
	return 0
end
function DummyActorProxy:OnSubStart99805()
	return 0
end
function DummyActorProxy:OnSubFinish99801()
	return 0
end
function DummyActorProxy:OnSubFinish99802()
	return 0
end
function DummyActorProxy:OnSubFinish99803()
	return 0
end
function DummyActorProxy:OnSubFinish99804()
	return 0
end
function DummyActorProxy:OnSubFinish99805()
	return 0
end

function DummyActorProxy:OnSubStart99901()
	return 0
end
function DummyActorProxy:OnSubStart99902()
	return 0
end

function DummyActorProxy:StopPerformAllNarrator()
	return 0
end
function DummyActorProxy:PerformTeachingNarrator()
	return 0
end
function DummyActorProxy:CheckLimit()
	return 0
end
function DummyActorProxy:UseFreshmeatRegion()
	return 0
end
function DummyActorProxy:OnFinishedRegion()
	return 0
end
function DummyActorProxy:FinishLimitRegion()
	return 0
end
DummyActorProxy.TeachingDialogList = 0
DummyActorProxy.TeachingDuration = 0
DummyActorProxy.TeachingDurationCnt = 0
DummyActorProxy.Teaching = 0
DummyActorProxy.WarningDialogList = 0
DummyActorProxy.WarningDialogIndex = 0
DummyActorProxy.WarningDuration = 0
DummyActorProxy.WarningDurationCnt = 0
DummyActorProxy.testLength = 0
DummyActorProxy.transOffset = 0
DummyActorProxy.checkTask = 0
DummyActorProxy.pauseTask = 0
DummyActorProxy.Warnning = 0

function DummyActorProxy:CreateLimitRegion()
	return 0
end
function DummyActorProxy:DestroyLimitRegion()
	return 0
end
function DummyActorProxy:CheckNeedTrans()
	return 0
end
function DummyActorProxy:GetLimitRegionDis()
	return 0
end

DummyActorProxy.SpeedFieldDir = 0
DummyActorProxy.SpeedFieldPos = 0
DummyActorProxy.StartSpeedField = 0
DummyActorProxy.EndSpeedField = 0
DummyActorProxy.DoTestHour = 0

function DummyActorProxy:GetSingleton()
	return 0
end
function DummyActorProxy:Init()
	return 0
end
function DummyActorProxy:OnSceneLoaded()
	return 0
end
function DummyActorProxy:OnFinishLoadScene()
	return 0
end
function DummyActorProxy:Cutscene()
	return 0
end
function DummyActorProxy:FreeCutscene()
	return 0
end
DummyActorProxy.CutsceneTestDic = 0


-- Dummy Method End


return DummyActorProxy