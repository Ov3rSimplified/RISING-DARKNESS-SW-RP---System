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
//** [[   datapad | sv_net.lua   ]] **\\


--[[
    NetWorkStrings :3
]]

util.AddNetworkString("RDSRP.Datapad.Menu")



--[[
    Startup the Menu
]]
net.Receive("RDSRP.Datapad.Menu", function(len,ply)
    net.Start("RDSRP.Datapad.Menu")
    net.Broadcast()
end)