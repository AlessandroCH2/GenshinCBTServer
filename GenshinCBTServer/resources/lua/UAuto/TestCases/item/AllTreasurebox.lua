local baseClass = require('UAuto/Base/UAutoLuaTestBase')

local UAutoLuaTestCase = class("AllTreasurebox",baseClass)
local self = UAutoLuaTestCase
UAutoLuaTestCase.TestFixture = "AllTreasurebox"
UAutoLuaTestCase.Category = "交互机关"
self.Description="遍历所有01,02,03类型宝箱"
self.Order=705
function self:CheckTreasureDisappear()
	local timeout=60
	while self.Treasurebox:IsDestroied() == false do
		timeout=timeout-1
		yield_return(CS.UnityEngine.WaitForSeconds(1))
		assert(timeout>0,"宝箱没有在60s内消失")
	end
end

function self:PickItem()
	yield_return(self.base:WaitFoundAllNearbyEntities(function(result) self.items = result end,30))
	assert(self.items.Count>0,tostring(self.pos) .. " 宝箱没有掉落物")
	-- for k,v in pairs(self.items) do 
	-- 	yield_return(self.base:MoveToPosition(v.transform.position,10))
	--  	self:Pick(0)
	-- end
end

UAutoLuaTestCase.SetUp = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	Description="初始化",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("clear all",true,true))
        yield_return(self.base:SetUpVariables())
		yield_return(self:ChangeAvatar("Anbo"))
		yield_return(self.base:RunGM("WUDI ON"))
		yield_return(self.base:RunGM("ENERGY INFINITE ON"))
		self.sceneData = sceneData:LoadScene(3,true)
	end)
}



self.OpenTreasurebox = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description="遍历宝箱",
	Action = UAutoCoroutine(function()
		print(self.sceneData.GetSuiteGadgets)
		self.Gadgets = self.sceneData:GetSuiteGadgets()
		for k,v in pairs(self.Gadgets) do
			if v.gadget_id==70210001 then
				self.searchName = 'SceneObj_Item_Treasurebox01'
			elseif v.gadget_id==70210002 then
				self.searchName = 'SceneObj_Item_Treasurebox02'
			elseif v.gadget_id==70210003 then
				self.searchName = 'SceneObj_Item_Treasurebox03'
			end

			--普通宝箱
			if v.gadget_id==70210001 or v.gadget_id==70210002 or v.gadget_id==70210003 then
				local teleportCmd = "goto " .. v.pos.x+1.5 .. " " .. (v.pos.y+10) .. " " .. (v.pos.z+1.5)
				self.pos = CS.UnityEngine.Vector3(v.pos.x,v.pos.y,v.pos.z)
				yield_return(self.base:RunGM(teleportCmd,true,true))
				yield_return(self.base:WaitFoundGameObject("InLevelMainPage", function(result) self.InLevelMainPage=result end))
				yield_return(self.base:WaitLevelLoaded("Level"))

				yield_return(self.base:WaitFoundNearByEntityByName(self.searchName,function(result) self.Treasurebox = result end))
				assert(self.Treasurebox~=nil,self.searchName.." 宝箱没找到 "..tostring(self.pos))

				if v.gadget_id == 70210003 then
					yield_return(self.base:RunGM("KILL MONSTER ALL"))
				end

				yield_return(self.base:MoveToPosition(self.pos,10,1))

				yield_return(self:WaitTalk(0))
				if v.gadget_id==70210002 then 
					yield_return(self.base:RunGM("KILL MONSTER ALL"))
					yield_return(self.base:MoveByAngle(0))
					yield_return(CS.UnityEngine.WaitForSeconds(1))
					yield_return(self.base:MoveByAngle(0,true))
					yield_return(self.base:MoveToPosition(self.Treasurebox.transform.position,5))
					yield_return(self.base:RunGM("KILL MONSTER ALL"))
					yield_return(CS.UnityEngine.WaitForSeconds(15))
					yield_return(self:WaitTalk(0))
				end
				yield_return(self:CheckTreasureDisappear())
				yield_return(self:PickItem())
			end



		end
		yield_return(self.base:RunGM("WUDI OFF"))
		yield_return(self.base:RunGM("ENERGY INFINITE OFF"))

	end)
}


return self
