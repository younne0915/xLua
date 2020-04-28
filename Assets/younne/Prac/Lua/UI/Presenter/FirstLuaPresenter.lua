
local Parent = require "UI/Base/UIPresenter";

local  FirstLuaPresenter = class("FirstLuaPresenter", Parent)

function FirstLuaPresenter:ctor()  
       	UIManager.OpenUIForLua("FirstLuaView")
end  

function New()
	FirstLuaPresenter.new()
end