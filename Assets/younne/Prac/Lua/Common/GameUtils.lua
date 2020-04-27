
--[[
--
--	created by xinpeng.zhao
--
--]]


local rawset = rawset;
local xpcall = xpcall;
--local traceback = traceback;
local traceback = debug.traceback;

local M = {};


local function NewConst(const_table, deep)
    function Const(const_table)
        local mt =
        {
            __index = function (t,k)
                if deep == true and type(const_table[k])=="table" then
                    const_table[k] = NewConst(const_table[k])
                end
                return const_table[k]
            end,
            __newindex = function (t,k,v)
                print("*can't update " .. tostring(const_table) .."[" .. tostring(k) .."] = " .. tostring(v))
            end
        }
        return mt
    end

    local t = {}
    setmetatable(t, Const(const_table))
    return t
end

local function Split(str, delimiter)
	if str==nil or str=='' or delimiter==nil then
		return nil
	end
	
    local result = {}
    for match in (str..delimiter):gmatch("(.-)"..delimiter) do
		--print("split match->" .. match);
        table.insert(result, match)
    end
    return result
end

local function TryCatch(func, ...)
	--local ret, errmsg = pcall(func, ...);
	local ret, errmsg = xpcall(func, traceback, ...);
	if errmsg then
        if GameLog then
            GameLog.LogError("call func error-> %s",errmsg);
        else
            print("call func error->" .. errmsg);
        end
		return false;
	end

	return true;
end

local key = "";

local function PrintTable(table , level)
	level = level or 1
	local indent = ""
	for i = 1, level do
		indent = indent.."  "
	end

	if key ~= "" then
		print(indent..key.." ".."=".." ".."{")
	else
		print(indent .. "{")
	end

	key = ""
	for k,v in pairs(table) do
		if type(v) == "table" then
			key = k
			PrintTable(v, level + 1)
		else
			local content = string.format("%s%s = %s", indent .. "  ",tostring(k), tostring(v))
			print(content)  
		end
	end
	print(indent .. "}")
end

--[[
local function ListAdd(table, v)
	rawset(table, #table + 1, v);
end
--]]

local function DeepCopy(object)      
    local lookup_table = {}  
    local function _copy(object)  
        if type(object) ~= "table" then  
            return object  
        elseif lookup_table[object] then  
  
            return lookup_table[object]  
        end  -- if          
        local new_table = {}  
        lookup_table[object] = new_table  
  
  
        for index, value in pairs(object) do  
            new_table[_copy(index)] = _copy(value)  
        end   
        return setmetatable(new_table, getmetatable(object))      
    end       
    return _copy(object)  
end

--[[
local function ListCount(t)
	return table.getn(t);
end
--]]

local function TableLength(t)
    local count = 0
    for k,v in pairs(t) do
        count = count + 1
    end
    return count
end

--字符拆分
local function ToCharArray(str,returnCharArray)
    local charCount = 0;
    local totalLen = 1;
    local charArray = {};
    repeat 
        local curByte = string.byte(str,totalLen) or 0;
        local curLen = 0;
        if curByte>= 0 and curByte <= 127 then
            --0xxxxxxx
            curLen = 1;
        elseif curByte >= 192 and curByte <= 223 then
            --110xxxxx
            curLen = 2;
        elseif curByte >= 224 and curByte <= 239 then
            --1110xxxx
            curLen = 3;
        elseif curByte >= 240 and curByte <= 247 then
            --11110xxx
            curLen = 4;
        elseif curByte >= 248 and curByte <= 251 then
            --111110xx
            curLen = 5;
        elseif curByte >= 252 and curByte <= 253 then
            --1111110x
            curLen = 6;
        end
        if returnCharArray then
            charArray[#charArray + 1] = string.sub(str,totalLen,totalLen + curLen - 1);
        end
        totalLen = totalLen + curLen;
        charCount = charCount + 1;
    until totalLen > #str
    return charCount,charArray;
end

--M.ListCount = ListCount;
--M.ListAdd = ListAdd;

M.DeepConst = function(t)
	return NewConst(t, true);
end
M.ShallowConst = function(t)
	return NewConst(t, false);
end
M.Split = Split;
M.TryCatch = TryCatch;
M.PrintTable = PrintTable;
M.DeepCopy = DeepCopy;
M.ToCharArray = ToCharArray;
M.TableLength = TableLength;

GameUtils = NewConst(M, true);

--return M;
