----------------------
-- 这是Lua端BenchMark，包含了一些profiler和memory的操作
-- @module BenchMark
local BenchMark = {
	memory = require('Base/memory'),
	profiler = require('Base/profiler')
}

--- Profiler方法
-- @section profiler
function BenchMark:StartProfiler()
	self.profiler.start()
end

function BenchMark:StopProfiler()
	self.profiler.stop()
end

function BenchMark:Report()
	print(self.profiler.report())
end

--- Memory方法
-- @section memory
function BenchMark:PrintTotalMemory()
	return self.memory.total()
end

function BenchMark:PrintMemorySnapshot()
	print(self.memory.snapshot())
end

return BenchMark