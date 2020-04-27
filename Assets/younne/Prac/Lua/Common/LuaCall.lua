--[[
--
--	created by xinpeng.zhao
--
--]]


local pack = table.pack;
local unpack = table.unpack;


local M = {};

local REG = {};
local curIndex = 0;

local function GenReg(tp, func, funcObj, param) 
	if func == nil then
		GameLog.LogError("lua call gen reg failed: func is null");
	end
	return {_tp = tp, _func = func, _funcObj = funcObj, _param = param};
end

local function OnCall(idx, ...)
	local param = REG[idx];
	if param then
		local _func = param._func;
		if _func then
			if param._funcObj then
				if param._param then
					if #param._param > 0 then
						_func(param._funcObj, unpack(param._param), ...);
					else
						_func(param._funcObj, ...);
					end
				else
					_func(param._funcObj, ...);
				end
			else
				if param._param then
					if #param._param > 0 then
						_func(unpack(param._param), ...);
					else
						_func(...);
					end
				else
					_func(...);
				end
			end
		end
	else
		GameLog.LogError("lua call on void call get nil->%d", idx);
	end
end

function M.ExecuteVoid(idx)
	OnCall(idx);
end

function M.RegisterVoid(func, funcObj, ...)
	--local reg = GenReg(0, func, funcObj, {...});
	local reg = GenReg(0, func, funcObj, pack(...));
	if reg == nil then
		return {call = nil, cid = 0};
	end
	curIndex = curIndex + 1;
	REG[curIndex] = reg;
	return {call = M.ExecuteVoid, cid = curIndex};
end

function M.ExecuteOne(idx, p1)
	--GameLog.LogError("execute one->%s", tostring(p1));
	OnCall(idx, p1);
end

function M.ExecuteThree(idx, p1, p2, p3)
	--GameLog.LogError("execute three->%s, %s, %s", tostring(p1), tostring(p2), tostring(p3));
	OnCall(idx, p1, p2, p3);
end

function M.RegisterOne(func, funcObj, ...)
	--local reg = GenReg(0, func, funcObj, {...});
	local reg = GenReg(0, func, funcObj, pack(...));
	if reg == nil then
		return {call = nil, cid = 0};
	end
	curIndex = curIndex + 1;
	REG[curIndex] = reg;
	return {call = M.ExecuteOne, cid = curIndex};
end

function M.RegisterThree(func, funcObj, ...)
	local reg = GenReg(0, func, funcObj, pack(...));
	if reg == nil then
		return {call = nil, cid = 0};
	end
	curIndex = curIndex + 1;
	REG[curIndex] = reg;
	return {call = M.ExecuteThree, cid = curIndex};
end

--[[
--@ param Register* return value
--]]
function M.UnRegister(param)
	if param then
		local id = param.cid;
		if id then
			REG[id] = nil;
		end
	end
end


return M;


