--reload
dispatch_funcs = {}

function dispatch_funcs.on_level_destroy( ... )
	for k,v in ipairs({...}) do
			print(k,v)
		end
	print("on_level_destroy in lua")
	level.destroy()
end

dispatch_funcs.dispatch_func = function(function_name, ... )
	local fun = dispatch_funcs[function_name]
	if fun ~= nil then
		return fun(...)
	else
		print("get func failed "..function_name)
	end

	return nil
end

return dispatch_funcs
