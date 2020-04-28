
print('UID_FirstLuaView')

local UID_FirstLuaView = {}


function UID_FirstLuaView.Init(obj )
	print('Init')
end

function  UID_FirstLuaView.OnCreated( )
	print('OnCreated')
end

function UID_FirstLuaView.OnEnable( )
	-- print('OnEnable')
end


function UID_FirstLuaView.OnDisable( )
	print('OnDisable')
end

function UID_FirstLuaView.OnDestroy( )
	print('OnDestroy')
end

return UID_FirstLuaView