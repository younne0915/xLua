
--[[
--
--	created by xinpeng.zhao
--
--]]

local rawset = rawset;


GameTime = 
{
	deltaTime_L = 0;
	fixedTime_L = 0;
	realtime_L = 0;
	time_L = 0;
};

GameTime.__newindex = function(t, k, v)
	GameLog.Log("perperty is read only->%s", k);
end

local function Update()
	--GameLog.Log("update GameTime");
	rawset(GameTime, "deltaTime_L", Time.deltaTime * 1000);
	rawset(GameTime, "fixedTime_L", Time.fixedTime * 1000);
	rawset(GameTime, "realtime_L", Time.realtimeSinceStartup * 1000);
	rawset(GameTime, "time_L", Time.time * 1000);
end

UpdateBeat:Add(Update, nil);

--return _GameTime;
