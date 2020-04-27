
--[[
--
--	created by xinpeng.zhao
--
--]]

Limit = class("Limit");

function Limit:ctor()
	self._list = {};
	self._count = 0;
end

--[[
--Re@ int32
--]]
function Limit:AddLimit()
	for i = 1, self._count, 1 do
		if self._list[i] == false then
			self._list[i] = true;
			return i;
		end
	end
	local len = GameUtils.ListCount(self._list);
	GameUtils.ListAdd(self._list, true);
	self._count = len + 1;
	return len + 1;
end

--[[
--@ index int32
--]]
function Limit:DelLimit(index)
	if index < 1 or index > self._count then
		return;
	end
	self._list[index] = false;
end

--[[
--Re@ bool
--]]
function Limit:IsLimit()
	for i = 1, self._count, 1 do
		if self._list[i] == true then
			return true;
		end
	end

	return false;
end

function Limit:Clear()
	self._list = {};
end

return Limit;
