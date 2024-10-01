--baseClass提供基础接口
local baseClass = require('UAuto/Base/UAutoLuaTestBase')
--所有testcase继承baseClass
local UAutoLuaTestCase = class("UAutoLuaTestCaseExample",baseClass)
local self = UAutoLuaTestCase

--测试集名称(必选)
UAutoLuaTestCase.TestFixture = "UAutoLuaTestCaseExample"
--测试集所属分类(可选)
--UAutoLuaTestCase.Category = "All"
--测试集执行顺序(可选)
UAutoLuaTestCase.Order = 99
--测试集描述(可选)
--UAutoLuaTestCase.Description = "Base Description"




--测试case
UAutoLuaTestCase.MonoTest1 = {
	--当前case执行顺序
	Order=2,
	--当前case分类
	Category="UI",
	--测试case类型：MonoTest 游戏中测试，以协程方式执行，可以通过yield_return释放控制权，不会卡住游戏
	Type = CaseType.MonoTest,
	--case描述
	Description = "I am MonoTest1.",
	--具体case的执行逻辑，MonoTest类型需用UAutoCoroutine开头
	Action = UAutoCoroutine(
		function()
			print("corotine start")
			local t = os.time()
			yield_return(CS.UnityEngine.WaitForSeconds(10))
			print("wait 10 sec: "..os.time() - t)
			t = os.time()
			yield_return(CS.UnityEngine.WaitForEndOfFrame())
			print("WaitForEndOfFrame: "..os.time() - t)
			-- 调用嵌套的coroutine，用UAutoCoroutine包装，嵌套协程函数需在最后另加上()括号
			UAutoCoroutine(UAutoLuaTestCase.internalCoroutine)()
			t = os.time()
			yield_return(CS.UnityEngine.WaitForSeconds(30))
			print("wait another 30 sec: "..os.time() - t )
			print("corotine end")
		end
	),

}

--嵌套协程函数测试
function UAutoLuaTestCase.internalCoroutine()
	print "internalCoroutine"
	local t = os.time()
	yield_return(CS.UnityEngine.WaitForSeconds(10))
	print ("internalCoroutine after 10 sec:"..os.time() - t)
end

--普通类型测试
UAutoLuaTestCase.Test1 = {
	Order=1,
	Category="UI",
	Type = CaseType.Test,
	Description = "I am Test1.",
	Action = function()
		print("UAutoLuaTestCase1.Test")
	end
}

--环境准备
UAutoLuaTestCase.SetUp = {
	Type = CaseType.SetUp,
	Action = function()
		assert(1==2,"error test")
		print("UAutoLuaTestCase1.SetUp")
	end
}

--环境清理
UAutoLuaTestCase.TearDown = {
	Type = CaseType.TearDown,
	Action = function()
		print("UAutoLuaTestCase1.TearDown")
	end
}


--一定要返回当前类对象
return UAutoLuaTestCase
