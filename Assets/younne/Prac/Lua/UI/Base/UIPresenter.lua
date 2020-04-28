

local UIPresenter = class("UIPresenter");

function UIPresenter:ctor(data)
	GameLog.Log("ui presenter do create");
	self._data = data;
end

function UIPresenter:Init()
	local data = self._data;
	LuaGlobal.UIManager.RegUIData(data.name, data.sceneName, data.prefab, data.resources);
end

--[[
--@ view UIViewResource
--]]
function UIPresenter:OnCreated(view)
	GameLog.Log("ui presenter on created");
end


local function OnCheckUpdateOver()
	GameLog.Log("on check update over");

	LuaGlobal.CSMsgSub.SendMessage(LuaGlobal.CSMsgSub.G_Init, LuaGlobal.CSMsgSub.U_InitTitle, nil);
end

--[[
--@ view UIViewResource
--]]
function UIPresenter:OnEnable(view)
	GameLog.Log("ui presenter on enable");
	CS.AdaptorResources.CheckUpdate(OnCheckUpdateOver);
end

function UIPresenter:OnDisable()
	GameLog.Log("ui presenter on disable");
end

function UIPresenter:OnDestroy()
	GameLog.Log("ui presenter on destroy");
end

return UIPresenter;

