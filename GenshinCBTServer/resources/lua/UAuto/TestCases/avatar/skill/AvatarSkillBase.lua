local baseClass = require("UAuto/Base/UAutoLuaTestBase")
local UAutoLuaTestCase = class("AvatarSkillBase", baseClass)
local self = UAutoLuaTestCase
self.base = TestCaseBaseClass()
self.TestFixture = "AvatarSkillBase"

self.safePos = "1955.741 196.5956 -1298.704"
self.doSkillCount = 15
self.doSkillWait = 0.3
self.caseWait = 5

return self
