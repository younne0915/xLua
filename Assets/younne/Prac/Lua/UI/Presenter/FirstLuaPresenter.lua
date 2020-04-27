
local Parent = require "UI/Base/UIPresenter";

local UI = class("UIP_Loading", Parent);

local  FirstLuaCtrl = class()


print('FirstLuaCtrl')

local UIManager = CS.Younne.UIManager.Instance

UIManager:OpenUIForLua('FirstLuaView')