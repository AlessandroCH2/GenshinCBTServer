----------------------
-- 这是Lua端数学包装
-- @module M
local M = M or {}

csMath = CS.MoleMole.LuaMath

--- PI
M.PI = 3.14159
--- 角度转弧度
-- @tparam float deg 角度
M.Deg2Rad = function(deg)
	return (M.PI / 180) * deg
end
--- 弧度转角度
-- @tparam float rad 弧度
M.Rad2Deg = function(rad)
	return (180 / M.PI) * rad
end
--- 生成一个位置
-- @tparam float x x坐标
-- @tparam float y y坐标
-- @tparam float z z坐标
M.Pos = function(x, y, z)
	local pos = CS.UnityEngine.Vector3(x, y, z)
	return pos
end
--- 生成一个朝向
-- @tparam float x x分量
-- @tparam float y y分量
-- @tparam float z z分量
M.Dir = function(x, y, z)
	local dir = CS.UnityEngine.Vector3(x, y, z)
	return dir
end
--- 生成一个欧拉转向
-- @tparam float x 绕x轴角度
-- @tparam float y 绕y轴角度
-- @tparam float z 绕z轴角度
M.Euler = function(x, y, z)
	local euler = CS.UnityEngine.Vector3(x, y, z)
	return euler
end
--- 欧拉转向转成朝向
-- @tparam Vector3 euler 欧拉转向
M.Euler2DirXZ = function(euler)
	local heading = M.Deg2Rad(euler.y)
	return M.Dir(math.sin(heading), 0, math.cos(heading))
end
--- 朝向转成欧拉转向
-- @tparam Vector3 dir 朝向
M.Dir2Euler = function(dir)
	return csMath.Forward2Euler(dir)
end
--- XZ平面几乎一致
-- @tparam Vector3 posA 位置坐标A
-- @tparam Vector3 posB 位置坐标B
-- @tparam float maxDist 容忍距离
M.IsSameXZ = function(posA, posB, maxDist)
	if posA.x - posB.x > -maxDist and posA.x - posB.x < maxDist 
	and posA.z - posB.z > -maxDist and posA.z - posB.z < maxDist then
		return true
	end

	return false
end
--- 两点距离
-- @tparam Vector3 posA 位置坐标A
-- @tparam Vector3 posB 位置坐标B
M.Dist = function(posA, posB)
	return CS.UnityEngine.Vector3.Distance(posA, posB)
end
--- 欧式距离几乎一致
M.IsSamePos = function(posA, posB, maxDist)
	local dist = M.Dist(posA, posB)
	if dist < maxDist then
		return true
	end
	
	return false
end

--- 返回一个颜色
M.Color = function(r, g, b, a)
	local color = CS.UnityEngine.Color(r, g, b, a)
	return color
end

return M