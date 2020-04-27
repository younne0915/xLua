
--[[
--
--	created by yongchao.yan
--
--]]


local M = {};
--M.regUI = {};
M.UI = {};


local function REGUI(name)
	if name == nil then
		print("lua reg ui error: name is null");
		return;
	end

	local dpath = "UI/Reg/Data/UID_" .. name;
	local ui_data = require (dpath);
	if ui_data == nil then
		print("lua reg ui error: reg data is not exist");
		return;
	end

	--M.regUI[name] = ui_data;
	M.UI[name] = ui_data;
end


REGUI("FirstLuaView");

return M;

