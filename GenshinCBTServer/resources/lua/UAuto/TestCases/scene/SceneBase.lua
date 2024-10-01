local baseClass = require('UAuto/Base/UAutoLuaTestBase')
local UAutoLuaTestCase = class("SceneBase",baseClass)
UAutoLuaTestCase.TestFixture = "SceneBase"

UAutoLuaTestCase.base = TestCaseSceneBase()

local self = UAutoLuaTestCase

return self
