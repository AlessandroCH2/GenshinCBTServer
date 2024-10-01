function clone(object)
	local lookup_table = {}
	local function _copy(object)
		if type(object) ~= "table" then
			return object
		elseif lookup_table[object] then
			return lookup_table[object]
		end

		local new_table = {}
		lookup_table[object] = new_table
		for k, v in pairs(object) do
			new_table[_copy(k)] = _copy(v)
		end
		return setmetatable(new_table, getmetatable(object))
	end

	return _copy(object)
end

function class(className, super)
	local superType = type(super)
	if superType ~= "table" or super.new == nil then
		super = nil
	end

	local cls = {}
	if super then
		--cls = clone(super)
		cls = super:new()
		setmetatable(cls, super)
	end

	cls.__className = className
	cls.__super = super

	function cls:new(...)
		local o = {}
		cls.__index = cls
		setmetatable(o, cls)
		return o
	end

	return cls
end