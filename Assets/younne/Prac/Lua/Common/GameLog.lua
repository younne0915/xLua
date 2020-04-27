
--[[
--
--	created by xinpeng.zhao
--
--]]

local print = print;

local log = {};

local function Log(format, ...)
	GameUtils.TryCatch(print, debug.traceback(string.format(format, ...)));
end

local function LogError(format, ...)
	GameUtils.TryCatch(print, debug.traceback(string.format(format, ...)));
end

local function LogWarning(format, ...)
	GameUtils.TryCatch(print, debug.traceback(string.format(format, ...)));
end

local function PrintStack()
	print(debug.traceback("---------------------------stack---------------------------------"));
end

log.Log = Log;
log.LogError = LogError;
log.LogWarning = LogWarning;
log.PrintStack = PrintStack;

GameLog = {};

--function GameLog.Init(mainThread)
function GameLog.Init(mainThread)
	--log.mainThread = mainThread;
	GameLog = GameUtils.DeepConst(log);
end
