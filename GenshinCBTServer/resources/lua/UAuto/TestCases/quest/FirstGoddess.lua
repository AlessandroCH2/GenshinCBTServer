--baseClass提供基础接口
local baseClass = require('UAuto/Base/UAutoLuaTestBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("FirstGoddess",baseClass)
--测试集名称(必选)
UAutoLuaTestCase.TestFixture = "FirstGoddess"
local self = UAutoLuaTestCase
self.Description = "第一个女神像"
self.Category="任务系统，女神像引导系统"
self.Order = 3.5
function UAutoLuaTestCase.GotoGoddessAction()
	--yield_return(self.base:TelePort(CS.UnityEngine.Vector3(517.5846,215.0666,-304.1295)))
	self.goddessEntity=nil
	yield_return(self.base:WaitFoundNearByEntityByName("SceneObj_NPC_Goddess",
	function(result) self.goddessEntity = result end))
	assert(self.goddessEntity~=nil,"self.goddessEntity is null")
	yield_return(self.base:MoveToEntity(self.goddessEntity))
end

--测试case
self.GotoGoddess = {
	--当前case执行顺序
	Order=1,
	--当前case分类
	Category="任务系统",
	Description = "到神像旁边",
	--测试case类型：MonoTest 游戏中测试，以协程方式执行，可以通过yield_return释放控制权，不会卡住游戏
	Type = CaseType.MonoTest,
	--具体case的执行逻辑，MonoTest类型需用UAutoCoroutine开头
	Action = UAutoCoroutine(self.GotoGoddessAction)
}

self.TalkToGoddess = {
	--当前case执行顺序
	Order=2,
	--当前case分类
	Category="任务系统",
	Description = "与神像对话",
	--测试case类型：MonoTest 游戏中测试，以协程方式执行，可以通过yield_return释放控制权，不会卡住游戏
	Type = CaseType.MonoTest,
	--具体case的执行逻辑，MonoTest类型需用UAutoCoroutine开头
	Action = UAutoCoroutine(function()
		print "TalkToGoddessAction"
		yield_return(self:WaitTalk("女神像"))
	end)
}

self.WaitGoddessCurScene = {
	Order=3,
	Category="任务系统",
	Type = CaseType.MonoTest,
	Description = "等待神像的CutScene结束",
	Action = UAutoCoroutine(function()
		print "WaitGoddessCurScene"
		yield_return(self:WaitCutScene(true))


	end)
}

self.CloseUnlockPopupMap = {
	Order=4,
	Category="任务系统",
	Type = CaseType.MonoTest,
	Description = "关闭解锁小地图时的弹出框",
	Action = UAutoCoroutine(function()
		print "Close Map"
		yield_return(self:CloseMap())
	
	end)
}

--一定要返回当前类对象
return self
