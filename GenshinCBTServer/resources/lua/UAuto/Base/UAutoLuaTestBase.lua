require('Base/Class')

yield_return = require('UAuto/Base/UAutoCoroutine').yield_return
local util = require ('Base/util')


local UAutoLuaTestBase = class("UAutoLuaTestBase",nil)

--Global Atrributes for test suite
--local Category = "All"
--local Order = "1000"
--local Description = "Base Description"

UAutoLuaTestBase.base = TestCaseBaseClass()

setmetatable(UAutoLuaTestBase,{ __index = UAutoLuaTestBase.base })

sceneData = sceneData or require('Base/SceneData')
--[[
    @desc: 对话
    time:2018-07-16 14:55:55
    --@index: 选择第x项，从0开始
    @return: nil 
]]
function UAutoLuaTestBase:Talk(index)
	self._dialogPanel = self.InLevelMainPage:GetComponent("MonoInLevelMainPage"):GetPrivateField("_dialogPanel")
	self._listItems = self._dialogPanel:GetPrivateField("_listItems")
	print(self._listItems)
	self._listItems[index].actionButton.onClick:Invoke()
end

local WaitTalkTimeout = 10
function UAutoLuaTestBase:WaitTalk(index)
	local byIndex=true
	local _type = type(index)
	if _type == type("string") then
		byIndex=false
	end

	yield_return(self.base:SelectDialog(index))

end

--[[
    @desc: 捡取
    time:2018-07-16 14:55:55
    --@index: 选择第x项，从0开始
    @return: nil 
]]
function UAutoLuaTestBase:Pick(index)
	yield_return(self.base:Pick(index))
end

function UAutoLuaTestBase:ChangeAvatar(name, isLeader)
	isLeader = isLeader or false
	-- if name=="PlayerGirl" then
	-- 	name="PlayerBoy"
	-- end
	
	local perfabName = name
	if name=="Anbo" then
		perfabName="Bow_Ambor"
		name="Ambor"
	end



	yield_return(self.base:RefreshTeam(perfabName,isLeader))
	yield_return(CS.UnityEngine.WaitForSeconds(1))
	yield_return(self.base:RefreshTeam(perfabName,isLeader))

	yield_return(self.base:WaitFoundGameObject("InLevelMainPage",function(result) self.InLevelMainPage = result end))

	self.avatar = self.InLevelMainPage:FindGameObjectsInChildren(name)
	assert(self.avatar.Length>0,"切换角色"..name.."失败")
	--print(self.avatar)
	local rectTransform = self.avatar[0]:GetComponent("RectTransform")
	--print(rectTransform.rect.height)
	if (rectTransform.rect.height>0) then
		self.avatar[0]:GetComponent("MoleMole.MonoTeamBtn").actionButton.onClick:Invoke()
		yield_return(CS.UnityEngine.WaitForSeconds(2))
	end

	local entityManager = singletonManager:GetSingletonInstance("MoleMole.EntityManager")

	local localAvatar = entityManager:GetLocalAvatarEntity()

	--print(localAvatar.gameObject.activeInHierarchy)
	while (localAvatar.gameObject.activeInHierarchy~=true) 
	do
		yield_return(CS.UnityEngine.WaitForSeconds(1))
	end
