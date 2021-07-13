local DilliDalliBeginSession = import('/mods/TechAI/lua/AI/DilliDalli/Mapping.lua').BeginSession

local DilliDalliYeOldeBeginSession = BeginSession
function BeginSession()
    DilliDalliYeOldeBeginSession()
    DilliDalliBeginSession()
end

DilliDalliYeOldeCreateResourceDeposit1 = CreateResourceDeposit
local DilliDalliCreateMarker = import('/mods/TechAI/lua/AI/DilliDalli/Mapping.lua').CreateMarker
CreateResourceDeposit = function(t,x,y,z,size)
    DilliDalliCreateMarker(t,x,y,z,size)
    DilliDalliYeOldeCreateResourceDeposit1(t,x,y,z,size)
end