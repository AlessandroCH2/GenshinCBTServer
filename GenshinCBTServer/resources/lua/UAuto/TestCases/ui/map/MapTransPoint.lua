local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("MapTransPoint",baseClass)
local self = UAutoLuaTestCase
UAutoLuaTestCase.TestFixture = "MapTransPoint"
UAutoLuaTestCase.Category = "UI,小地图"
self.Description = "点击小地图上各传送点"
function UAutoLuaTestCase.FindAllMapPointAction()
	yield_return(self:OpenMap())
	yield_return(self.base:WaitFoundGameObjectsInChildren(self.InLevelMapPage,"MarkPoint",function(result) self.MarkPoints = result end))
	assert(self.MarkPoints~=nil,"FindAllMapPointAction No MarkTransPoints")
end

function UAutoLuaTestCase.ClickTransPointsAction()

	yield_return(self.FindAllMapPointAction())
	assert(self.MarkPoints~=nil,"ClickTransPointsAction No MonoMapMark")
	yield_return(self:CloseMap())
	for k,v in pairs(self.MarkPoints) do
		self.monoMapMark = v:GetComponent("MonoMapMark")
		print(self.monoMapMark.markType:EnumToInt())
		if(self.monoMapMark.markType:EnumToInt()==1 and (self.monoMapMark.iconType:EnumToInt()==100 
		or (self.monoMapMark.iconType:EnumToInt()>=200 and self.monoMapMark.iconType:EnumToInt()<300))) then
			if (v.transform.localPosition.x < math.huge and v.transform.localPosition.x > -math.huge) then
				print(v.transform.localPosition)
				yield_return(self:OpenMap())
				yield_return(CS.UnityEngine.WaitForSeconds(2))
				yield_return(self.base:ClickOnMap(v))
				yield_return(CS.UnityEngine.WaitForSeconds(1))
				yield_return(self.base:WaitLevelLoaded("Level"));
				yield_return(CS.UnityEngine.WaitForSeconds(2))
			end
		end

	end

end

UAutoLuaTestCase.SetUp = {
	Order = 0.1,
	Type = CaseType.MonoTest,
	Description = "初始化，GM命令开启传送点",
	Action = UAutoCoroutine(function()
		yield_return(self.base:RunGM("quest finish 35001"))
		yield_return(self.base:RunGM("point 3 all"))
		yield_return(self.base:SetUpVariables())
		
	end)
}



UAutoLuaTestCase.ClickAllTransPoints = {
	Order = 1,
	Type = CaseType.MonoTest,
	Description = "依次点击各个传送点，并传送",
	Action = UAutoCoroutine(self.ClickTransPointsAction)
}

UAutoLuaTestCase.CloseMiniMap = {
	Order = 3,
	Type = CaseType.MonoTest,
	Description = "关闭小地图",
	Action = UAutoCoroutine(function()
		self:CloseMap()
	end)
}

return self
