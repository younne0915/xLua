
--[[
--
--	created by xinpeng.zhao
--
--]]

local Queue = class("Queue");

--function Queue:ctor(_capacity)
function Queue:ctor()
	--self._capacity = _capacity
	self._queue = {};
	self._size = 0;
	self._head = -1;
	self._tail = -1;
end

function Queue:Enqueue(element)
	if self._size == 0 then
		self._head = 0;
		self._tail = 1;
		self._size = 1;
		self._queue[self._tail] = element;
	else
		--local temp = (self._tail + 1) % self._capacity
		--if temp == self._head then
		--	printError("Error: _capacity is full.");
		--	return ;
		--else
		self._tail = self._tail + 1;
		--end

		self._queue[self._tail] = element;
		self._size = self._size + 1;
	end

end

function Queue:Dequeue()
	if self:IsEmpty() then
		--printError("Error: The Queue is empty.")
		return nil;
	end
	self._size = self._size - 1;
	--self._head = (self._head + 1) % self._capacity
	self._head = self._head + 1;
	local value = self._queue[self._head];
	return value;
end

function Queue:Clear()
	self._queue = nil;
	self._queue = {};
	self._size = 0;
	self._head = -1;
	self._tail = -1;
end

function Queue:IsEmpty()
	if self:Size() == 0 then
		return true;
	end
	return false;
end

function Queue:Size()
	return self._size;
end

function Queue:PrintElement()
	local h = self._head;
	local r = self._tail;
	local str = nil;
	local first_flag = true;
	while h ~= r do
		if first_flag == true then
			str = "{"..self._queue[h];
			--h = (h + 1) % self._capacity
			first_flag = false;
		else
			str = str..","..self._queue[h];
			--h = (h + 1) % self._capacity
		end
	end
	str = str..","..self._queue[r].."}";
	print(str);
end

return Queue;
