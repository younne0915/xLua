

local LuaCall = require 'LuaCall'

local M = {}
local CSM = 1
local RegUI = require('RegUI')

local function CreateSuccess(name)
	local ui = RegUI[name]
	if ui == nil then
		print('No RegUI : '.. name)
		return nil, nil, nil, nil, nil
	end

	local init = LuaCall.RegisterVoid(ui.Init, ui);
	local onCreated = LuaCall.RegisterOne(ui.OnCreated, ui);
	local onEnable = LuaCall.RegisterOne(ui.OnEnable, ui);
	local onDisable = LuaCall.RegisterVoid(ui.OnDisable, ui);
	local onDestroy = LuaCall.RegisterVoid(ui.OnDestroy, ui);

	return init, onCreated, onEnable, onDisable, onDestroy
end

local function M.Init( )
	CSM = CS.Younne.UIManager.Instance

	CSM.Init(CreateSuccess)
end

local function M.ShowUI(name)
	CSM.ShowUI(name)
end


return M