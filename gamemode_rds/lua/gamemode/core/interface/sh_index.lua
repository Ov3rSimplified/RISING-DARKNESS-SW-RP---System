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
//** [[   Interface | sh_index.lua   ]]** \\
_RDS.Interface = _RDS.Interface or {}
_RDS.Interface.UI = _RDS.Interface.UI or {}
_RDS.Interface.Shared = _RDS.Interface.Shared or {}

local Load = {
    "gamemode/core/interface/cl_init.lua",
    "gamemode/core/interface/cl_menu.lua",
}
for k,v in ipairs(Load) do   
    _RDS:LoadFile(v) 
end


AddCSLuaFile("gamemode/core/interface/cl_init.lua")
include("gamemode/core/interface/cl_init.lua")

AddCSLuaFile("gamemode/core/interface/cl_menu.lua")
include("gamemode/core/interface/cl_menu.lua")

