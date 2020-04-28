

local LuaCall = require 'Common/LuaCall'

local M = {}
local CSM = {}
local RegUI = require('UI/Reg/RegUI')

function CreateSuccess(name)
	local ui = RegUI.UI[name]
	if ui == nil then
		print('No RegUI : '.. name)
		return nil, nil, nil, nil, nil
	end

	-- local init = LuaCall.RegisterVoid(ui.Init, ui);
	-- local onCreated = LuaCall.RegisterOne(ui.OnCreated, ui);
	-- local onEnable = LuaCall.RegisterOne(ui.OnEnable, ui);
	-- local onDisable = LuaCall.RegisterVoid(ui.OnDisable, ui);
	-- local onDestroy = LuaCall.RegisterVoid(ui.OnDestroy, ui);

	local init = ui.Init
	local onCreated = ui.OnCreated
	local onEnable = ui.OnEnable
	local  onDisable = ui.OnDisable
	local onDestroy = ui.OnDestroy

	if ui.Init == nil then
		print('ui.Init is nil')
	end

	if ui.OnCreated == nil then
		print('ui.onCreated is nil')
	end

	return init, onCreated, onEnable, onDisable, onDestroy
end

function M.Init( ... )
	
	CSM = CS.Younne.UIManager
	print('M.2')

	if CSM ~= nil then
			print('CSM ~= nil')
		else
			print('CSM nil'..CSM)
	end


	CSM.Init(CreateSuccess)
		print('M.3')

end

function M.OpenUIForLua(name)
		CSM.OpenUIForLua(name)
end

M.Init()

return M