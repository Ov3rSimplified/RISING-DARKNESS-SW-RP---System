// RISING DARKNESS!
// Copyright (c) 2022 RISING DARKNESS
//--------------------------------------------\\
// Code written for RDS:RP[RISING DARKNESS], 
// they only have the permission to use,
// edit or own the codeline/gamemode. 
//
// Code Written by:
//     - Ov3rSimplified
//     - Rooki
//     -  
//     - 
//     -
//** [[   client | sh_index.lua   ]]** \\
local Load = {
    "gamemode/core/client/cl_hud.lua",
    "gamemode/core/client/cl_scoreboard.lua",
    "gamemode/core/client/stamina/cl_stamina.lua",
    "gamemode/core/client/stamina/sv_stamina.lua",
}
for k,v in ipairs(Load) do   
    _RDS:LoadFile(v) 
end

