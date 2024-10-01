xlua.hotfix(CS.MoleMole.MonoTestHotFix, 'TestPublicHotfix', function(self)
					print('TestPublicHotfix in lua')
				end)

xlua.hotfix(CS.MoleMole.MonoTestHotFix, 'TestPrivateHotfix', function(self)
					print('TestPrivateHotfix in lua')
				end)

xlua.hotfix(CS.MoleMole.TestHotFix, 'TestAddPublicHotfix', function(self, a, b)
				return a + b
			end)

xlua.hotfix(CS.MoleMole.TestHotFix, 'TestAddPrivateHotfix', function(self, a, b)
				return a * b
			end)