
local Parent = require "UI/Base/UIPresenter";

local  FirstLuaPresenter = class("FirstLuaPresenter", Parent)

FirstLuaPresenter.new()

function FirstLuaPresenter:ctor()  
        print("FirstLuaPresenter:ctor")

       	local uimanager = require('UIManager')
       	uimanager.Init( )
end  