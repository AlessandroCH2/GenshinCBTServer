local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("QuestBase",baseClass)
UAutoLuaTestCase.TestFixture = "QuestBase"

local self = UAutoLuaTestCase
--State
QuestState = 
{
	"QUEST_STATE_NONE", --= 0, // 不能领取
	"QUEST_STATE_ACCEPTABLE", --= 1, // 可领取
	"QUEST_STATE_UNFINISHED", --= 2, // 未完成
	"QUEST_STATE_FINISHED", --= 3, // 已完成
	"QUEST_STATE_FAILED", --= 4, // 已失败
}
QuestState = CreatEnumTable(QuestState)

--state
QState = 
{
	"INVALID", --= -1, // 不可用
	"ACCEPTED", --= 0, // 已接
	"UPDATED", --2// 更新，子任务完成
	"FINISHED", --3// 完成
	"FAILED", --4// 失败
}
QState = CreatEnumTable(QState)

function self:GotoMengDeGate()
	local Position = CS.UnityEngine.Vector3(2204.2631,207.7111, -964.23)
	yield_return(self.base:TelePort(Position))
end

function self:TriggerMengDeTask()
	self:GotoMengDeGate()
	local TriggerPosition1 = CS.UnityEngine.Vector3(2246.3881,209.0002,-904.5758)
	self.base.timePassed=0
	yield_return(self.base:MoveToPosition(TriggerPosition1))
	yield_return(self:WaitCutScene(true))

end
--[[
    @desc: 跟随entity
    author:wyl
	依赖：
		1：self.entity:跟随的entity
		2：self.endPosition：跟随的终点
]]	
function self:FllowEntity(entity, endPosition)
	self.entity = entity
	self.endPosition = endPosition
	assert(self.entity~=nil, tostring(self.entity).." 不能跟随")
	self.base.timePassed=0
	local timeout=0
	while (true) do
		yield_return(self.base:MoveToEntity(self.entity))
		local distance = CS.UnityEngine.Vector3.Distance(self.base.avatar.transform.position,self.endPosition)
		if distance<1 then
			break
		end
		timeout = timeout+CS.UnityEngine.Time.deltaTime
		assert(timeout<60,"Fllow entity timeout")	
	end
end


function self:GetQuestInfo(questID)
	self.questID = questID or 0
	self.QuestModule = singletonManager:GetSingletonInstance("MoleMole.QuestModule")
	self.subQuestList = self.QuestModule:GetSubQuestListByMainID(self.questID);
	return self.subQuestList
end

function self:WaitCheckQuestState(subQuestID, State, state)
	State = State or 0
	state = state or -1
	self.subQuestID = subQuestID or 0
	if(subQuestID~=0) then
		self.questID = string.sub(subQuestID,1,3)
	end
	self.QuestModule = singletonManager:GetSingletonInstance("MoleMole.QuestModule")

	local timeout = 0
	local foundState = false
	local foundstate = false
	print(self.questID,self.subQuestID)
	while true do
		assert(timeout<10,"CheckQuestState timeout")
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		timeout=timeout+1
		self.subQuestList = self.QuestModule:GetSubQuestListByMainID(self.questID);
		if(self.subQuestList~=nil) then
			for k,v in pairs(self.subQuestList) do
				if(v.QuestId == self.subQuestID) then
					print(State, state)
					if(State~=0 and State == v.State) then
						foundState=true
					end
					if(state ~= -1 and state == v.state:EnumToInt()) then
						foundstate = true
					end
					return v.State, v.state:EnumToInt()
				end
			end
			if(foundState and foundstate) then
				break
			end
		end
	end
end


function self:CheckQuestPromtOnMiniMap(CheckPromtNum)
	print(CheckPromtNum)
	if(CheckPromtNum==nil) then
		CheckPromtNum = true
	end
	yield_return(self:OpenQuestUI())
	yield_return(self:CloseQuestUI())
	yield_return(self:OpenMap())

	if(CheckPromtNum == true) then
		assert (self.MonoMiniMap.markContainerLayers[1].childCount == 1 ,"promt number wrong on minimap")
	end
	yield_return(self:CloseMap())
end


function self:OpenQuestUI()
	assert(self.base.InLevelMainPage~=nil,"self.base.InLevelMainPage is nil")
	self.base.InLevelMainPage:GetComponent("MoleMole.MonoInLevelMainPage").questDialogToggle.onClick:Invoke()
	yield_return(self.base:WaitFoundGameObject("InLevelQuestDialog",function(result) self.InLevelQuestDialog = result end))
	assert(self.InLevelQuestDialog~=nil,"self.InLevelQuestDialog is nil")
	local timeout = 0
	self._questBook = self.InLevelQuestDialog:GetComponent("MonoInLevelQuestDialog"):GetPrivateField("_questBook")
	while self._questBook.gameObject.activeInHierarchy == false do
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		timeout=timeout+1
		assert(timeout<10,"OpenQuestUI timeout")
	end
	yield_return(CS.UnityEngine.WaitForSeconds(1))
end

function self:CloseQuestUI()
	assert(self.InLevelQuestDialog~=nil,"self.InLevelQuestDialog is nil")
	self.InLevelQuestDialog:GetComponent("MonoInLevelQuestDialog").questBook.closeButton.onClick:Invoke()
	local timeout = 0
	self._questBook = self.InLevelQuestDialog:GetComponent("MonoInLevelQuestDialog"):GetPrivateField("_questBook")
	while self._questBook.gameObject.activeInHierarchy do
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		timeout=timeout+1
		assert(timeout<10,"CloseQuestUI timeout")
	end
	yield_return(CS.UnityEngine.WaitForSeconds(1))
end


function self:ClearAll()
	yield_return(self.base:MouseClick("Canvas/Pages/InLevelMainPage/GrpMainPage/GrpMainBtn/GrpMainToggle/BtnGm/Icon"))
	yield_return(CS.UnityEngine.WaitForSeconds(1))
	yield_return(self.base:MouseClick("Canvas/Dialogs/InLevelDebugMenuDialog/Common/ClearAll/Text"))
	yield_return(CS.UnityEngine.WaitForSeconds(1))
	yield_return(self.base:EnterBigWorldFromGame(""))
	yield_return(CS.UnityEngine.WaitForSeconds(1))
end

self.questIdArray = {"351", "362", "352", "353", "361", "355", "354", "356", "357", "358", "306"}
function self:InitQuest(questId)
	yield_return(self.base:RunGM("quest clear all"))

	local finishGmStr = "quest finish father "	
	for i, id in pairs(self.questIdArray) do
		if(id == questId) then
			break
		else
			finishGmStr = finishGmStr..id.." "
		end
	end

	yield_return(self.base:RunGM(finishGmStr))
	yield_return(self.base:RunGM("quest clear father "..questId))

end

function self:ReEnterBigWorld()
	print("ReEnterBigWorld")
	local gameManager = CS.UnityEngine.GameObject.Find("GameManager")
	local gameManagerComponent = gameManager:GetComponent("GameManager")
	if gameManagerComponent.isOnlineMode then
		singletonManager:GetSingletonInstance("MoleMole.NetworkManager"):RequestLeaveScene();
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		yield_return(self.base:EnterBigWorldFromGame(""))
		yield_return(CS.UnityEngine.WaitForSeconds(1))
	else
		singletonManager:GetSingletonInstance("MoleMole.PlayerModule"):GoBackHome();
		yield_return(self.base:EnterStreaming())
	end
end



return self