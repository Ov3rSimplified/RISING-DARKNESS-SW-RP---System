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
//** [[   PlayerConfig | cl_plyinit.lua   ]] **\\


hook.Add("InitPostEntity", "RDSRP.PlyConfig.Init", function()
    timer.Simple(0, function()
        _RDS.PlayerConfig.Core:ReLoad() -- Config
        _RDS.PlayerConfig.plybind:ReLoad() -- bind
    end)
end)
timer.Simple(0, function() 
    _RDS.PlayerConfig.Core:ReLoad() -- Config
    _RDS.PlayerConfig.plybind:ReLoad() -- bind 
end) 