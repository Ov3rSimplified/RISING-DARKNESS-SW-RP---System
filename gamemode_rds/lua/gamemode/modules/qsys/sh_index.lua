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
//** [[   qsys | sh_index.lua   ]]** \\
_RDS.QuestSystem = _RDS.QuestSystem or {}
_RDS.QuestSystem.Readall = _RDS.QuestSystem.Readall or {}
local Load = {
    "gamemode/core/qsys/cl_init.lua",
    "gamemode/core/qsys/sh_init.lua",
    "gamemode/core/qsys/sv_init.lua",
}
for k,v in ipairs(Load) do   
    _RDS:LoadFile(v) 
end