end
--[[
    @desc: 等待CutScene或TalkDialog结束
	time:2018-07-16 14:57:12
    --@talkToEnd: 是否进行点击
    @return: nil
]]
function UAutoLuaTestBase:WaitCutScene(talkToEnd,timeout,skipIfNotExist)
	skipIfNotExist = skipIfNotExist or false
	self.talkDialog =nil
	self.InLevelCutScenePage=nil
	self.TutorialDialog = nil
	timeout = timeout or 60
	while self.talkDialog==nil and self.InLevelCutScenePage==nil and self.TutorialDialog==nil do
		self.talkDialog = CS.UnityEngine.GameObject.Find("TalkDialog")
		self.InLevelCutScenePage = CS.UnityEngine.GameObject.Find("InLevelCutScenePage")
		self.TutorialDialog = CS.UnityEngine.GameObject.Find("TutorialDialog")
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		timeout = timeout - 1
		
		if timeout<0 then
			if skipIfNotExist == true then
				return
			else
				assert(1==0,"等待CutScene出现超时.")
			end
		end
	end

	if(self.InLevelCutScenePage~=nil) then
		self.monoInLevelCutScenePage = self.InLevelCutScenePage:GetComponent("MonoInLevelCutScenePage")
		print(self.monoInLevelCutScenePage)
		assert(self.monoInLevelCutScenePage~=nil, "monoInLevelCutScenePage is null");
	end

	if(self.talkDialog~=nil) then
		print(typeof(CS.UnityEngine.UI.Button))
		self.talkButton = self.talkDialog:GetComponentInChildren(typeof(CS.UnityEngine.UI.Button))
		self.selectButtons = self.talkDialog:FindGameObjectsInChildren("0")
	end


	if(talkToEnd) then
		print("Start talk to end")
		timeout = 120
		if(self.InLevelCutScenePage~=nil or self.talkDialog~=nil or self.TutorialDialog~=nil) then
			local hasCutScene=true
			local hasTalkDialog=true
			local hasTutorialDialog=true

			while (hasTalkDialog or hasCutScene)
			do
				self.talkDialog = CS.UnityEngine.GameObject.Find("TalkDialog")
				self.InLevelCutScenePage = CS.UnityEngine.GameObject.Find("InLevelCutScenePage")

				if(self.InLevelCutScenePage~=nil and self.InLevelCutScenePage.activeInHierarchy) then
					self.monoInLevelCutScenePage = self.InLevelCutScenePage:GetComponent("MonoInLevelCutScenePage")
					assert(self.monoInLevelCutScenePage~=nil, "monoInLevelCutScenePage is null");
				end

				if(self.monoInLevelCutScenePage==nil or self.monoInLevelCutScenePage.isActiveAndEnabled==false) then
					hasCutScene=false
				end
	
				if(self.talkDialog==nil or self.talkDialog.activeInHierarchy==false) then
					hasTalkDialog=false
				end

				if(self.TutorialDialog==nil or self.TutorialDialog.activeInHierarchy==false) then
					hasTutorialDialog=false
				end

				yield_return(CS.UnityEngine.WaitForSeconds(1))
				
				if(self.monoInLevelCutScenePage~=nil) then
					print("Click CutScene.")
					self.monoInLevelCutScenePage.onClick:Invoke()
					yield_return(CS.UnityEngine.WaitForSeconds(1))
				end
				yield_return(CS.UnityEngine.WaitForEndOfFrame())
				if(self.talkDialog~=nil and self.talkDialog.activeInHierarchy) then
					self.talkButton = self.talkDialog:GetComponentInChildren(typeof(CS.UnityEngine.UI.Button))
					self.selectButtons = self.talkDialog:FindGameObjectsInChildren("0")
					print("Click Talk Button.")
					self.talkButton.onClick:Invoke()
					if(self.selectButtons.Length>0) then
						print("Select Button 0.")
						local button = self.selectButtons[0]:GetComponent("UnityEngine.UI.Button")
						if button~=nil then
							yield_return(CS.UnityEngine.WaitForSeconds(1))
							button.onClick:Invoke()
						end
						yield_return(CS.UnityEngine.WaitForSeconds(1))
					end
				end

				-- if(hasTutorialDialog) then
				-- 	print("click Screen for Tutorial")
				-- 	yield_return(self.base:ClickScreen())
				-- end
				timeout = timeout-1
				assert(timeout>0,"WaitCutScene timeout")
			end
		end
	end
end

--[[
    @desc: 打开小地图
    author:{wyl}
    time:2018-07-25 15:47:11
    @return:
]]
function UAutoLuaTestBase:OpenMap()
	yield_return(self.base:WaitFoundGameObject("InLevelMainPage",function(result) self.InLevelMainPage = result end,false))
	self.MonoMiniMap = self.base.InLevelMainPage:FindComponentInChildren("MoleMole.MonoMiniMap")
	self._grpMap = self.MonoMiniMap:GetPrivateField("_grpMap")
	self._grpMap.gameObject:GetComponent("Button").onClick:Invoke()
	yield_return(self.base:WaitFoundGameObject("InLevelMapPage",function(result) self.InLevelMapPage = result end,false))
	assert(self.InLevelMapPage~=nil,"InLevelMapPage is nil")
	self.MonoInLevelMapPage = self.InLevelMapPage:GetComponent("MonoInLevelMapPage")
	yield_return(CS.UnityEngine.WaitForSeconds(1))
end

function UAutoLuaTestBase:CloseMap()
	yield_return(self.base:WaitFoundGameObject("InLevelMapPage",function(result) self.InLevelMapPage = result end,false))
	assert(self.InLevelMapPage~=nil,"InLevelMapPage is nil")
	self.MonoInLevelMapPage = self.InLevelMapPage:GetComponent("MonoInLevelMapPage")
	assert(self.MonoInLevelMapPage~=nil,"self.MonoInLevelMapPage is nil")
	yield_return(CS.UnityEngine.WaitForSeconds(2))
	self.MonoInLevelMapPage.closeBtn.onClick:Invoke()
	yield_return(CS.UnityEngine.WaitForSeconds(1))

