--测试类型枚举定义


function CreatEnumTable(tbl, index) 
    local enumtbl = {} 
    local enumindex = index or 0 
    for i, v in ipairs(tbl) do 
        enumtbl[v] = enumindex + i 
    end 
    return enumtbl 
end 

AutoTestObject =  CS.UnityEngine.GameObject.Find("AutoTestObject")

if AutoTestObject ~= nil then
    driver =  CS.UnityEngine.GameObject.Find("AutoTestObject"):GetComponent("AutoTestDriver")
end

if AutoTestObject == nil then
	driver = CS.UnityEngine.GameObject.Find("GameManager"):GetComponent("AutoTestDriver")
end

coroutineTable = {}

function UAutoCoroutine(co_func)
    return function(...)
		if(co_func~=nil) then
			local obj = ...
            local coIndex = #coroutineTable+1
            coroutineTable[coIndex] = {}
			driver.luaMonoTestFinished=false
			coroutineTable[coIndex]["thread"]= coroutine.create(co_func)
			coroutineTable[coIndex]["finished"] = false

			assert(coroutine.resume(coroutineTable[coIndex]["thread"],obj))
            --delete immediately dead coroutine
            if(coroutine.status(coroutineTable[coIndex]["thread"])=="dead") then
                table.remove(coroutineTable)
                if (#coroutineTable == 0) then
                    driver.luaMonoTestFinished=true
                end
            end
        else
            driver.luaMonoTestFinished=true
        end
	end
end


--协程执行完成callback
function UAutoCorotineCallback(...)
    local testObj = {...}
    local coCount = #coroutineTable
    local currentCo = coroutineTable[coCount]["thread"]
    
    if(currentCo==nil) then
        return
    end

    if(coroutine.status(currentCo)~="dead") then
        assert(coroutine.resume(currentCo,testObj))
    end
    if(coroutine.status(currentCo)=="dead") then
        --delete currentCo
        table.remove(coroutineTable)
        if (#coroutineTable == 0) then
            driver.luaMonoTestFinished=true
        end
    end
end


CaseType = 
{ 
	"Test", 
	"MonoTest",
	"SetUp",
	"TearDown"
}

CaseType = CreatEnumTable(CaseType) 

RunMode = 
{
    "Host",
    "Client",
	"Local"
}

RunMode = CreatEnumTable(RunMode) 

IsSync = 
{
	"True",
	"False"
}

IsSync = CreatEnumTable(IsSync) 

--lua test case 基类初始化
TestCaseBaseClass = CS.MoleMole.UAuto.TestCaseBase
TestCaseNetworkBaseClass = CS.MoleMole.UAuto.TestCaseNetworkBase
TestCaseNumberBaseClass = CS.MoleMole.UAuto.TestCaseNumberBase
TestCaseElementBaseClass = CS.MoleMole.UAuto.TestCaseElementBase
TestCaseQuestBaseClass = CS.MoleMole.UAuto.TestCaseQuestBase
TestCaseSceneBase = CS.MoleMole.UAuto.TestCaseSceneBase
TestCaseCombatBase = CS.MoleMole.UAuto.TestCaseCombatBase
--TestDriver = CS.MoleMole.UAuto.AutoTestDriver
uAutoLuaTestCases = {}