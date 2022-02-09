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
//** [[  escapem | sh_index.lua   ]]** \\
_RDS.Escape = _RDS.Escape or {}

local Load = {
    "gamemode/core/escape/cl_init.lua",
    "gamemode/core/escape/cl_menu.lua",
    "gamemode/core/escape/sv_init.lua",

}
for k,v in ipairs(Load) do   
    _RDS:LoadFile(v) 
end