end

function UAutoLuaTestBase:WaitFoundEntity(name, timeout, range)
	local name = name or ""
	local timeout = timeout or 60
	local range = range or 100
	yield_return(CS.UnityEngine.WaitForSeconds(1))
	yield_return(self.base:WaitFoundNearByEntityByName(name,function(result) self.foundEntity = result end,timeout,range))
end


function UAutoLuaTestBase:WaitFoundEntityById(Id, timeout, range)
	local Id = Id or 0
	local timeout = timeout or 60
	local range = range or 100
	yield_return(self.base:WaitFoundNearByEntityById(Id,function(result) self.foundEntity = result end,timeout,range))
end


function UAutoLuaTestBase:WaitMoveToEntityByName(name,timeout,range)
	local name = name or ""
	local timeout = timeout or 60
	local range = range or 100
	yield_return(self.base:WaitFoundNearByEntityByName(name,function(result) self.moveTarget = result end,timeout,range))
	yield_return(self.base:MoveToEntity(self.moveTarget,timeout,1))
end

function UAutoLuaTestBase:ReturnToHome()
	self.monoInLevelMainPage = self.base.InLevelMainPage:GetComponent("MonoInLevelMainPage")
	self.monoInLevelMainPage.gmButton.onClick:Invoke()
	yield_return (self.base:WaitFoundGameObject("InLevelDebugMenuDialog",function(result) self.InLevelDebugMenuDialog = result end))
	self.MonoInLevelDebugMenuDialog = self.InLevelDebugMenuDialog:GetComponent("MonoInLevelDebugMenuDialog")
	self.MonoInLevelDebugMenuDialog.returnButton.onClick:Invoke()
	yield_return (self.base:WaitLevelLoaded("Home"))
end

function UAutoLuaTestBase:EnterMaster(name)
	name = name or "Daily"
	yield_return(self.base:EnterBigWorldFromGame(name,false))
	yield_return (self.base:WaitLevelLoaded("Level"))
end

function UAutoLuaTestBase:Reconnect(name)
	name = name or "Daily"
	yield_return(self:ReturnToHome())
	yield_return(CS.UnityEngine.WaitForSeconds(5))
	yield_return(self:EnterMaster(name))
end


function UAutoLuaTestBase:FinishAllNoob()
	yield_return(CS.UnityEngine.WaitForSeconds(1))
	yield_return(self.base:RunGM("clear all",true,true))
	yield_return(self.base:RunGM("Quest Finish Father 351 352 353"))
	yield_return(CS.UnityEngine.WaitForSeconds(5))
	
	local mapPage = CS.UnityEngine.GameObject.Find("InLevelMapPage")
	if mapPage~=nil and mapPage.activeInHierarchy then
		yield_return(self:CloseMap())
	end
	
	print("frame index: GM")
	yield_return(self.base:WaitFrames(31))
	yield_return(self.base:MouseClick( "Canvas/Pages/InLevelMainPage/GrpMainPage/GrpMainBtn/GrpMainToggle/BtnGm/Icon"))


	print("frame index: Return")
	yield_return(self.base:WaitFrames(37))
	yield_return(self.base:MouseClick( "Canvas/Dialogs/InLevelDebugMenuDialog/Return/Text"))

	print("frame index: EnterBigWorldFromGame")
	yield_return(self.base:EnterBigWorldFromGame(self.base.driver.ServerName, false))

	print("frame index: Jump")
	yield_return(self.base:WaitFrames(30))
	yield_return(self.base:Jump())

end

function UAutoLuaTestBase:ReEnterBigWorld()
	print("ReEnterBigWorld")
	local gameManager = CS.UnityEngine.GameObject.Find("GameManager")
	local gameManagerComponent = gameManager:GetComponent("GameManager")
	if gameManagerComponent.isOnlineMode then
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		singletonManager:GetSingletonInstance("MoleMole.NetworkManager"):RequestLeaveScene();
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		yield_return(self.base:EnterBigWorldFromGame(""))
		yield_return(CS.UnityEngine.WaitForSeconds(1))
	else
		singletonManager:GetSingletonInstance("MoleMole.PlayerModule"):GoBackHome();
		yield_return(self.base:EnterStreaming())
	end

end

function UAutoLuaTestBase:GetIntPart(x)
	if x <= 0 then
	   return math.ceil(x);
	end
	
	if math.ceil(x) == x then
	   x = math.ceil(x);
	else
	   x = math.ceil(x) - 1;
	end
	return x;
end

return UAutoLuaTestBase